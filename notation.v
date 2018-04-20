Require Import String.

Inductive texp : Type :=
  Texp : string -> list texp -> texp.

Notation "'\\\'value '\\\'" := (Texp value nil).

Example t1: forall _, \\\ "hello" \\\ : texp.