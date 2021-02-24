# 24CardGameCalculator

This repo is an ios application written in swift used to calculate the solutions for the card game Twenty Four. Rules for the card game can be found on the tutorial screen within the application (soon) or below. Under the tutorial for the card game, there is documentation for the codebase's stucture.



## TUTORIAL... How to play Twenty Four?

This is a card game where players (1+) complete rounds. The winner of each round gets a point.

### How does a round of Twenty Four work?

**1. Flip 4 cards.**

Let Ace (A) = 1, Jack (J) = 1, Queen (Q) = 12, King(K) = 13.

You now have four card values: n1, n2, n3, n4.

**2. Use all 4 cards exactly one time to solve for 24.**

You are allawed to use addition (+), subtraction (-), multiplication (x), division(/) along with brackets.

Use BEDMAS for calculations. (https://en.wiktionary.org/wiki/BEDMAS)

*The first person to find a valid solution for 24 using n1, n2, n3 and n4 is the winner of the round.*

**Example:** 

n1 = 1, n2 = 6, n3 = 7, n4 = 9

**Result:**

Card values 1, 6, 7 and 9 have 4 solutions for 24. These are the solutions:

1. ((1 + 7) * (9 - 6)) = 24

2. ((7 + 1) * (9 - 6)) = 24

3. ((9 - 6) * (1 + 7)) = 24

4. ((9 - 6) * (7 + 1)) = 24

## How to play Twenty Something?

This game is the same as Twenty Four with one key difference.

### How does a round of Twenty Something work?

**1. Flip 4 cards.**

Let Ace (A) = 1, Jack (J) == 1, Queen (Q) = 12, King(K) = 13.

You now have four card values: n1, n2, n3, n4.

Let TARGET = 18 + n4. Target will be in between 19 and 31.

**2. Use all 4 cards exactly one time to solve for TARGET.**

You are allawed to use addition (+), subtraction (-), multiplication (x), division(/) along with brackets.

Use BEDMAS for calculations. (https://en.wiktionary.org/wiki/BEDMAS)

*The first person to find a valid solution for 24 using n1, n2, n3 and n4 is the winner of the round.*

**Example:** 

n1 = 1, n2 = 6, n3 = 7, n4 = 9

**Result:**

TARGET = 18 + 9 = 27.

Card values 1, 6, 7 and 9 have 3 solutions for TARGET = 27. These are the solutions:

1. (6 / (1 - 7 / 9)) = 27

2. (6 * (7 - 1) - 9) = 27

3. ((7 - 1) * 6 - 9) = 27

















## DOCUMENTATION

There are three pages, each with view controllers (in PageViewControllers folder): **ViewController, TutorialViewController, InfoViewController**.

**TutorialViewController** and **InfoViewController** are simple view controllers; navigate to these pages from **ViewController** (the app's main page); both of these pages have back buttons for navigation back to the app's main page.

**ViewController** is for the app's main page and it's UI makes use of the views in the **Subviews** folder

### ViewController (the app's main page)

The app's main view has three sections: headerSectionView, inputsSectionView, solutionsSectionView.

The headerSectionView section contains:
- three **ReusableButtonView** subviews (buttons)
- one UIButton.

The inputsSectionView section contains:
- one **TargetTextFieldView** subview (a subview tha)
- four **ReusableTextFieldView** subviews (text fields)
- two **ReusableButtonView** subviews (buttons)

The solutionsSectionView section contains:
- one UITextView
- ome **ReusableButtonView** subview (button)
- one UITableView

### Subviews

- **ReusableButtonView** subview contains a button; this button has a variable label and a variable onClick handler
- **ReusableTextFieldView** subview contains a textfield: each textfield has a variable label
- **SingleSolutionCell** subview just contains simple UILabels, labels are variable
- **TargetTextFieldView** subview is togglable based om which calculator is being used
- **TooltipView** subview just contains a text view, shows temporarily when the user clicks "Calculate Solutions" button while it is disabled
