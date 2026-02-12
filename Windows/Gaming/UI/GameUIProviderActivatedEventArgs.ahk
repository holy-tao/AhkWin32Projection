#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameUIProviderActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IActivatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Event arguments associated with a **GameUIProvider** activation. This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, your app cannot use this API.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gameuiprovideractivatedeventargs
 * @namespace Windows.Gaming.UI
 * @version WindowsRuntime 1.4
 */
class GameUIProviderActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameUIProviderActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameUIProviderActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Event arguments associated with a **GameUIProvider** activation. This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, your app cannot use this API.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gameuiprovideractivatedeventargs.gameuiargs
     * @type {ValueSet} 
     */
    GameUIArgs {
        get => this.get_GameUIArgs()
    }

    /**
     * The type of activation. This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, your app cannot use this API.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gameuiprovideractivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * The previous execution state. This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, your app cannot use this API.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gameuiprovideractivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * The app's splash screen. This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, your app cannot use this API.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gameuiprovideractivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_GameUIArgs() {
        if (!this.HasProp("__IGameUIProviderActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGameUIProviderActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameUIProviderActivatedEventArgs := IGameUIProviderActivatedEventArgs(outPtr)
        }

        return this.__IGameUIProviderActivatedEventArgs.get_GameUIArgs()
    }

    /**
     * Signals the experience as complete, and communicates any resulting data back to the calling app. This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, your app cannot use this API.
     * @param {ValueSet} results The resulting data from the **GameUIProvider** app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gameuiprovideractivatedeventargs.reportcompleted
     */
    ReportCompleted(results) {
        if (!this.HasProp("__IGameUIProviderActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGameUIProviderActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameUIProviderActivatedEventArgs := IGameUIProviderActivatedEventArgs(outPtr)
        }

        return this.__IGameUIProviderActivatedEventArgs.ReportCompleted(results)
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

;@endregion Instance Methods
}
