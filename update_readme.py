import os
from os.path import join

if __name__ == '__main__':
    template = open('template.md', 'r', encoding='utf-8').read()
    data = sorted(os.listdir('data'), reverse=True)

    readme_content_template = open('readme_content_template.md', 'r', encoding='utf-8').read()
    readme_content = "\n\n".join(
        [readme_content_template.format(date=item.replace('.md', ''),url=join('data', item)) for item in data if item.endswith('.md')]
    )
    markdown = template.format(readme_content=readme_content)
    with open('README.md', 'w', encoding='utf-8') as f:
        f.write(markdown)
