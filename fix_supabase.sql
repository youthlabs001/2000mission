-- Supabase 완전 재설정 스크립트
-- 이 스크립트를 Supabase SQL Editor에서 실행하세요

-- 1. 기존 테이블 및 정책 삭제 (있다면)
DROP POLICY IF EXISTS "Users can read own data" ON users;
DROP POLICY IF EXISTS "Admins can update all users" ON users;
DROP POLICY IF EXISTS "Admins can delete users" ON users;
DROP POLICY IF EXISTS "Admins can insert users" ON users;
DROP POLICY IF EXISTS "Anyone can read meetings" ON meetings;
DROP POLICY IF EXISTS "Admins can manage meetings" ON meetings;
DROP POLICY IF EXISTS "Anyone can read programs" ON programs;
DROP POLICY IF EXISTS "Admins can manage programs" ON programs;
DROP POLICY IF EXISTS "Anyone can read schedules" ON schedules;
DROP POLICY IF EXISTS "Admins can manage schedules" ON schedules;

DROP TABLE IF EXISTS schedules CASCADE;
DROP TABLE IF EXISTS programs CASCADE;
DROP TABLE IF EXISTS meetings CASCADE;
DROP TABLE IF EXISTS users CASCADE;

DROP FUNCTION IF EXISTS update_updated_at_column();

-- 2. 사용자 테이블 생성 (RLS 없이)
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username TEXT UNIQUE NOT NULL,
    name TEXT NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL DEFAULT 'user' CHECK (role IN ('admin', 'user')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. 기본 사용자 삽입
INSERT INTO users (username, name, password, role) VALUES
    ('admin', '관리자', 'admin1234', 'admin'),
    ('mission', '선교팀', 'mission2000', 'user');

-- 4. 회의록 테이블
CREATE TABLE meetings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title TEXT NOT NULL,
    meeting_date DATE NOT NULL,
    attendees TEXT,
    agenda TEXT,
    decisions TEXT,
    created_by TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 5. 프로그램 테이블
CREATE TABLE programs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title TEXT NOT NULL,
    emoji TEXT,
    target_audience TEXT,
    duration TEXT,
    content TEXT,
    coordinator TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 6. 일정 테이블
CREATE TABLE schedules (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    day_number INTEGER NOT NULL,
    day_title TEXT NOT NULL,
    schedule_date DATE,
    schedule_content TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 7. RLS 비활성화 (우선 테스트용)
ALTER TABLE users DISABLE ROW LEVEL SECURITY;
ALTER TABLE meetings DISABLE ROW LEVEL SECURITY;
ALTER TABLE programs DISABLE ROW LEVEL SECURITY;
ALTER TABLE schedules DISABLE ROW LEVEL SECURITY;

-- 8. 인덱스 생성
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_users_role ON users(role);

-- 9. 결과 확인
SELECT 
    '✅ 테이블 생성 완료!' as message,
    (SELECT COUNT(*) FROM users) as user_count,
    (SELECT username || ' / ' || password FROM users WHERE role = 'admin' LIMIT 1) as admin_login;
