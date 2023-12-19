import Lake
open Lake DSL

package «duperDemo» {
  -- add any package configuration options here
}

require «mathlib» from git "https://github.com/leanprover-community/mathlib4" @ "v4.4.0-rc1"

require «Duper» from git "https://github.com/leanprover-community/duper.git" @ "v0.0.5"

@[default_target]
lean_lib «duperDemo» {
  -- add library configuration options here
}
