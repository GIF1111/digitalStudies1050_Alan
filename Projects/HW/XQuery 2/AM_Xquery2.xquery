let $quotes := //quote
let $chapters := distinct-values($quotes/ancestor::chapter/@n)
for $chpr in $chapters
(:finds all unique chapters:)
let $chpr-quote-count := count($quotes[ancestor::chapter/@n = $chpr])
(:counts quotes per chapter:)
order by $chpr
(:just checks order to make sure its sorted:)

return (concat ("&#xa;", "Chapter ", $chpr, " has ", $chpr-quote-count, " quotes."))
