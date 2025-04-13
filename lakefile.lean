import Lake
open Lake DSL

package «duperDemo» {
  -- add any package configuration options here
}

require «mathlib» from git "https://github.com/leanprover-community/mathlib4" @ "v4.18.0"

require «Duper» from git "https://github.com/leanprover-community/duper.git" @ "v0.0.25"

@[default_target]
lean_lib «DuperDemo» {
  -- add library configuration options here
}
