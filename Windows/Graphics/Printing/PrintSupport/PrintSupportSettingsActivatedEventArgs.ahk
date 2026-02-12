#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSupportSettingsActivatedEventArgs.ahk
#Include .\IPrintSupportSettingsActivatedEventArgs2.ahk
#Include ..\..\..\ApplicationModel\Activation\IActivatedEventArgs.ahk
#Include ..\..\..\ApplicationModel\Activation\IActivatedEventArgsWithUser.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Enables a print support settings UI extension app to handle the activation parameters for the app.
 * @remarks
 * To create print support settings UI extension, your app must declare a [uap4:Extension](/uwp/schemas/appxpackage/uapmanifestschema/element-uap4-extension) element with the category **windows.printSupportSettingsUI** in its package manifest. When the app is activated, the `OnActivated` method receives a **PrintSupportSettingsActivatedEventArgs** object that provides access to information about the print support UI session.
 * 
 * For more information, see [Print support app design guide](/windows-hardware/drivers/devapps/print-support-app-design-guide).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsettingsactivatedeventargs
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportSettingsActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSupportSettingsActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSupportSettingsActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets info about the current session of the print support settings UI.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsettingsactivatedeventargs.session
     * @type {PrintSupportSettingsUISession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * Gets a [WindowId](/uwp/api/windows.ui.windowid) that identifies the top-level window that triggered the activation.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsettingsactivatedeventargs.ownerwindowid
     * @type {WindowId} 
     */
    OwnerWindowId {
        get => this.get_OwnerWindowId()
    }

    /**
     * Gets a value that specifies the type of activation.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsettingsactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before this activation.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsettingsactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object that provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsettingsactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the user that the app was activated for.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsettingsactivatedeventargs.user
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
     * @returns {PrintSupportSettingsUISession} 
     */
    get_Session() {
        if (!this.HasProp("__IPrintSupportSettingsActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportSettingsActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportSettingsActivatedEventArgs := IPrintSupportSettingsActivatedEventArgs(outPtr)
        }

        return this.__IPrintSupportSettingsActivatedEventArgs.get_Session()
    }

    /**
     * Requests that the activation operation be delayed and gets a deferral object that will be invoked upon completion of the deferred action.
     * @remarks
     * Activation is delayed until the app calls the [Deferral.Complete](/uwp/api/windows.foundation.deferral.complete) method.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportsettingsactivatedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPrintSupportSettingsActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintSupportSettingsActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportSettingsActivatedEventArgs := IPrintSupportSettingsActivatedEventArgs(outPtr)
        }

        return this.__IPrintSupportSettingsActivatedEventArgs.GetDeferral()
    }

    /**
     * 
     * @returns {WindowId} 
     */
    get_OwnerWindowId() {
        if (!this.HasProp("__IPrintSupportSettingsActivatedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IPrintSupportSettingsActivatedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintSupportSettingsActivatedEventArgs2 := IPrintSupportSettingsActivatedEventArgs2(outPtr)
        }

        return this.__IPrintSupportSettingsActivatedEventArgs2.get_OwnerWindowId()
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
