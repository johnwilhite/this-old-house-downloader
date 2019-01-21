# this-old-house-downloader
Download episodes of This Old House and Ask This Old House from thisoldhouse.com

Dependencies:
- [`youtube-dl`](https://github.com/rg3/youtube-dl)

For Insider episodes, you'll need to create a `cookies.txt` file in the root directory. 
To get your cookies, log into thisoldhouse.com and use [this chrome extension](https://chrome.google.com/webstore/detail/cookiestxt/njabckikapfpffapmjgojcnbfjonfjfg?hl=en) to generate the file.

To download a season:
``` bash
./dl.rb toh-1
```
