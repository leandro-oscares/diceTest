# Dice iOS tech-task

The naming convetion adopted in the tests added in this repo follow the name of the tasks requested so they can be better correlated with each one from that list.

### Notes:

The clearUp method was added in the LocationPermissionsUtils instead of including in teardown() because it is only needed in a few tests and it can be considered expensive when running a big suite. I think that including it only when required will be more performant.
