import Duper
import Mathlib.Data.Real.Basic
import Mathlib.Tactic

open Function
open BigOperators

/- Enabling trace.duper.printProof allows you to see the proof that Duper output. -/
set_option trace.duper.printProof true in
theorem barber_paradox {person : Type} {shaves : person → person → Prop}
  (h : ∃ b : person, ∀ p : person, (shaves b p ↔ (¬ shaves p p))) : False :=
  by duper [*] {preprocessing := no_preprocessing, inhabitationReasoning := true}

/- `duper?` will output a suggestion of a more specific `duper` call that will call
   just the instance of `duper` that was able to prove the goal. -/
example {G : Type} [hG : Group G] (x y : G) : x * y * y⁻¹ = x :=
  by duper? [inv_mul_cancel, one_mul, mul_assoc]

example (a b : ℝ) : |a| - |b| ≤ |a - b| := by
  duper [sub_le_iff_le_add, sub_add_cancel, abs_add]

/- In this example, `duper` can't solve the original goal on its own, but if `ring` is used to handle
   handle some of the arithmetic and provide just the right lemma, `duper` can get the rest. -/
example {x : ℝ} (h : x ^ 2 = 1) : x = 1 ∨ x = -1 := by
  have h' : x ^ 2 - 1 = (x + 1) * (x - 1) := by ring
  duper [h, h', sub_self, eq_zero_or_eq_zero_of_mul_eq_zero, eq_neg_iff_add_eq_zero, eq_of_sub_eq_zero]

/- This problem will cause Duper to print the message: "Duper determined that this problem requires
   inhabitation reasoning, continuing portfolio mode with it enabled." Since Duper proceeds to solve
   the goal afterwards with a different portfolio instance, no further action needs to be taken. However,
   if Duper went on to fail, rerunning Duper with the `inhabitationReasoning` option set to true
   could be fruitful since Duper would then know to not waste any time on portfolio instances where
   `inhabitationReasoning` is disabled. -/
example (surjg : Surjective g) (surjf : Surjective f) : Surjective (fun x => g (f x)) := by
  duper [Surjective, *]

example (injg : Injective g) (injf : Injective f) : Injective (fun x => g (f x)) := by
  duper [Injective, *]

/- **TODO** These examples worked in old versions of Duper but a change was made to lean-auto's preprocessing
   procedure such that these examples no longer works. Will look into resolving that and will uncomment this
   example once it is working again

/- Attempting to call `duper` directly on the original goal will fail because it isn't able to generate a
   counterexample to Surjf on its own. But if we provide the counterexample, `duper` can solve from there. -/
example : ∀ f : α → Set α, ¬Surjective f := by
  intro f Surjf
  have counterexample := Surjf {i | i ∉ f i}
  duper [Set.mem_setOf_eq, counterexample]

example {s t : Set α} (h : s ⊆ t) : s ∩ u ⊆ t ∩ u := by
  duper [Set.mem_inter_iff, Set.subset_def, h]
-/

example (s : Finset ℝ) : ∑ i in s, (i^2 + 2 * i + 1) =
  ∑ i in s, i^2 + 2 * ∑ i in s, i + ∑ i in s, 1 := by
  duper [Finset.sum_add_distrib, Finset.mul_sum]
