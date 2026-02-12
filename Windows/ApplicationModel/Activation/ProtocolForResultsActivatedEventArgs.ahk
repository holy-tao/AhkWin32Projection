#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProtocolForResultsActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include .\IProtocolActivatedEventArgs.ahk
#Include .\IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData.ahk
#Include .\IApplicationViewActivatedEventArgs.ahk
#Include .\IViewSwitcherProvider.ahk
#Include .\IActivatedEventArgsWithUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Received by an application when it is launched by another application with the expectation that it will return results back to the caller.
 * @remarks
 * You access a ProtocolForResultsActivatedEventArgs object when you implement an event handler that responds to [Activated](../windows.applicationmodel.core/coreapplicationview_activated.md) events when [ActivationKind](activationkind.md) is **ProtocolForResults**.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.protocolforresultsactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class ProtocolForResultsActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProtocolForResultsActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProtocolForResultsActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the **ProtocolForResultsOperation** that you use to signal that your app is ready to return to the app that launched it for results.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.protocolforresultsactivatedeventargs.protocolforresultsoperation
     * @type {ProtocolForResultsOperation} 
     */
    ProtocolForResultsOperation {
        get => this.get_ProtocolForResultsOperation()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.protocolforresultsactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.protocolforresultsactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets a SplashScreen object that provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.protocolforresultsactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the Uniform Resource Identifier (URI) used to activate the app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.protocolforresultsactivatedeventargs.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets the package family name of the application that activated the current application.
     * @remarks
     * If the caller is an unpackaged app (such as an unpackaged desktop app), *CallerPackageFamilyName* will be empty, that is `""`.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.protocolforresultsactivatedeventargs.callerpackagefamilyname
     * @type {HSTRING} 
     */
    CallerPackageFamilyName {
        get => this.get_CallerPackageFamilyName()
    }

    /**
     * Data received from the application that activated the current application.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.protocolforresultsactivatedeventargs.data
     * @type {ValueSet} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * Gets the identifier for the currently shown app view.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.protocolforresultsactivatedeventargs.currentlyshownapplicationviewid
     * @type {Integer} 
     */
    CurrentlyShownApplicationViewId {
        get => this.get_CurrentlyShownApplicationViewId()
    }

    /**
     * Gets the view switcher object that allows you to set the view for the application.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.protocolforresultsactivatedeventargs.viewswitcher
     * @type {ActivationViewSwitcher} 
     */
    ViewSwitcher {
        get => this.get_ViewSwitcher()
    }

    /**
     * Gets the user the app was activated for.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.protocolforresultsactivatedeventargs.user
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
     * @returns {ProtocolForResultsOperation} 
     */
    get_ProtocolForResultsOperation() {
        if (!this.HasProp("__IProtocolForResultsActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IProtocolForResultsActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtocolForResultsActivatedEventArgs := IProtocolForResultsActivatedEventArgs(outPtr)
        }

        return this.__IProtocolForResultsActivatedEventArgs.get_ProtocolForResultsOperation()
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
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IProtocolActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IProtocolActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtocolActivatedEventArgs := IProtocolActivatedEventArgs(outPtr)
        }

        return this.__IProtocolActivatedEventArgs.get_Uri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CallerPackageFamilyName() {
        if (!this.HasProp("__IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData")) {
            if ((queryResult := this.QueryInterface(IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData := IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData(outPtr)
        }

        return this.__IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData.get_CallerPackageFamilyName()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Data() {
        if (!this.HasProp("__IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData")) {
            if ((queryResult := this.QueryInterface(IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData := IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData(outPtr)
        }

        return this.__IProtocolActivatedEventArgsWithCallerPackageFamilyNameAndData.get_Data()
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

    /**
     * 
     * @returns {ActivationViewSwitcher} 
     */
    get_ViewSwitcher() {
        if (!this.HasProp("__IViewSwitcherProvider")) {
            if ((queryResult := this.QueryInterface(IViewSwitcherProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IViewSwitcherProvider := IViewSwitcherProvider(outPtr)
        }

        return this.__IViewSwitcherProvider.get_ViewSwitcher()
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
