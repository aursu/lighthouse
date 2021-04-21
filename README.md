###

```
docker run -ti --rm --shm-size=256m -v $(pwd):/var/lib/lighthouse aursu/centos:8.3.2011-lighthouse --verbose https://www.facebook.com
```

## metrics

### [Web Vitals](https://web.dev/vitals/)

* [Total Blocking Time (TBT)](https://gtmetrix.com/total-blocking-time.html)

  Total Blocking Time (TBT) is a Lighthouse Performance metric introduced in
  2020 that quantifies your page's load responsiveness to user input.

  In the simplest terms, TBT measures the total amount of time your webpage was
  blocked, preventing the user from interacting with your page.

  It is one of the Web Vitals and is a replacement for the field-only First
  Input Delay (FID) metric, seen in PageSpeed Insights.

* [Largest Contentful Paint (LCP)](https://gtmetrix.com/largest-contentful-paint.html)

  Largest Contentful Paint (LCP) is a performance metric introduced in 2020 by
  Lighthouse to better measure the perceived loading experience for users.

  In the simplest terms, LCP measures how long it takes for the largest
  "content element" (e.g., hero image, heading text, etc.) on your page to
  become visible within your visitor's viewport.

  LCP is one of the metrics that make up Google's Web Vitals

* [Cumulative Layout Shift (CLS)](https://gtmetrix.com/cumulative-layout-shift.html)

  Cumulative Layout Shift (CLS) is a performance metric introduced in 2020 by
  Lighthouse to measure the perceived visual stability of a page load.

  Simply put, CLS measures the unexpected shifting of web elements while the
  page is being rendered. This measurement is then quantified as an aggregate
  score of all the individual layout shifts on your page.

  CLS is also one of the metrics that make up Google's Web Vitals

### Loading performance

* [First Contentful Paint (FCP)](https://gtmetrix.com/first-contentful-paint.html)

  First Contentful Paint (FCP) is a performance metric that measures how
  quickly visitors can view actual content (i.e., text, images, video, etc.) on
  your page.

  Your page's FCP is the total time taken from the beginning of your page load
  to the point any content is rendered on the screen.

  A low FCP time contributes to a positive user experience, as your visitors
  perceive the page to be loading fast if content is delivered sooner.