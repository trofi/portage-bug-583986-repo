How to reproduce a bug:

::

    sudo ACCEPT_KEYWORDS='**' PORTDIR_OVERLAY=. USE=-lib1 emerge -v1 app/app
    sudo ACCEPT_KEYWORDS='**' PORTDIR_OVERLAY=. USE=lib1  emerge -v1 app/app
    qcheck lib/lib

We get the output as:

::

    >>> Emerging (1 of 2) lib/lib-1::portage-bug-583986-repo
    >>> Installing (1 of 2) lib/lib-1::portage-bug-583986-repo
    >>> Emerging (2 of 2) app/app-0::portage-bug-583986-repo
    >>> Installing (2 of 2) app/app-0::portage-bug-583986-repo
    
    Checking lib/lib-1 ...
     AFK: /usr/lib/lib-2
      * 9 out of 10 files are good
