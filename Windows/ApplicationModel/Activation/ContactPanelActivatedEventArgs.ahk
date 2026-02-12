#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactPanelActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include .\IActivatedEventArgsWithUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data when an app is activated because it uses the Contact Panel.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactpanelactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class ContactPanelActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactPanelActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactPanelActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the contact panel.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactpanelactivatedeventargs.contactpanel
     * @type {ContactPanel} 
     */
    ContactPanel {
        get => this.get_ContactPanel()
    }

    /**
     * Gets the selected contact from the Contact Panel.
     * @remarks
     * The selected contact will be an empty contact with only its Id property set.  You must use this Id to re-retrieve the contact from the ContactStore in order to get access to the rest of the contact's property data.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactpanelactivatedeventargs.contact
     * @type {Contact} 
     */
    Contact {
        get => this.get_Contact()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactpanelactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactpanelactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object, which provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactpanelactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the user the app was activated for.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactpanelactivatedeventargs.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ContactPanel} 
     */
    get_ContactPanel() {
        if (!this.HasProp("__IContactPanelActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactPanelActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPanelActivatedEventArgs := IContactPanelActivatedEventArgs(outPtr)
        }

        return this.__IContactPanelActivatedEventArgs.get_ContactPanel()
    }

    /**
     * 
     * @returns {Contact} 
     */
    get_Contact() {
        if (!this.HasProp("__IContactPanelActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactPanelActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPanelActivatedEventArgs := IContactPanelActivatedEventArgs(outPtr)
        }

        return this.__IContactPanelActivatedEventArgs.get_Contact()
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

;@endregion Instance Methods
}
