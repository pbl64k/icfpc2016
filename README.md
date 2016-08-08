= Team Zygohistomorphic Preproxenomorph, ICFP contest 2016 submission and post-mortem

Ranked 34th at the leaderboard freeze, probably top 50 in lightning, probably *not* top 50 in
the main round.

Well, this was a glorious fiasco. I had really high hopes for this contest, as the hints
seemed to indicate that it was going to be about recursion schemes, of which I'm quite
partial. Of course, the contest turned out to be about actual origami, rather than
about origami programming.

Bummer, I hate geometry. Not as an abstract area of study, but rather its algorithmic
aspect. Algorithms dealing with geometry are... hateful, from my point of view. The
problem also calls for visualization, which is also something that I both hate and am
very bad at. I'm not sure which one is the cause and which is the effect. Maybe they
kinda reinforce each other.

So it was 3am local, the contest just started and I was reading the spec. Friday was a
working day for me. I decided against taking a day off, but I stayed home with the
intention of staying up for the entire duration of the lightning round, taking 8 hours
in the middle of the day to do some work and maybe think about the problem in the
background, and hope for a good lightning round result. That didn't exactly work out as
planned, which is a common phenomenon for me where ICFP contests are concerned.

First thing that became apparent to me was that I was going to need arbitrarily large
rationals. This constrained the choice of the language for me to Haskell, Python and
Racket. I was rather unhappy with Python in 2015, and my familiarity with Racket is
far inferior to my familiarity with Haskell, so Haskell it was. Again, bummer, I was
really hoping to whip out something more exotic, like Hack or Idris. But neither of
those has readily available rationals.

Okay, so I initialized a cabal project -- a step I usually just skip, and I'm not sure
it was worth it here, especially given how little code I wrote -- and decided that I
also needed canned 2D vectors. Uhm... `linear`? Well, yeah... but I have to say I was
a little astounded by the amount of crap it brought in with it. I just wanted strict
pairs of rationals with a tiny bit of algebra on top of them...

I also copied the sample shell scripts for using the contest's REST API, and I
actually employed those for using said API throughout the contest.

I briefly considered something for visualization, but as I said above, I rather hate
it, and the only two options I'm even remotely familiar with are JS canvas (which
would be a pain to work with, and a pain to integrate, or so I felt) and Unity
(c'mon, just humor me). So, no visualization.

I spend the next few hours reading about various geometry algorithms, toying with the
organizers' origami JS app, considering how to even attack the problem, putting
together some types (looking at those, I didn't get enough sleep before the contest
started) and parsers for standard formats. I wasn't making any progress, to be honest.

Then my working day started, and it brought no insights with it. I was considering
various searches and random probing, but I could not see how any of that would work,
even if I could implement all the requisite geometric mojo. The problem statement
made it abundantly clear that perfectly solved problems were worth a lot, while
imprefectly solved ones were likely to be worth very little. And there was the hitch.
I never came up with any viable approach towards attacking arbitrary problems, even
without considering time constraints. I find it very hard to reason about planar
geometry in my brain, although I have to admit that higher-dimensional geometry gives
me even more trouble...

Well, once my working day ended, I had very little in terms of useful geometric
primitives and no plan for moving forward. So I started thrashing around.

First of all, I submitted the unit square as the solution for all the 101 lightning
round problems. That scored me a ton of points and briefly put me in the sixth place,
which was my finest hour during this contest; also, hilarious.

Secondly, I started trying to figure out what was it that we could do that the JS app
did not allow. I have to say ahead of time that I never figured this out in its
entirety -- e.g., squash folds never even occurred to me -- but I did come up with a couple
of problems that looked like they would be hard to solve for people who might think
JS app's folds were all that was allowed. I encoded them by hand and submitted them as
my first few problems for the lightning round. Judging by mid-contest stats, those
turned out to be reasonably resilient, as by that point there were only a couple of
perfect solutions to those. Granted, that likely has changed by the end of the
contest.

As an aside, I was basically giving up on my lightning round rush at this point. Given
the contest formula, an all out attack on lightning required ignoring the construction of
problems for the main round, at least with constrained resources involved in soloing.
Well, jabber.ru did fine, or so it seems. I'm not Alexey, to put it mildly.

While trying to make the problems more complicated to solve, I had a vague notion of
using large primes to... (noise of mental breakdown) In hindsight, the idea was
idiotic, or at least my exection of it was, but I ran with it for a while, and submitted
a bunch of problems that weren't any harder than the default unit square for any
reasonable solver.

So having tinkered with all that for a while, I thought I needed to do a little
better than simply submitting the unit square for the lightning round
solutions. Well, at least here I did come up with an idiotic plan of sorts. Two things
occured to me:

1. Translating the unit square such that its centre would match the centre of the
    target figure should help with the resemblance.
2. Folding the square into a smaller rectangle matching in size the bounding box of
    the target figure should help even further.

Which is exactly what I did. Unfortunately, I was quite groggy at this point, so I made
a stupid mistake in my rectangle folding function, which rendered many of my submitted
solutions invalid. Having tried to identify the problem for about half an hour I gave up
and went to sleep at about T+23. At that point I was somewhere in the top 30, but I don't
recall the exact rank.

I woke up eleven hours later, at about T+34. At this point, I was still in the top 30,
but I soon began slipping as other teams started churning through the problems for real.

So I started hatching the plans for the day. I was more than a bit exhausted and felt
generally disappointed with both the contest and my own performance, so my plans were
more than modest:

1. Find and fix the damn bug.
2. Contrive a bunch of nasty problems -- I needed about twenty more, I think.
3. Write something to automatically download the fresh problems, run the "solver" and
    submit the solutions. The tiny bit of Python glue I used on day one only worked
    for lightning round problems.

Frankly, I didn't even consider coming up with a better, er, actual solver at this
point.

Anyway, the bug turned out to be easy to find, so I moved onto trying to come up with
clever problems.

The next few hours were spent folding tiny pieces of grid paper by
hand and computing/guesstimating the destination coordinates manually. Thankfully, the
server started returning useful information about problems with submitted solutions,
as debugging would have been exceptionally hard otherwise.

My main idea at this point was to reduce information available in the skeleton
descriptions, so I was trying to make heavily overlapped facets. As I was working on this
by hand, I couldn't use many folds, as the number of vertices tends to grow exponentially.
Still, I was reasonably satisfied with the result. While toying with the JS app I also
folded an isosceles triangle, and its skeleton looked weird enough to me that I submitted it as well.
Apparently, the problem of folding any convex polygon is pretty trivial in reality, though.

Finally, I started working on the downloader/solver glue. At this time I fell out of
top 50, and the other two Latvian teams that I know of overcame me. Fixing up the
script was pretty simple, of course, so I soon had my own "solver" churning through
the problems. At this point I started steadily gaining ranks, and while I was preparing
the last few problems by rotating/translating the ones I came up with previously, I
got back into the top 30.

It was T+46, and it was time to plan for tomorrow. My plan was -- leave the solver
running and do nothing.

I don't know, maybe I should have continued tinkering. The thing is, I was absolutely
not enjoying working on geometry, and I didn't have high hopes of achieving any
tangible progress.

I felt that any substantial improvement on my "solver" would be
computationally expensive -- I needed perfect solutions, as imperfect ones simply don't
provide enough of a kick -- and even if I could fix up something working a few hours
before the end, I simply wouldn't have enough time to process and submit enough
solutions to make a difference. So I decided to lay back and just enjoy the rest of
the ride.

Surprisingly, the next day (T+54) started with me still in the top 30. The rank was
fluctuating a bit around #25 far longer than I felt I deserved, but finally, close
to the leaderboard freeze, I started falling like a rock, and at the freeze I
was #34. With six hours to go and the rest of the teams using every dash of brains
and computational power during the final sprint, I think my chances of staying in
the top fifty are very slim.

A couple of hours before the end of the contest I wrote a `README.txt` to run for the
Judges' Prize. Writing it was one of the more enjoyable activities in this contest,
although I'll be extremely surprised if I actually manage to get it. The file is available
as `README.submission` in this repo.

And that was that.

I think that this was the ICFP contest that I enjoyed the least in all my participation
history, with the sole exception of 2010. As with 2010, it wasn't because the problem
was inherently bad (you needn't look further than 2013 for an example of that, as well
as a badly organized contest overall), it's just that it was very alien to me, and
not something even remotely related to the stuff that actually interests me. Well, at
least I didn't finish with no points at all, unlike in 2010.

In any case, the organizers deserve minor kudos for coming up with something different
from the usual game AI fare (2009, 2011, 2012, 2014, 2015), but I wish that something
different was something different *entirely*.

Cheers, till next year.
