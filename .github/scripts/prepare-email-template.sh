#!/bin/bash

# Email Template Preparation Script
# 邮件模板准备脚本
# 用于根据LANGUAGE变量选择合适的模板并填充变量

set -e  # 遇到错误立即退出

echo "🚀 开始准备邮件模板..."

# 获取传入的参数（GitHub Actions变量）
TODAY="$1"
RUN_STARTED_AT="$2"
RUN_NUMBER="$3"
CATEGORIES="$4"
MODEL_NAME="$5"
LANGUAGE="$6"
REPOSITORY="$7"
RUN_ID="$8"
REF_NAME="$9"
ACTOR="${10}"
EVENT_NAME="${11}"

# 检查参数数量
if [ $# -ne 11 ]; then
    echo "❌ 错误：参数数量不正确"
    echo "用法: $0 TODAY RUN_STARTED_AT RUN_NUMBER CATEGORIES MODEL_NAME LANGUAGE REPOSITORY RUN_ID REF_NAME ACTOR EVENT_NAME"
    exit 1
fi

# 根据LANGUAGE变量选择模板文件
echo "🔍 分析语言设置: $LANGUAGE"
LANGUAGE_LOWER=$(echo "$LANGUAGE" | tr '[:upper:]' '[:lower:]')

if [[ "$LANGUAGE_LOWER" == *"chinese"* ]] || [[ "$LANGUAGE_LOWER" == *"中文"* ]] || [[ "$LANGUAGE" == "cn" ]]; then
    TEMPLATE_FILE=".github/templates/email-notification-cn.html"
    echo "📧 使用中文邮件模板"
    # 计算北京时间 (UTC+8)
    BEIJING_TIME=$(TZ='Asia/Shanghai' date '+%Y-%m-%d %H:%M:%S')
    TIME_TO_REPLACE="$BEIJING_TIME"
else
    TEMPLATE_FILE=".github/templates/email-notification-en.html"
    echo "📧 Using English email template"
    TIME_TO_REPLACE="$RUN_STARTED_AT"
fi

# 检查模板文件是否存在
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "❌ 错误：模板文件不存在: $TEMPLATE_FILE"
    exit 1
fi

# 复制选定的模板文件
echo "📋 复制模板文件..."
cp "$TEMPLATE_FILE" email_template.html

# 检查关键变量是否为空，如果为空则中断脚本
echo "🔍 检查必要变量..."

check_variable() {
    local var_name="$1"
    local var_value="$2"
    
    if [ -z "$var_value" ]; then
        echo "❌ 错误：$var_name 变量为空"
        exit 1
    fi
}

# 检查所有变量
check_variable "TODAY" "$TODAY"
check_variable "CATEGORIES" "$CATEGORIES"
check_variable "MODEL_NAME" "$MODEL_NAME"
check_variable "LANGUAGE" "$LANGUAGE"
check_variable "REPOSITORY" "$REPOSITORY"
check_variable "RUN_STARTED_AT" "$RUN_STARTED_AT"
check_variable "RUN_NUMBER" "$RUN_NUMBER"
check_variable "RUN_ID" "$RUN_ID"
check_variable "REF_NAME" "$REF_NAME"
check_variable "ACTOR" "$ACTOR"
check_variable "EVENT_NAME" "$EVENT_NAME"
check_variable "TIME_TO_REPLACE" "$TIME_TO_REPLACE"

echo "✅ 所有必要变量检查通过"

# 使用sed进行变量替换
echo "🔄 开始变量替换..."

sed -i "s|{{TODAY}}|${TODAY}|g" email_template.html
sed -i "s|{{RUN_STARTED_AT}}|${RUN_STARTED_AT}|g" email_template.html
sed -i "s|{{BEIJING_TIME}}|${TIME_TO_REPLACE}|g" email_template.html
sed -i "s|{{RUN_NUMBER}}|${RUN_NUMBER}|g" email_template.html
sed -i "s|{{CATEGORIES}}|${CATEGORIES}|g" email_template.html
sed -i "s|{{MODEL_NAME}}|${MODEL_NAME}|g" email_template.html
sed -i "s|{{LANGUAGE}}|${LANGUAGE}|g" email_template.html
sed -i "s|{{REPOSITORY}}|${REPOSITORY}|g" email_template.html
sed -i "s|{{RUN_ID}}|${RUN_ID}|g" email_template.html
sed -i "s|{{REF_NAME}}|${REF_NAME}|g" email_template.html
sed -i "s|{{ACTOR}}|${ACTOR}|g" email_template.html
sed -i "s|{{EVENT_NAME}}|${EVENT_NAME}|g" email_template.html

echo "✅ 邮件模板准备完成"
echo "📄 生成的模板文件: email_template.html"

# 显示模板统计信息
if [ -f "email_template.html" ]; then
    TEMPLATE_SIZE=$(wc -l < email_template.html)
    echo "📊 模板文件行数: $TEMPLATE_SIZE"
fi

echo "🎉 邮件模板准备脚本执行完成" 