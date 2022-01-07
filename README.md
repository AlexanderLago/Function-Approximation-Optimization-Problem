# Function-Approximation-Optimization-Problem

Neoclassical Growth Model. 
Robinson Crusoe finds himself alone in a coconut island. Each period he can
choose to eat some of the coconuts and plant some others for the next. Let kt be the amount of coconuts planted in
period t − 1 to be harvested in t. Given kt, the land on the island produces f (kt) = zkα
t
coconuts, so the resource
constraint he faces each period is
ct + kt+1 = f (kt)
which implies that he cannot consume (ct) and save (kt+1) more than what is available (and does not waste any
coconuts). Robinson derives utility from how much he consumes in each period, which is denoted by u (c) = c 1−σ−1
1−σ. Suppose he lives forever and discounts the future at a rate β ∈ (0, 1). He solves the following maximization problem:
maxβtu(ct)
s.t. ct + kt+1 = f (kt) ∀t
ct, kt+1 ≥ 0
where k0 (the amount of coconuts that were planted before he arrived to the island) is given and positive. There
is an infnite number of first-order conditions to this maximization problem (one for each ct and kt+1). Combining
these first-order conditions and the resource constraint, it can be shown that the solution is characterized by infnite
pairs of equations
.
1. Solve the maximization problem (60 Points). Use the collocation method to and the optimal consumption
policy c
∗
t as a function of capital in the beginning of the period kt. That is, consider the functional equation:
g (k, c (k)) = β* u'(c (knext))/u '(c (k)) f'(knext) − 1 = 0 
where knext = f (k) − c (k). You want to approximate
c (k) ≈ cˆ(k) =ajφj (ki)
using n basis functions φ1, φ2, ..., φn associated with n coefficients a1, a2, ..., an and n nodes k1, k2, ..., kn. Do
this with piece-wise cubic splines. Use the parameter values z = 3, α = 0.33, β = 0.96, and σ = 2. Use n = 50
nodes. When you solve the non-linear system of equations to find the vector of coefficients a, use as an initial
guess aj = 0.5 ∗ f (kj ).

2. Check your solution (20 Points). It can be shown that limσ→1
c1−σ−1
1−σ = log (c). For this particular case,
it can also be shown that the optimal savings policy is k∗(k) = αβzkα. Set σ = 1.000001 and use your code
above to approximate the savings policy ˆk∗(k) = f (k) − cˆ(k). Plot ˆk∗(k) and k∗(k) together to make sure
your approximation is good enough (they should be on top of each other). Report the maximum difference
between the two over a fine grid for k.

3. Time path of capital (30 Points). Suppose k0 = 0.1. Use ˆk∗(k) to simulate a time series of capital by
setting kt+1 = ˆk∗(kt) for T = 15 periods. Do this for σ = 2.0 and σ = 0.5 and plot both time series together.
Both series should converge to the same level of steady state capital. Which one converges faster? Interpret
this result.
