-- Анализ результатов классификации

-- 1. Сколько запросов каждого типа
SELECT classification, COUNT(*) as count
FROM requests
GROUP BY classification
ORDER BY count DESC;

-- 2. Топ-10 самых частых URL
SELECT url, COUNT(*) as count
FROM requests
GROUP BY url
ORDER BY count DESC
LIMIT 10;

-- 3. Все атаки (кроме NORMAL)
SELECT id, url, classification
FROM requests
WHERE classification != 'NORMAL'
ORDER BY classification;

-- 4. Поиск фишинговых ссылок с подозрительными доменами
SELECT id, url
FROM requests
WHERE classification = 'PHISHING'
AND (url LIKE '%.tk%' OR url LIKE '%.ml%' OR url LIKE '%.cf%');

-- 5. Статистика по типам с процентами
SELECT 
    classification,
    COUNT(*) as count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) as percent
FROM requests
GROUP BY classification
ORDER BY percent DESC;
