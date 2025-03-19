let $quotes := //quote
let $chapters := distinct-values($quotes/ancestor::chapter/@n)
for $chpr in $chapters
let $chpr-quote-count := count($quotes[ancestor::chapter/@n = $chpr])
order by $chpr
return (concat ("&#xa;", "Chapter ", $chpr, " has ", $chpr-quote-count, " quotes."))
