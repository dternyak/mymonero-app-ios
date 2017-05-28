# mymonero-app-ios
Components for the iOS MM app.

Notes:

This is a rough work-in-progress. It is the product of about a week's tinkering, I had hoped to do much more and may return in the future.
The controller code is mostly present, but cosmetic changes still need to be made, these include:

-adding a box shadow to several elements (since this is frequently required throughout the app, my intention was to
write a custom UIView subclass that draws a shadow around the view. Note that it's a bit more complex because of masking conflicts
between the shadow & rounded rect (in essence, clipping to the rounded rect removes the shadow) but it's entirely possible.
I'd use UIBezierPath.

-including external resources from the js project (fonts/disclosure arrow). fixing colours to be exactly the same.

-container borders may need positioning tweaks


Usage:

Keys:

UIDisplayViewController.setAddress()
UIDisplayViewController.setSecretViewKey()
UIDisplayViewController.setSecretSpendKey()

Balance:

UIDisplayView.balanceDisplay.setBalance()
UIDisplayViewController.balanceDisplay.setBalance()




Obviously ignore the copyright statements. They are added by Xcode. License is the same as js-app (do whatever you want with it).

Thanks.

