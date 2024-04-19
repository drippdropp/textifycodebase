# Textify Codebase Tool

When it comes to providing additional context to an AI prompt with respect to a codebase, the best thing is the code itself.

This is a simple tool which walks through a code base and prepares a single output file that can be uploaded or provided to a prompt directly.

## Set Up

Install the Julia programming language. You can download an installer via their site [Julia](https://www.julialang.org) or if you're on Mac OS X, you can install via Brew: `brew install julia`.

Pull down the repository and run `julia` from the package directory. Once in the REPL, access the Julia package manager with `]` and then type `activate .`. Hit delete/backspace to get back to the normal REPL interface and include the package with `using TextifyCodebase`.

Then run `textify_codebase(<PATH TO CODEBASE>)` where you replace `<PATH TO CODEBASE>` with the absolute path to the codebase.
