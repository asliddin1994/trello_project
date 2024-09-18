INSERT INTO workspaces (name, description) VALUES 
('Workspace 1', 'Description for Workspace 1'),
('Workspace 2', 'Description for Workspace 2');

INSERT INTO boards (workspace_id, name, description) VALUES 
(1, 'Board 1', 'Description for Board 1'),
(1, 'Board 2', 'Description for Board 2'),
(2, 'Board 3', 'Description for Board 3');

INSERT INTO lists (board_id, name, position) VALUES 
(1, 'List 1', 1),
(1, 'List 2', 2),
(2, 'List 3', 1),
(3, 'List 4', 1);

INSERT INTO cards (list_id, title, description, due_date, position) VALUES 
(1, 'Card 1', 'Description for Card 1', '2024-09-30', 1),
(1, 'Card 2', 'Description for Card 2', '2024-09-25', 2),
(2, 'Card 3', 'Description for Card 3', NULL, 1),
(3, 'Card 4', 'Description for Card 4', '2024-10-05', 1);

INSERT INTO templates (workspace_id, name, description, template_type) VALUES 
(1, 'Template 1', 'Template for Board', 'board'),
(1, 'Template 2', 'Template for Card', 'card'),
(2, 'Template 3', 'Template for Project', 'project');

INSERT INTO users (name, email, password) VALUES 
('Alice', 'alice@example.com', 'password123'),
('Bob', 'bob@example.com', 'password456'),
('Charlie', 'charlie@example.com', 'password789');

INSERT INTO card_comments (card_id, user_id, comment) VALUES 
(1, 1, 'This is a comment on Card 1 by Alice'),
(2, 2, 'This is a comment on Card 2 by Bob'),
(3, 3, 'This is a comment on Card 3 by Charlie');

INSERT INTO board_members (board_id, user_id, role) VALUES 
(1, 1, 'admin'),
(1, 2, 'member'),
(2, 3, 'member');

INSERT INTO members (workspace_id, user_id, role) VALUES 
(1, 1, 'admin'),
(1, 2, 'member'),
(2, 3, 'member');
