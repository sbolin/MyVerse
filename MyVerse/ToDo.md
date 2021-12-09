#  ToDo
## 1st Priority
~~1. UI: Keyboard dismissal is sort of wonky - return dismissed the keyboard, but pressing the find button does not. Need to set it so pressing find dismisses the keyboard. (FocusState...)

## 2nd Priority
~~2. Change to TrialAdaptiveView, for better look in any orientation~~
~~3. Overall UI is...not the best.~~
1. The verse parsing is just 'ok'. It can parse different ways of entering the verse, but doesn't verify if the verse is actually correct. EG, there is no check on the chapter/verse bounds.
2. Related to 1, if a incorrect verse is entered and search initiated, there is no alert with the error.
3. Number of chapters for each book is in BibleInfo.swift, # verses hard to calc.
~~4. Save last viewed verse - not working (not needed - just search for new verse)

## 3rd Priority
5. macOS app in menubar (drop down, search for verse, then view expands)
