import Mathlib.Data.Real.Basic
import Duper.Tactic
import Mathlib.Tactic

set_option trace.duper.printProof true in
theorem barber_paradox {person : Type} {shaves : person → person → Prop}
  (h : ∃ b : person, ∀ p : person, (shaves b p ↔ (¬ shaves p p))) : False :=
  by duper [*] {preprocessing := no_preprocessing, inhabitationReasoning := true}

-- Based on Mathlib's mul_inv_cancel_right
example {G : Type} [hG : Group G] (x y : G) : x * y * y⁻¹ = x :=
  by duper [mul_left_inv, one_mul, mul_assoc]

-- Based on Mathlib's abs_sub_abs_le_abs_sub
example (a b : ℝ) : |a| - |b| ≤ |a - b| := by
  duper [sub_le_iff_le_add, sub_add_cancel, abs_add]

open Function

example (surjg : Surjective g) (surjf : Surjective f) : Surjective (fun x => g (f x)) := by
  duper [Surjective, *]

example (injg : Injective g) (injf : Injective f) : Injective (fun x => g (f x)) := by
  duper [Injective, *]

example : ∀ f : α → Set α, ¬Surjective f := by
  intro f Surjf
  have counterexample := Surjf {i | i ∉ f i}
  duper [Set.mem_setOf_eq, counterexample]

example {s t : Set α} (h : s ⊆ t) : s ∩ u ⊆ t ∩ u := by
  duper [Set.mem_inter_iff, Set.subset_def, h]
