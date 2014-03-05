MKOFFLINE
=========
How it Works
------------
#. Generation of offline installs starts online (with an USB drive attached).
#. Offline installs need to start from a known software base.(usually a clean OS install).
#. Run the "offline-prep" script to start recording yum's efforts to resolve dependencies.
#. Create an ansible script that performs a normal online install.
#. Execute the ansible install online (without errors).
#. Run the "offline-mkpkg" script which will copy the package directory, and the required rpm's, into a zip file that can be downloaded, and installed offline.   You can give "offline-mkpkg" an optional package name as a parameter.

Why Ansible and Git?
--------------------
The process of refining and debugging code is much facilitated by online tools like git. The installation process is easier to develop, document, and understand using Ansible. Yes, having them included in the offline install package does increase its size somewhat, in the offline use case. But if this becomes an issue, the "offline-prep" can modified at the lines which installs git to remove it from the final offline package.


