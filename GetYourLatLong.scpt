--- Find the lat and long of an address using the Location Helper application, and optionally copy the data to the clipboard or search with google
--- really sorry for the crappy variable names...

tell application "Finder"
	activate
	set gottaSHIT to text returned of (display dialog "Search for the latitude and logitude of your location by entering the full address of the location below (include zip code and country)" default answer "" with icon note buttons {"OK"} default button {"OK"})
	tell application "Location Helper"
		set butts to geocode address of gottaSHIT
		set butts to (geocode address of gottaSHIT) as list
		get every item of butts
		set poop to (get every item of butts)
		get item 1 of poop
		set dookie to item 1 of item 1 of poop
		set crap to every item of dookie
		get item 3 of crap
		set theRuns to item 3 of crap
		get every item of theRuns
		set splatter to (get every item of theRuns) as list
		get item 2 of splatter
		set shitEVERYWHERE to (get item 2 of splatter) as list
	end tell
	set AppleScript's text item delimiters to space
	display dialog "The Lat/Long is " & shitEVERYWHERE with icon note buttons {"OK"} default button {"OK"}
	set fuckchyea to button returned of (display dialog "Copy to Clipboard or Search with Google?" with icon note buttons {"Copy to Clipboard", "Search with Google", "Cancel"} default button {"Search with Google"})
	if fuckchyea is "Copy to Clipboard" then
		set tid to AppleScript's text item delimiters
		set AppleScript's text item delimiters to space
		tell application "Finder" to set the clipboard to shitEVERYWHERE as text
		set AppleScript's text item delimiters to tid
	end if
	if fuckchyea is "Search with Google" then
		set tid to AppleScript's text item delimiters
		set AppleScript's text item delimiters to space
		open location "http://www.google.com.au/search?q=" & shitEVERYWHERE
		set AppleScript's text item delimiters to tid
	end if
end tell

--- http://www.scriptogr.am/unforswearing
--- http://www.github.com/unforswearing
--- notes@theforeverarrow.com