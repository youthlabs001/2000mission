-- Admin 계정 재설정 스크립트
-- Supabase SQL Editor에서 실행하세요

-- 1. 현재 사용자 확인
SELECT username, name, role FROM users;

-- 2. Admin 계정 삭제 (있다면)
DELETE FROM users WHERE username = 'admin';

-- 3. 새로운 Admin 계정 생성
INSERT INTO users (username, name, password, role, created_at) 
VALUES ('admin', '관리자', 'admin1234', 'admin', NOW())
ON CONFLICT (username) DO UPDATE 
SET password = 'admin1234', role = 'admin', updated_at = NOW();

-- 4. Mission 계정도 함께 재설정
DELETE FROM users WHERE username = 'mission';

INSERT INTO users (username, name, password, role, created_at) 
VALUES ('mission', '선교팀', 'mission2000', 'user', NOW())
ON CONFLICT (username) DO UPDATE 
SET password = 'mission2000', role = 'user', updated_at = NOW();

-- 5. 결과 확인
SELECT username, name, password, role, created_at FROM users ORDER BY created_at;
