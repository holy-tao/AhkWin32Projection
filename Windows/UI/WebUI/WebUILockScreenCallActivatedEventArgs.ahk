#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\ApplicationModel\Activation\ILockScreenCallActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\ILaunchActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IApplicationViewActivatedEventArgs.ahk
#Include .\IActivatedEventArgsDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event information when communication to and from the lock screen is required.
 * @remarks
 * This object is accessed when you implement an event handler for the [WinJS.Application.Onactivated](/previous-versions/windows/apps/br212679(v=win.10)) or the [Windows.UI.WebUI.WebUIApplication.activated](webuiapplication_activated.md) events when [ActivationKind](../windows.applicationmodel.activation/activationkind.md) is **lockScreenCall**.
 * 
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilockscreencallactivatedeventargs
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class WebUILockScreenCallActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILockScreenCallActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILockScreenCallActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the UI that handles communication to and from the lock screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilockscreencallactivatedeventargs.callui
     * @type {LockScreenCallUI} 
     */
    CallUI {
        get => this.get_CallUI()
    }

    /**
     * Gets the arguments that are passed to the app during its launch activation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilockscreencallactivatedeventargs.arguments
     * @type {HSTRING} 
     */
    Arguments {
        get => this.get_Arguments()
    }

    /**
     * Gets the identifier of the source that launched the app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilockscreencallactivatedeventargs.tileid
     * @type {HSTRING} 
     */
    TileId {
        get => this.get_TileId()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilockscreencallactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilockscreencallactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object, which provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilockscreencallactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the identifier for the currently shown app view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilockscreencallactivatedeventargs.currentlyshownapplicationviewid
     * @type {Integer} 
     */
    CurrentlyShownApplicationViewId {
        get => this.get_CurrentlyShownApplicationViewId()
    }

    /**
     * Gets the app activated operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilockscreencallactivatedeventargs.activatedoperation
     * @type {ActivatedOperation} 
     */
    ActivatedOperation {
        get => this.get_ActivatedOperation()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {LockScreenCallUI} 
     */
    get_CallUI() {
        if (!this.HasProp("__ILockScreenCallActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILockScreenCallActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenCallActivatedEventArgs := ILockScreenCallActivatedEventArgs(outPtr)
        }

        return this.__ILockScreenCallActivatedEventArgs.get_CallUI()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Arguments() {
        if (!this.HasProp("__ILaunchActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILaunchActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILaunchActivatedEventArgs := ILaunchActivatedEventArgs(outPtr)
        }

        return this.__ILaunchActivatedEventArgs.get_Arguments()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TileId() {
        if (!this.HasProp("__ILaunchActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILaunchActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILaunchActivatedEventArgs := ILaunchActivatedEventArgs(outPtr)
        }

        return this.__ILaunchActivatedEventArgs.get_TileId()
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
     * @returns {ActivatedOperation} 
     */
    get_ActivatedOperation() {
        if (!this.HasProp("__IActivatedEventArgsDeferral")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgsDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgsDeferral := IActivatedEventArgsDeferral(outPtr)
        }

        return this.__IActivatedEventArgsDeferral.get_ActivatedOperation()
    }

;@endregion Instance Methods
}
