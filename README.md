# DuperDemo

This is a sample project that imports both Duper and Mathlib so that users can easily experiment with Duper. Once the project is built, DuperDemo.lean provides examples of Duper in use.

## Building/Installation

### With the command line

With [elan](https://github.com/leanprover/elan) installed, the following commands should clone and build this project.
```
git clone https://github.com/JOSHCLUNE/DuperDemo.git
cd DuperDemo
lake exe cache get
lake build
```
Once `lake build` completes, you should be able to type `code .` to launch VS Code and look at the examples in DuperDemo.lean.

Note that on some versions of Windows, the build may fail with a 'too many exported symbols' error. If that happens, you can try building with VS Code instead.

### With VS Code

To build this project with VS Code directly, first make sure that the Lean 4 [VS Code extension](https://marketplace.visualstudio.com/items?itemName=leanprover.lean4) is installed and enabled. Then, on the VS Code welcome page, choose "Clone Git repository" and paste [this](https://github.com/JOSHCLUNE/DuperDemo) url. If you do not see "Clone Git repository" on the welcome page, you can also use Ctrl-Shift-P or Command-Shift-P to open the VS Code command palette and enter the command "Git: Clone".

After this project has been cloned, navigate to the project's root directory (the directory that contains this README.md file) and run `lake exe cache get`. Once this command is done running, open DuperDemo.lean in VS Code.

After you open DuperDemo.lean, you will likely see a variety of prompts, potentially asking you to install Lean, rebuild imports, or restart the Lean server. Click the blue buttons on each of them and VS Code will build this project. Note that the first time this project is opened, it may take a couple of minutes to build, though the process should proceed much more quickly after it has successfully been built once.