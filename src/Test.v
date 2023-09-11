From Cpdt Require Import CpdtTactics.

Lemma plus_n_O : forall n, n + 0 = n.
Proof. 
  induction n.
  crush.
  crush.
Qed.