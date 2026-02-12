#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILockScreenCallActivatedEventArgs.ahk
#Include .\ILaunchActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include .\IApplicationViewActivatedEventArgs.ahk
#Include .\IViewSwitcherProvider.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event information when communication to and from the lock screen is required.
  * 
  * 
  * 
  * > **JavaScript**
  * > This type appears as [WebUILockScreenCallActivatedEventArgs](../windows.ui.webui/webuilockscreencallactivatedeventargs.md).
 * @remarks
 * This object is accessed when you respond to [Activated](../windows.applicationmodel.core/coreapplicationview_activated.md) events when [ActivationKind](activationkind.md) is **LockScreenCall**.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.lockscreencallactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class LockScreenCallActivatedEventArgs extends IInspectable {
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
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.lockscreencallactivatedeventargs.callui
     * @type {LockScreenCallUI} 
     */
    CallUI {
        get => this.get_CallUI()
    }

    /**
     * Gets the arguments that are passed to the app to launch it.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.lockscreencallactivatedeventargs.arguments
     * @type {HSTRING} 
     */
    Arguments {
        get => this.get_Arguments()
    }

    /**
     * Gets the identifier of the source that launched the app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.lockscreencallactivatedeventargs.tileid
     * @type {HSTRING} 
     */
    TileId {
        get => this.get_TileId()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.lockscreencallactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.lockscreencallactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object, which provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.lockscreencallactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the identifier for the currently shown app view.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.lockscreencallactivatedeventargs.currentlyshownapplicationviewid
     * @type {Integer} 
     */
    CurrentlyShownApplicationViewId {
        get => this.get_CurrentlyShownApplicationViewId()
    }

    /**
     * Gets the view switcher object that allows you to set the view for the application.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.lockscreencallactivatedeventargs.viewswitcher
     * @type {ActivationViewSwitcher} 
     */
    ViewSwitcher {
        get => this.get_ViewSwitcher()
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

;@endregion Instance Methods
}
