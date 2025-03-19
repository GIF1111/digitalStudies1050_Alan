declare default element namespace "http://www.tei-c.org/ns/1.0"; (:Leave this line in place no matter what:)
(:First, here is an XPath XQuery. The FLWOR statements below do the same thing and more. :)
(:collection('data/')//TEI[descendant::speaker/text() = "Falstaff"]//titleStmt/title => string-join(", ")  :)

(:let $shakes := collection('data/')
let $shakesPlays := $shakes/TEI
let $falstaffPlays := $shakesPlays[.//speaker="Falstaff"]
return $falstaffPlays:)

(:let $shakes := collection('data/')
let $shakesPlays := $shakes/TEI
let $falstaffPlays := $shakesPlays[.//speaker="Falstaff"]
let $falSpeeches := $shakesPlays//sp[child::speaker = "Falstaff"]
let $falTitles := $falstaffPlays//titleStmt/title ! string()
for $play in $falstaffPlays
let $playFalstaffSpeeches := $play//sp[child::speaker = "Falstaff"]
let $playTitle := $play//titleStmt/title
let $countSpeech := $playFalstaffSpeeches => count()   :)

(:can return one or other of the following: :)
(:return $falTitles :)
(:return $countSpeech :)
(: or can give output of both with speeches per play: :)
(:return concat("In ", $playTitle, ", Falstaff speaks ", $countSpeech, " times.")   :)

(: if I wanted to order it by # of speeches, in ascending order,
I could add right above return:
order by $countSpeech
If I wanted it in descending order:
order by $countSpeech descending
:)
(: if I wanted to limit it to, say, those plays where F speaks 10+ times, 
I could add a where statement like this:
where $countSpeech > 10
:)