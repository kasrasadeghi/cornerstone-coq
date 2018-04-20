Require Import String.
Require Import List.

Inductive texp : Type :=
  texp_ : string -> list texp -> texp.

Inductive production : Type :=
  production_ : string -> texp -> production.

Definition rule_name (p : production) :=
  match p with
  | production_ s t => s
  end.

Inductive grammar : Type :=
  | grammar_nil : grammar
  | grammar_cons : production -> grammar -> grammar.

Fixpoint grammar_entries (g : grammar) : list string :=
  match g with
  | grammar_nil => nil
  | grammar_cons p g => rule_name p :: grammar_entries g
  end.

Inductive entry (g : grammar) (s : string) :=
  entry_of_grammar : In s (grammar_entries g) -> entry g s.

Fixpoint validator (t : texp) (g : grammar) (e : entry g).