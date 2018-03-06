# hw2.2-converters



## Learning objectives

After completing the assignment, you should have gained experience with:

*   Writing tests
*   Debugging existing programs
*   The horrors of the imperial measurement system

## Deliverables

*   A repo containing at least `converter.rb` and `converter_test.rb`

## Requirements

### Explorer Mode

There's an existing program, available for download [here](https://gist.github.com/dummied/281c71ecf9183137aff94a7fdb806c25), or below:

<pre class="highlight ruby"><span class="highlight-copy-clipboard hint--left hint--rounded hint--no-animate" data-hint="Copy Code"></span>`<span class="c1"># A class to convert units of measurement</span>
<span class="c1"># To use: Converter.new(32).f_to_c == 0</span>
<span class="k">class</span> <span class="nc">Converter</span>

  <span class="kp">attr_accessor</span> <span class="ss">:number</span>

  <span class="k">def</span> <span class="nf">initialize</span><span class="p">(</span><span class="n">number</span><span class="p">)</span>
    <span class="vi">@number</span> <span class="o">=</span> <span class="n">number</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">c_to_f</span>
   <span class="c1"># Multiply by 9, then divide by 5, then add 32</span>
   <span class="c1"># For instance, 12C == 53.6F</span>
   <span class="p">((</span><span class="n">number</span> <span class="o">*</span> <span class="mi">9</span><span class="p">)</span><span class="o">/</span><span class="mi">5</span><span class="p">)</span> <span class="o">+</span> <span class="mi">32</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">f_to_c</span>
    <span class="c1"># Deduct 32, then multiply by 5, then divide by 9</span>
    <span class="c1"># For instance, 23F == -5C</span>
    <span class="p">((</span><span class="n">number</span> <span class="o">-</span> <span class="mi">32</span><span class="p">)</span> <span class="o">*</span> <span class="mi">5</span><span class="p">)</span><span class="o">/</span><span class="mi">9</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">quarts_to_cups</span>
    <span class="c1"># Four cups in a quart</span>
    <span class="c1"># So, 2 quarts == 8 cups</span>
    <span class="n">number</span> <span class="o">*</span> <span class="mi">4</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">cups_to_quarts</span>
    <span class="n">number</span> <span class="o">/</span> <span class="mi">4</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">inches_to_feet</span>
    <span class="n">number</span> <span class="o">/</span> <span class="mi">12</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">feet_to_inches</span>
    <span class="n">number</span> <span class="o">*</span> <span class="mi">12</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">seconds_to_milliseconds</span>
    <span class="c1"># 1000 milliseconds per second</span>
    <span class="n">number</span> <span class="o">*</span> <span class="mi">1000</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">milliseconds_to_seconds</span>
    <span class="n">number</span> <span class="o">/</span> <span class="mi">1000</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">feet_to_miles</span>
    <span class="c1"># A mile is 5280 feet</span>
    <span class="c1"># So, 13200 feet == 2.5 miles</span>
    <span class="n">number</span> <span class="o">/</span> <span class="mi">5280</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">miles_to_feet</span>
    <span class="n">number</span> <span class="o">*</span> <span class="mi">5280</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">feet_to_meters</span>
    <span class="c1"># A meter is 3.28084 feet</span>
    <span class="c1"># So, A mile == 1609.344 meters (when rounded to three decimals)</span>
    <span class="p">(</span><span class="n">number</span> <span class="o">/</span> <span class="mi">3</span><span class="o">.</span><span class="mi">28084</span><span class="p">).</span><span class="nf">round</span><span class="p">(</span><span class="mi">3</span><span class="p">)</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">meters_to_feet</span>
    <span class="n">number</span> <span class="o">*</span> <span class="mi">3</span><span class="o">.</span><span class="mi">28084</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">ounce_to_gram</span>
    <span class="c1"># One ounce == 28.3495 grams</span>
    <span class="n">number</span> <span class="o">*</span> <span class="mi">28</span><span class="o">.</span><span class="mi">3495</span>
  <span class="k">end</span>

  <span class="k">def</span> <span class="nf">gram_to_ounce</span>
    <span class="n">number</span> <span class="o">/</span> <span class="mi">28</span><span class="o">.</span><span class="mi">3495</span>
  <span class="k">end</span>

<span class="k">end</span>` </pre>

It has no tests, and you _strongly_ suspect there are bugs lurking in this program.

So, let's write some tests.

*   Each method (other than the `attr_accessor` methods and `initialize`) should have at least one associated test in `converter_test.rb`
*   Those tests should pass. Of note: Some of these methods have bugs in them. If you run into one, fix it.

### Adventure Mode

*   Write a converter method for days into years. Write the test(s) for this method first. For our purposes, a year is 365.25 days (leap days)
*   Write the opposite conversion, again while writing the tests first.
*   Write two other conversions of your choice.

### Epic Mode

*   Use your now thoroughly tested class in a command line tool. Ask the user for a number and unit, then convert it to it's companion.
*   If a unit has more than one companion, ask the user which unit they'd like to convert it into.
*   Use the [`ruby-tty` tools](https://github.com/piotrmurach/tty) for the above
