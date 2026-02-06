# 🎯 AI-Powered Job Matcher

> An intelligent n8n automation that analyzes your CV and sends you perfectly matched job opportunities from multiple sources—automatically.

## 📋 Overview

Stop manually searching job boards. Upload your CV once, and this system will:
- Parse and understand your skills, experience, and preferences using AI
- Scrape job postings from 5+ sources daily
- Match jobs using semantic search (vector embeddings)
- Send you only the most relevant opportunities with personalized insights

**Live in action:** Upload CV → Get matched jobs in your inbox every morning ☕

---

## ✨ Features

### 🧠 Smart CV Analysis
- Extracts skills, experience level, and preferences using Claude AI
- Converts your CV into vector embeddings for semantic matching
- Stores analysis to avoid reprocessing

### 🔍 Multi-Source Job Scraping
Automatically searches:
- LinkedIn Jobs
- Indeed
- FlexJobs
- Wellfound (AngelList)
- Google Jobs

### 🎯 Intelligent Matching
- **Vector similarity** (40%): Semantic understanding of job fit
- **Keyword matching** (30%): Required skills alignment
- **Experience level** (15%): Seniority matching
- **Location** (10%): Remote/on-site preferences
- **Salary** (5%): Compensation expectations

### 📧 Personalized Notifications
- Sends top 5 matches daily
- AI-generated application tips
- Explains why each job matches your profile

### 🔄 Auto-Updates
- Detects CV changes and re-analyzes
- Only notifies about NEW job postings
- Caches results for efficiency

---

## 🏗️ Architecture
```
┌─────────────┐
│  User Upload│
│     CV      │
└──────┬──────┘
       │
       ▼
┌─────────────────┐
│  Claude AI      │
│  CV Analysis    │
└──────┬──────────┘
       │
       ▼
┌─────────────────┐      ┌──────────────┐
│  Supabase DB    │◄─────┤ Job Scrapers │
│  (pgvector)     │      │  (5 sources) │
└──────┬──────────┘      └──────────────┘
       │
       ▼
┌─────────────────┐
│ Matching Engine │
│ (Vector Search) │
└──────┬──────────┘
       │
       ▼
┌─────────────────┐
│ Email Notif.    │
│ (Top Matches)   │
└─────────────────┘
```

---

## 🚀 Quick Start

### Prerequisites
- n8n (self-hosted or cloud)
- Supabase account
- Anthropic API key (Claude)
- OpenAI API key (embeddings)
- Optional: SerpAPI, RapidAPI

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/ai-job-matcher.git
cd ai-job-matcher
```

2. **Import n8n workflows**
- Open n8n
- Go to Workflows → Import from File
- Import all JSON files from `/workflows` folder

3. **Set up Supabase**
```sql
-- Run the schema in /database/schema.sql
-- Enable pgvector extension
create extension vector;
```

4. **Configure credentials in n8n**
- Anthropic API (Claude)
- OpenAI API
- Supabase connection
- Email service (Gmail/SendGrid)
- Job board APIs (optional)

5. **Set environment variables**
```env
CLAUDE_API_KEY=your_key
OPENAI_API_KEY=your_key
SUPABASE_URL=your_url
SUPABASE_KEY=your_key
```

6. **Activate workflows**
- CV Upload Handler (webhook)
- Job Scraper (scheduled daily)
- Matching Engine (scheduled daily)
- CV Update Handler (webhook)

---

## 📁 Project Structure
```
ai-job-matcher/
├── workflows/
│   ├── 01-cv-upload.json
│   ├── 02-job-scraper.json
│   ├── 03-matching-engine.json
│   └── 04-cv-update.json
├── database/
│   └── schema.sql
├── scripts/
│   ├── cv-parser.js
│   └── matching-algorithm.js
├── docs/
│   ├── architecture.md
│   └── api-reference.md
└── README.md
```

---

## 🛠️ Tech Stack

| Component | Technology |
|-----------|-----------|
| Workflow Engine | n8n |
| Database | Supabase (PostgreSQL + pgvector) |
| AI Analysis | Claude (Anthropic) |
| Embeddings | OpenAI text-embedding-3-small |
| Scraping | Puppeteer, Browserless |
| Proxies | Bright Data |
| Job APIs | SerpAPI, RapidAPI |
| Email | SendGrid / Gmail |

---

## 📊 Matching Algorithm
```javascript
final_score = 
  vector_similarity * 0.40 +
  skill_match * 0.30 +
  experience_match * 0.15 +
  location_match * 0.10 +
  salary_match * 0.05

// Only send jobs with score > 0.65
```

---

## 🎯 Use Cases

- **Active Job Seekers**: Get relevant opportunities without daily searches
- **Passive Candidates**: Stay informed about better opportunities
- **Career Changers**: Discover roles that match transferable skills
- **Recruiters**: Automate candidate-job matching

---

## 🔒 Privacy & Security

- CVs encrypted at rest
- No data sharing with third parties
- GDPR compliant (delete data on request)
- Secure webhook endpoints
- No storage of sensitive personal info (SSN, full address)

---

## 🐛 Known Limitations

- Some job boards may block scrapers (use APIs when possible)
- Embedding costs scale with job volume (~$0.10/1000 jobs)
- Matching quality depends on CV detail
- Rate limits on free APIs

---

## 🚧 Roadmap

- [ ] Add more job sources (Glassdoor, ZipRecruiter)
- [ ] Support multiple languages
- [ ] Mobile app for notifications
- [ ] Interview preparation tips
- [ ] Company research integration
- [ ] Salary negotiation insights
- [ ] Application tracking

---

## 🤝 Contributing

Contributions welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) first.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📝 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file.

Open an issue or reach out on LinkedIn!

**⭐ Star this repo if you find it useful!**
