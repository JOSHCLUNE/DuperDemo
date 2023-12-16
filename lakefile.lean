import Lake
open Lake DSL

package «duperDemo» {
  -- add any package configuration options here
}

require «mathlib» from git "https://github.com/leanprover-community/mathlib4" @ "4e5518cafc0efd7c7b7d287fa960fce5201908db"

require «Duper» from git "https://github.com/leanprover-community/duper.git" @ "v0.0.4"

@[default_target]
lean_lib «duperDemo» {
  -- add library configuration options here
}
