xquery version "3.0" ;
module namespace synopsx.restxq.synopsx = "synopsx.restxq.synopsx" ;

(:~
 : This module provides the SynopsX REST entries
 :
 : @author SynopsX’ team
 : @since 2025-03
 : @version 3.0
 :
 : This file is part of SynopsX, A lightweight framework for
 : XML corpora publication and exposure.
 :
 : GNU General Public License (GPL) v. 3
 :)

declare namespace rest = "http://exquery.org/ns/restxq" ;
declare namespace file = "http://expath.org/ns/file" ;
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization" ;
declare namespace db = "http://basex.org/modules/db" ;
declare namespace web = "http://basex.org/modules/web" ;
declare namespace update = "http://basex.org/modules/update" ;
declare namespace perm = "http://basex.org/modules/perm" ;
declare namespace user = "http://basex.org/modules/user" ;
declare namespace session = "http://basex.org/modules/session" ;
declare namespace http = "http://expath.org/ns/http-client" ;
declare namespace map = "http://www.w3.org/2005/xpath-functions/map" ;

import module namespace G = "synopsx.globals" at '../globals.xqm' ;

declare default function namespace "synopsx.restxq.synopsx" ;

(:~
 : This resource function redirects to the synopsx’ home or the configuration page
 :)
declare
  %rest:path("/synopsx")
function index() {
  web:redirect(
    if (db:exists("synopsx"))
      then "/synopsx/home"
      else "/synopsx/install"
    )
};

(:~
 : this resource function is the synopsx’ home
 : @todo give contents
 :)
declare
  %rest:path("/synopsx/home")
  %output:method("html")
  %output:html-version("5.0")
function home() {
  <html lang="en">
  <head>
      <link rel="icon" href="https://via.placeholder.com/70x70"/>
      <link rel="stylesheet" href="static/mvp.css"/>

      <meta charset="utf-8"/>
      <meta name="description" content="My description"/>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <title>My title</title>
  </head>

  <body>
      <header>
          <nav>
              <a href="/"><img alt="Logo" src="https://via.placeholder.com/200x70?text=Logo" height="70"/></a>
              <ul>
                  <li>Menu Item 1</li>
                  <li><a href="#section-1">Menu Item 2</a></li>
                  <li>
                    <a href="#">Dropdown Menu Item</a>
                      <ul>
                          <li><a href="#">Sublink with a long name</a></li>
                          <li><a href="#">Short sublink</a></li>
                      </ul>
                  </li>
              </ul>
          </nav>
          <h1>Page Heading with <i>Italics</i> and <u>Underline</u></h1>
          <p>Page Subheading with <mark>highlighting</mark></p>
          <br/>
          <p><a href="#"><i>Italic Link Button</i></a><a href="#"><b>Bold Link Button →</b></a></p>
      </header>
      <main>
          <section id="section-1">
              <header>
                  <h2>Section Heading</h2>
                  <p>Section Subheading</p>
              </header>
              <aside>
                  <h3>Card heading</h3>
                  <p>Card content*</p>
                  <p><small>*with small content</small></p>
              </aside>
              <aside>
                  <h3>Card heading</h3>
                  <p>Card content <sup>with notification</sup></p>
              </aside>
              <aside>
                  <h3>Card heading</h3>
                  <p>Card content</p>
              </aside>
          </section>
          <hr/>
          <section>
              <blockquote>
                  "Quote"
                  <footer><i>- Attribution</i></footer>
              </blockquote>
          </section>
          <hr/>
          <article>
              <h2>Left-aligned header</h2>
              <p>Left-aligned paragraph</p>
              <aside>
                  <p>Article callout</p>
              </aside>
              <ul>
                  <li>List item 1</li>
                  <li>List item 2</li>
              </ul>
              <figure>
                  <img alt="Stock photo" src="https://via.placeholder.com/1080x500?text=Amazing+stock+photo"/>
                  <figcaption><i>Image caption</i></figcaption>
              </figure>
          </article>
          <hr/>
          <div>
              <details>
                  <summary>Expandable title</summary>
                  <p>Revealed content</p>
              </details>
              <details>
                  <summary>Another expandable title</summary>
                  <p>More revealed content</p>
              </details>
              <br/>
              <p>Inline <code>code</code> snippets</p>
              <pre>
                  <code>
  // preformatted code block
                  </code>
              </pre>
          </div>
      </main>
      <footer>
          <hr/>
          <p>
              <small>Contact info</small>
          </p>
      </footer>
  </body>

  </html>
};