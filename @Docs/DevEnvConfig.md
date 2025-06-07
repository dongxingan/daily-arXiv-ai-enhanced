# 开发环境配置

本文档用于指导如何从零开始搭建 `daily-arXiv` 项目的开发环境，以确保环境一致性。

## 1. 先决条件

- **Python**: 版本 `>=3.12`。请从 [Python官网](https://www.python.org/downloads/) 下载并安装。
- **Git**: 用于克隆项目代码。
- **uv**: 一个快速的 Python 包安装和解析器。

## 2. 环境搭建步骤

### 2.1. 克隆项目

```bash
git clone https://github.com/Chi-hong22/daily-arXiv-ai-enhanced.git
cd daily-arXiv-ai-enhanced
```

### 2.2. 安装 uv

我们推荐使用 `uv` 来管理虚拟环境和依赖。`uv` 提供了比 `pip` 和 `venv` 更快的性能。

```bash
# Windows (PowerShell)
irm https://astral.sh/uv/install.ps1 | iex

# macOS / Linux (Shell)
curl -LsSf https://astral.sh/uv/install.sh | sh
```
如果已安装 `pip`, 也可以使用 pip 安装:
```bash
pip install uv
```

### 2.3. 创建虚拟环境

使用 `uv` 创建并激活虚拟环境。

```bash
# 创建虚拟环境
uv venv

# 激活虚拟环境 (Windows PowerShell)
.venv\Scripts\Activate.ps1

# 激活虚拟环境 (macOS/Linux)
source .venv/bin/activate
```

### 2.4. 安装项目依赖

在激活的虚拟环境下，使用 `uv` 安装 `pyproject.toml` 中定义的所有依赖。

```bash
uv pip install -e .
```

这会安装以下核心依赖：
- `arxiv>=2.1.3`
- `dotenv>=0.9.9`
- `langchain>=0.3.20`
- `langchain-openai>=0.3.9`
- `scrapy>=2.12.0`

### 2.5. 配置环境变量

项目使用 `dotenv` 来管理环境变量。你需要创建一个 `.env` 文件来存放敏感信息，例如 API 密钥。

1.  在项目根目录下创建一个名为 `.env` 的文件。
2.  在 `.env` 文件中添加以下内容，并替换为你的实际密钥：

    ```env
    # 示例
    OPENAI_API_KEY="sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    ```

## 3. 验证安装

运行项目提供的脚本或测试，确保所有组件都已正确安装和配置。

```bash
# (示例命令，请根据实际项目结构调整)
sh run.sh
```

至此，开发环境已搭建完毕。 