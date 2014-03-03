MKOFFLINE
=========
How it Works
------------
#. Generation of offline installs starts online (with an USB drive attached).
#. Offline installs need to start from a known software base.(usually a clean OS install).
#. Run the "offline-prep" script to start recording yum's efforts to resolve dependencies.
#. Create an ansible script that performs a normal online install.
#. Execute the ansible install online (without errors).
#. Run the "offline-mkpkg" script which will copy the package directory, and the required rpm's, into a zip file that can be downloaded, and installed offline.

