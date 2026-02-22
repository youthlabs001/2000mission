# 2000 이천 단기선교 관리 시스템

이천 단기선교 준비 및 관리를 위한 웹 애플리케이션입니다.

## 주요 기능

- 📊 **대시보드**: 선교 활동 현황을 한눈에 확인
- 📝 **회의록 관리**: 준비위원회 회의 내용 기록 및 관리
- 🎯 **프로그램 구성**: 7개의 다양한 선교 프로그램 관리
- 📅 **일정 관리**: 4박 5일 세부 일정 관리
- 👥 **사용자 관리**: 로그인 및 권한 관리 시스템
- ⚙️ **관리자 페이지**: 사용자 생성, 수정, 삭제 및 권한 관리

## 기술 스택

- HTML5
- CSS3
- JavaScript (Vanilla)
- **Supabase** (PostgreSQL 데이터베이스)
- Supabase JS SDK

## 시작하기

1. 저장소 클론
```bash
git clone https://github.com/youthlabs001/2000mission.git
cd 2000mission
```

2. Supabase 설정 (이미 구성됨)
   - 프로젝트 ID: `gclbezggtizhasokqdpg`
   - 프로젝트명: 2000mission
   - Supabase URL: `https://gclbezggtizhasokqdpg.supabase.co`
   - 데이터베이스 테이블: users, meetings, programs, schedules
   
   **중요**: `supabase_setup.sql` 파일을 Supabase SQL Editor에서 실행하여 테이블을 생성하세요

3. `index.html` 파일을 브라우저에서 열기

## 로그인 정보

### 관리자 계정
- 아이디: `admin`
- 비밀번호: `admin1234`
- 권한: 모든 기능 접근 가능 + 관리자 페이지

### 일반 사용자 계정
- 아이디: `mission`
- 비밀번호: `mission2000`
- 권한: 대시보드, 회의록, 프로그램, 일정 조회

## 관리자 기능

관리자로 로그인하면 다음 기능을 사용할 수 있습니다:

- ✅ 새로운 사용자 계정 생성
- ✅ 기존 사용자 정보 수정 (이름, 비밀번호, 권한)
- ✅ 사용자 계정 삭제
- ✅ 관리자/일반 사용자 권한 설정

## 프로젝트 구조

```
2000mission/
├── index.html          # 메인 애플리케이션
├── README.md          # 프로젝트 문서
└── .gitignore         # Git 제외 파일
```

## 기여하기

이 프로젝트는 이천 단기선교를 위한 내부 관리 시스템입니다.

## 라이선스

© 2024 2000 이천 단기선교. All rights reserved.

## 문의

- 이메일: mission2000@church.org
- 전화: 010-XXXX-XXXX
