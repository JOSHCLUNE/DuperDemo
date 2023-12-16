# DuperDemo

This is a sample project that imports both Duper and Mathlib so that users can easily experiment with Duper. Once the project is built, DuperDemo.lean provides examples of Duper in use.

## Building/Installation

### With VSCode

To build this project with VSCode directly, first make sure that the Lean 4 [VSCode extension](https://marketplace.visualstudio.com/items?itemName=leanprover.lean4) is installed and enabled. Then, on the VSCode welcome page, choose "Clone Git repository" and paste [this](https://github.com/JOSHCLUNE/DuperDemo) url. If you do not see "Clone Git repository" on the welcome page, you can also use Ctrl-Shift-P or Command-Shift-P to open the VSCode command palette and enter the command "Git: Clone".

After this project has been cloned, navigate to the project's root directory (the directory that contains this README.md file) and run `lake exe cache get`. Once this command is done running, open DuperDemo.lean in VSCode.

After you open DuperDemo.lean, you will likely see a variety of prompts, potentially asking you to install Lean, rebuild imports, or restart the Lean server. Click the blue buttons on each of them and VSCode will build this project. Note that the first time this project is opened, it may take a couple of minutes to build, though the process should proceed much more quickly after it has successfully been built once.

### With the command line

With [elan](https://github.com/leanprover/elan) installed, the following commands should clone and build this project.
```
git clone https://github.com/JOSHCLUNE/DuperDemo.git
cd DuperDemo
lake exe cache get
lake build
```
Unfortunately, Duper and DuperDemo can currently only be built via the command line on Mac and Linux, so Windows users will have to build the project using VSCode directly.