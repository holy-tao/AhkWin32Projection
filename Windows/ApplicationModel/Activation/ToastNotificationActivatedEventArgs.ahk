#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IToastNotificationActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include .\IActivatedEventArgsWithUser.ahk
#Include .\IApplicationViewActivatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about an event that occurs when the app is activated because a user tapped on the body of a toast notification or performed an action inside a toast notification.
 * @remarks
 * ToastNotificationActivatedEventArgs is passed to the event handler that you implement for the activation event that occurs when the app is activated because a user tapped on the body of a toast notification or performed an action inside a toast notification.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.toastnotificationactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class ToastNotificationActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToastNotificationActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToastNotificationActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the arguments that the app can retrieve after it is activated through an interactive toast notification.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.toastnotificationactivatedeventargs.argument
     * @type {HSTRING} 
     */
    Argument {
        get => this.get_Argument()
    }

    /**
     * Gets a set of values that you can use to obtain the user input from an interactive toast notification.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.toastnotificationactivatedeventargs.userinput
     * @type {ValueSet} 
     */
    UserInput {
        get => this.get_UserInput()
    }

    /**
     * Gets the reason for the activation of the app for this event.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.toastnotificationactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before the app was activated because a user tapped on the body of a toast notification or performed an action inside a toast notification.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.toastnotificationactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object that provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.toastnotificationactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the user the app was activated for.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.toastnotificationactivatedeventargs.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Gets the identifier for the currently shown app view.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.toastnotificationactivatedeventargs.currentlyshownapplicationviewid
     * @type {Integer} 
     */
    CurrentlyShownApplicationViewId {
        get => this.get_CurrentlyShownApplicationViewId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Argument() {
        if (!this.HasProp("__IToastNotificationActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IToastNotificationActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationActivatedEventArgs := IToastNotificationActivatedEventArgs(outPtr)
        }

        return this.__IToastNotificationActivatedEventArgs.get_Argument()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_UserInput() {
        if (!this.HasProp("__IToastNotificationActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IToastNotificationActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationActivatedEventArgs := IToastNotificationActivatedEventArgs(outPtr)
        }

        return this.__IToastNotificationActivatedEventArgs.get_UserInput()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreviousExecutionState() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_PreviousExecutionState()
    }

    /**
     * 
     * @returns {SplashScreen} 
     */
    get_SplashScreen() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_SplashScreen()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IActivatedEventArgsWithUser")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgsWithUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgsWithUser := IActivatedEventArgsWithUser(outPtr)
        }

        return this.__IActivatedEventArgsWithUser.get_User()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentlyShownApplicationViewId() {
        if (!this.HasProp("__IApplicationViewActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IApplicationViewActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewActivatedEventArgs := IApplicationViewActivatedEventArgs(outPtr)
        }

        return this.__IApplicationViewActivatedEventArgs.get_CurrentlyShownApplicationViewId()
    }

;@endregion Instance Methods
}
