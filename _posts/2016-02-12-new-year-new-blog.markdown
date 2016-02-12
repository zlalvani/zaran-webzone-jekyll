---
layout: post
title:  "New year, new blog"
date:   2016-02-12
categories: update
---
Hi, my name's Zaran. I'm going to post updates on the projects I'm working on here. Let's see how the [Checkers AI](https://rcos.io/projects/zlalvani/checkers-learner/profile) pans out. 

For fun, here's the worst function I've ever written, posted for the sake of posterity:

{% highlight python %}
def printForGnuplot(learn_points, a_star, b_star, which):
	gpScript = open(which + 'script.gp', 'w+')

	ones = open(which + 'ones.dat', 'w+')
	fives = open(which + 'fives.dat', 'w+')
	positive = open(which + 'pos.dat', 'w+')
	negative = open(which + 'neg.dat', 'w+')

	for point in learn_points:
		if point.value == 1:
			ones.write(str(point.avg_int) + " " + str(point.avg_sym) + "\n")
		else:
			fives.write(str(point.avg_int) + " " + str(point.avg_sym) + "\n")


	map_points = []
	pos_points = []
	neg_points = []
	for x in np.arange(-1, 1, .005):
		for y in np.arange(-1, 1, .005):
			map_points.append(Point(x, y, -1))

	for point in map_points:
		if getClassification(point, a_star, b_star, learn_points) > 0:#10.0 ** -1:
			pos_points.append(point)
			positive.write(str(point.avg_int) + " " + str(point.avg_sym) + "\n")
		else:
			neg_points.append(point)
			negative.write(str(point.avg_int) + " " + str(point.avg_sym) + "\n")

	gpScript.write('' \
					+ 'set terminal pngcairo  transparent enhanced size 640, 480\n'
					+ "set output '" + which + "output.png'\n"
					+ 'set samples 800, 800\n' 
					+ 'set title "Digits: 1 vs Not 1, ' + which + '"\n' 
					+ 'set title  font ",20" norotate\n'
					+ 'set xlabel "Average Intensity"\n'
					+ 'set ylabel "Symmetry"\n'
					+ 'set xr [-1:1]\n'
					+ 'set yr [-1:1]\n'
					+ 'unset key\n' 
					+ "plot '" + positive.name + "' title 'Positive' with points pointtype 2 ps .3 linecolor rgb '#e5eeff','"
					+ negative.name + "' title 'Negative' with points pointtype 5 ps .3 linecolor rgb '#ffcccc','"
					+ ones.name + "' title 'Ones' with points pointtype 19 linecolor rgb 'blue','" 
					+ fives.name + "' title 'Not Ones' with points pointtype 2 linecolor rgb 'red'\n")
{% endhighlight %}

Yes, for a time I wrote gnuplot scripts in Python instead of using matplotlib. 
