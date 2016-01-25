---
---

window.dynamics = () ->
    $doc = $(document)
    $header = $('h1')
    $parent = $("""<div></div>""")
    $header.before($parent)
    $headerDiv = $("""<div class="header"></div>""")
    $header.before($headerDiv)
    $headerDiv.append($header)
    $forkRibbons = $('.github-fork-ribbon-wrapper')

    scrollTop = $doc.scrollTop()

    $doc.scroll =>
        newScrollTop = $doc.scrollTop()
        if newScrollTop == scrollTop
            return
        scrollingDown = newScrollTop > scrollTop
        diff = $parent.offset().top - newScrollTop
        if diff >= 0
            diff = 0
            $headerDiv.css {
                position: '',
                width: '',
            }
        else
            $headerDiv.css {
                position: 'fixed',
                top: 0,
                width: $parent.outerWidth true,
            }
            if scrollingDown
                $header.css 'top', -($header.outerHeight true)
                $forkRibbons.each ->
                    $(this).css 'top', -($(this).outerHeight true)
                    $(this).css 'right', ($(this).outerWidth true)
            else
                $header.css 'top', 0
                $forkRibbons.css 'top', 0
                $forkRibbons.css 'right', 0
        scrollTop = newScrollTop
        @

    @
