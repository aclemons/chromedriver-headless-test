Testing chromedriver in headless mode using the selenium ruby-bindings.

Opening a tab, switching to it and taking a screenshot seems to be currently broken.

        $ chromedriver --version
        ChromeDriver 2.30.477691 (6ee44a7247c639c0703f291d320bdf05c1531b57)

        $ chromium --version
        Chromium 59.0.3071.86

        $ google-chrome-beta --version
        Google Chrome 60.0.3112.32 beta

This seems to be expected behaviour though:

https://bugs.chromium.org/p/chromedriver/issues/detail?id=1345
