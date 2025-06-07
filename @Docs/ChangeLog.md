# 版本变更日志

本文档遵循 [语义化版本](https://semver.org/lang/zh-CN/) 规范。

## [0.1.0] - 2025-06-07

### 新增 (Added)

- 初始化项目结构。
- 添加 `daily_arxiv` Scrapy 爬虫，用于从 arXiv 抓取论文ID。
- 集成 `langchain` 和 `langchain-openai` 为后续AI处理奠定基础。
- 搭建初始开发环境配置 (`uv`, `pyproject.toml`)。
- 创建项目文档框架 (`@Docs`)，包括：
    - 开发环境配置 (`DevEnvConfig.md`)
    - 功能规则 (`Feature/daily_arxiv_spider_rules.md`)
    - 变更日志 (`ChangeLog.md`)
    - 功能地图 (`FeatureMap.md`)
    - 常见问题 (`FAQ.md`)
    - 技术债务 (`TechDebt.md`)
    - 提问与开发日志 (`AskLog`, `DevLog`) 