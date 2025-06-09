# About
This tool will daily crawl https://arxiv.org and use LLMs to summarize them.

# How to use
This repo will daily crawl arXiv papers about **cs.CV, cs.GR and cs.CL**, and use **DeepSeek** to summarize the papers in **Chinese**.
If you wish to crawl other arXiv categories, use other LLMs or other languages, please follow the bellow instructions.
Otherwise, you can directly use this repo. Please star it if you like :)

**Instructions:**
1. Fork this repo to your own account
2. Go to: your-own-repo -> Settings -> Secrets and variables -> Actions
3. Go to Secrets. Secrets are encrypted and are used for sensitive data
4. Create two repository secrets named `OPENAI_API_KEY` and `OPENAI_BASE_URL`, and input corresponding values.
5. Go to Variables. Variables are shown as plain text and are used for non-sensitive data
6. Create the following repository variables:
   1. `CATEGORIES`: separate the categories with ",", such as "cs.CL, cs.CV"
   2. `LANGUAGE`: such as "Chinese" or "English"
   3. `MODEL_NAME`: such as "deepseek-chat"
   4. `EMAIL`: your email for push to github
   5. `NAME`: your name for push to github
7. (Optional) **Enable Email Notifications**: To receive daily email notifications when new papers are processed:
   1. Add the following repository secrets for email configuration:
      - `SMTP_SERVER`: SMTP server address (e.g., `smtp.qq.com` for QQ Mail)
      - `SMTP_PORT`: SMTP port (usually `465` for SSL)
      - `SMTP_USERNAME`: your sending email address
      - `SMTP_PASSWORD`: your email password or app-specific password
   2. Create the following repository variables:
      - `NOTIFICATION_EMAIL`: your email address for receiving daily update notifications
   3. For Gmail users: Enable 2-factor authentication and generate an app-specific password
   4. For QQ Mail users: Enable SMTP service and use the authorization code as password
8. Go to your-own-repo -> Actions -> arXiv-daily-ai-enhanced
9. You can manually click **Run workflow** to test if it works well (it may takes about one hour). 
By default, this action will automatically run every day
You can modify it in `.github/workflows/run.yml`
1.  If you wish to modify the content in `README.md`, do not directly edit README.md. You should edit `template.md`.

### For Developers (Local Environment)

We recommend using `uv` for a fast and reliable local development setup.

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Chi-hong22/daily-arXiv-ai-enhanced.git
   cd daily-arXiv-ai-enhanced
   ```
2. **Install `uv` and setup the environment**:
   ```bash
   # Install uv (if you haven't already)
   pip install uv
   # Create and activate virtual environment
   uv venv
   # On Windows: .venv\Scripts\Activate.ps1
   # On macOS/Linux: source .venv/bin/activate
   ```
3. **Install dependencies**:
   ```bash
   uv pip install -e .
   ```
4. **Configure environment variables**:
   Create a `.env` file in the root directory and add your `OPENAI_API_KEY`.

For more detailed instructions, please refer to the [**Development Environment Configuration Document**](@Docs/DevEnvConfig.md).

# 📚 Project Documentation

This project has a complete set of internal documents, located in the `@Docs` directory, to help you better understand the design and details of the project.

- **`@Docs/DevEnvConfig.md`**: How to set up the local development environment from scratch.
- **`@Docs/Feature/`**: Detailed design and implementation rules for each core function.
- **`@Docs/ChangeLog.md`**: Project iteration and version change log.
- **`@Docs/FeatureMap.md`**: Visualized feature map and data flow diagram.
- **`@Docs/TechDebt.md`**: Known technical issues and optimization suggestions.

# To-do list
- [ ]  Replace markdown with GitHub pages front-end.
- [ ]  (From `@Docs/TechDebt.md`) Refactor the arXiv spider to use the official API instead of web scraping for better stability.

# Content
{readme_content}

# Related tools
- ICML, ICLR, NeurIPS list: https://dw-dengwei.github.io/OpenReview-paper-list/index.html

# Star history

[![Star History Chart](https://api.star-history.com/svg?repos=dw-dengwei/daily-arXiv-ai-enhanced&type=Date)](https://www.star-history.com/#dw-dengwei/daily-arXiv-ai-enhanced&Date)
