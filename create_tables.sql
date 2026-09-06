-- Создание таблиц для хранения результатов анализа

CREATE TABLE requests (
    id INT PRIMARY KEY,
    url TEXT NOT NULL,
    text TEXT,
    classification VARCHAR(20) DEFAULT 'NORMAL'
);

CREATE TABLE classifications (
    id INT PRIMARY KEY,
    type VARCHAR(20) NOT NULL UNIQUE,
    description TEXT
);

INSERT INTO classifications (id, type, description) VALUES
(1, 'NORMAL', 'Нормальный запрос'),
(2, 'SQLI', 'SQL-инъекция'),
(3, 'XSS', 'XSS-атака'),
(4, 'PHISHING', 'Фишинговая ссылка');

-- Пример данных
INSERT INTO requests (id, url, text, classification) VALUES
(1, 'http://example.com', 'SELECT * FROM users', 'SQLI'),
(2, 'http://example.com', '<script>alert(1)</script>', 'XSS'),
(3, 'http://g00gle.com', 'login password', 'PHISHING'),
(4, 'http://example.com', 'normal request', 'NORMAL');
