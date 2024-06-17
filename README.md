# OPE Tool

This tool is designed to facilitate the management of projects within the Open Publishing Environment (OPE). It includes a variety of functions for handling repositories, books, containers, and course creation.

## User Guide
Before you install the ope tool and create your own open source textbook with the tool, make sure you have the dependencies you need by running:

```pip install jupyter-book```

```pip install ghp-import```

Installation instructions:
1. Clone the directory ````git clone git@github.com:OPEFFORT/tools.git``` 
2. Run the command: ```./install.sh```

Your environment should be set up, and you can use the ope tool to create your project. 
To test if the ope is installed, run ```ope```, if it is insalled, a list of ope commands should print on your terminal

How to create a new project:
1. Create a new github repository from the web UI 
2. In the terminal, run ope new_project [repo-url]. 
- The repo-url is an optional argument, if you would like to add it later on, use the ope repo_add command later
3. Refresh your github repository from the Web UI, the repository should be populated with tools for your first ope book

You have now created your first project, and can create a new textbook

How to create and edit a new book:
1. Enter back into the terminal and cd into the books folder and the run:
- ```ope new_book <your-book-name>```
2. Your book is now made, cd into the content folder, once in the content folder, 
three files must be modified:
3. your-text-book-name_config.yml file
- edit the title, name, url (keeping github at the root and replacing joyvan) and copyright year
4. your-text-book-name_intro.md file
- this file will be your books introduction, edit it to populate your landing page
5. your-text-book-name_toc.yml, this file will contain your intended structure for your textbook
6. To add chapters or sections to this book, add the text under this line, under parts, where each file or section is the path to the chapter content
```
 - caption: 'Name of section'
    numbered: true
    chapters:
    - file: directory/file
    sections: 
    - file: dummy_part/section
```
If you don't want your chapters to be numbered, change numbered to false

7. To have content where that chapter will be, create a folder in the content folder, following the path you wrote in the previous step
  - For example, if I placed a chapter in introduction/intro/chapter1, in content I would create a directory introduction, and within that directory create another directory, intro. Within intro I would make a file called chapter1.ipynb
  - Remember to add the .ipynb, even though the path you wrote in the toc.yml file does not include it
  - If you need a sample .ipynb file, you can look at or even copy the what's in the dummy file as a template
8. Continue this process until your textbook structure is layed out and your folders are populated with the corresponding .ipynb's
9. To see what your textbook looks like, go into the books folder and run ```ope build``` and copy and paste the provided link in your browser
  - If you are having issue using the command, ensure that you are in a folder with the Makefile


Publishing your textbook:

1. While in the books folder with the Makefile, which should share the title of your book, run ```ope pub```
2. You can now check github, where a second branch called gh-pages, for github pages, should be published
3. Check the actions tab, and wait until your textbook is deployed
4. Go to settings, and then under pages, then click on the link where it says your site is live
5. Once you are on the site, it will give you a 404 error, do not worry, that's normal, just add your book's name at the end of the url, and your textbook will be hosted. Now your book should be published and accessible by anyone!



Common mistakes:
- If you're getting issues with Make, make sure you are running ope build and ope pub in the folder with the Makefile
- If nothing is appearing on your site, make sure your .ipynbs have titles
- If there are issues with what's being pushed to github, make sure you're running the ope commands in the correct directories
- If you get resource authorization issues, make sure you're logged into docker before running ```make push```, you can use the ```docker login quay.io``` command to login

If you have any other questions or need additional help in the process: checkout https://www.youtube.com/watch?v=-_0HD_oAK5o&list=LL

## Usage
Each function in the script is intended for specific tasks. Below are the usages and descriptions for each function.

### General

- **Usage**: Run the tool with a specific command and relevant arguments.
- **Command**: `ope <function> [arguments]`

### new_project

- **Description**: Creates a new OPE project from templates.
- **Usage**: `ope new_project <project_name> [repo_url]`
- **Arguments**:
  - `project_name`: Name of the new project.
  - `repo_url` (optional): URL of the Git repository to associate with the project.

### new_book

- **Description**: Creates a new book within the project.
- **Usage**: `ope new_book <book_name>`
- **Arguments**:
  - `book_name`: Name of the new book.

### new_container

- **Description**: Adds source for building a new container for the project.
- **Usage**: `ope new_container <container_name>`
- **Arguments**:
  - `container_name`: Name of the new container.

### new_course

- **Description**: Creates a new course with a standard set of books and a container.
- **Usage**: `ope new_course <course_name> [repo_url]`
- **Arguments**:
  - `course_name`: Name of the new course.
  - `repo_url` (optional): URL of the Git repository for the course.

### update

- **Description**: Updates and rebases changes from the OPE framework.
- **Usage**: `ope update`
- No arguments required.

### Helper Functions

- **`repo_add`**: Adds a repository to a project.
- **`findprojectdir`**: Finds the project directory.
- **`projectdir`**: Outputs the project directory.
- **`new_part`**: Creates a new part in a book or course.
- **`print_func_page`**: Prints the help page for functions.
- **`Usage`**: Prints general usage information.

### Logging and Configuration

- The script includes logging functionality. Check `/tmp/ope.<process_id>.log` for logs.
- Color configuration is included for better readability of output.


## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
