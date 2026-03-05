README
================
Joshua Dwyer-Thiem
2026-03-03

## Scylla serrata map

This repository contains the code and output of a GIS workflow used to
make an interactive map of *Scylla serrata* occurrences in South Africa.

*Scylla serrata* (known commonly as the Mud crab) is a large carnivorous
crab that inhabits estuarine ecosystems. It’s found in tropical and
subtropical environments world wide. In South Africa from the south
eastern coast upwards along the east coast.

<div class="figure" style="text-align: center">

<img src="images/Scylla_serrata.png" alt="Scylla serrata" width="60%" />
<p class="caption">

Scylla serrata
</p>

</div>

I have created an interactive map of research grade Mud crab occurrences
from iNaturalist. Each occurrence point can be clicked on and the link
to its iNaturalist observation, the user name of the observer and the
date observed will pop up. Each occurrence point is coloured based on
its positional accuracy. This was done in order to give the viewer some
sense of whether the crab actually occurs in the habitat pictured on the
map.

The code for my map can be found in my code folder. All of the required
packages are in the install.r file, please run this before running the
rest of the code. The markdown document Scylla-map contains my clean
code and the raw code script is called Scylla-map-raw.
