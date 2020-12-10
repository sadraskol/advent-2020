------------------------------ MODULE Advent10 ------------------------------
EXTENDS Naturals, Sequences, TLC, SequencesExt

Input == <<
103,
131,
121,
151,
118,
12,
7,
2,
90,
74,
160,
58,
15,
83,
153,
140,
166,
1,
148,
33,
165,
39,
100,
135,
68,
77,
25,
9,
54,
94,
101,
55,
141,
22,
97,
35,
57,
117,
102,
64,
109,
114,
56,
51,
125,
82,
154,
142,
155,
45,
75,
158,
120,
5,
19,
61,
34,
128,
106,
88,
84,
137,
96,
136,
27,
6,
21,
89,
69,
162,
112,
127,
119,
161,
38,
42,
134,
20,
81,
48,
73,
87,
26,
95,
146,
113,
76,
32,
70,
8,
18,
67,
124,
80,
93,
29,
126,
147,
28,
152,
145,
159
>>

SimpleInput == <<
16,
10,
15,
5,
1,
11,
7,
19,
6,
12,
4
>>

Sample == <<
28,
33,
18,
42,
31,
14,
46,
20,
48,
47,
24,
23,
49,
45,
19,
38,
39,
11,
1,
32,
25,
35,
8,
17,
7,
9,
4,
2,
34,
10,
3
>>

In == Input

SmallStep == 1
BigStep == 3

(*
VARIABLE history, current

Init == /\ history = <<>>
        /\ current = 0

Next == \/ \E i \in DOMAIN In:
               /\ In[i] = current + SmallStep
               /\ current' = current + SmallStep
               /\ history' = Append(history, SmallStep) 
        \/ /\ ~\E i \in DOMAIN In: In[i] = current + SmallStep
           /\ \E i \in DOMAIN In: 
               /\ In[i] = current + BigStep
               /\ current' = current + BigStep
               /\ history' = Append(history, BigStep)

Solution == <<Len(SelectSeq(history \o <<BigStep>>, LAMBDA x: x = SmallStep)), Len(SelectSeq(history \o <<BigStep>>, LAMBDA x: x = BigStep))>>
*)

VARIABLE pc, i, j, k

Range(seq) == {seq[x]: x \in 1..Len(seq)}

Goal == CHOOSE max \in Range(In): \A x \in Range(In): x <= max

Init == /\ pc = 1
        /\ i = 1
        /\ j = 0
        /\ k = 0

Next == /\ pc' = pc + 1
        /\ pc <= Goal
        /\ \/ /\ pc \notin Range(In)
              /\ i' = 0
              /\ j' = i
              /\ k' = j
           \/ /\ pc \in Range(In)
              /\ i' = i + j + k
              /\ j' = i
              /\ k' = j



=============================================================================
\* Modification History
\* Last modified Thu Dec 10 16:27:44 CET 2020 by thomas
\* Created Thu Dec 10 13:28:03 CET 2020 by thomas
