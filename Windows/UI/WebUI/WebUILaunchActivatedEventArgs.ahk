#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\ApplicationModel\Activation\ILaunchActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IPrelaunchActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IApplicationViewActivatedEventArgs.ahk
#Include .\IActivatedEventArgsDeferral.ahk
#Include ..\..\ApplicationModel\Activation\IActivatedEventArgsWithUser.ahk
#Include ..\..\ApplicationModel\Activation\ILaunchActivatedEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event information when an app is launched.
 * @remarks
 * This object is accessed when you implement an event handler for the [WinJS.Application.Onactivated](/previous-versions/windows/apps/br212679(v=win.10)) or the [Windows.UI.WebUI.WebUIApplication.activated](webuiapplication_activated.md) events when [ActivationKind](../windows.applicationmodel.activation/activationkind.md) is **launch**.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilaunchactivatedeventargs
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class WebUILaunchActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILaunchActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILaunchActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the arguments that are passed to the app during its launch activation.
     * @remarks
     * These arguments provide additional context for this activation. Similar to command-line arguments, this string can be parsed by an app to determine what action it should take in response to this activation.
     * 
     * > [!NOTE]
     * > An app should always regard the arguments string as untrusted data and must parse and validate the string carefully before taking action based on its contents. Blindly using the arguments string without examining it first can present a security risk.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilaunchactivatedeventargs.arguments
     * @type {HSTRING} 
     */
    Arguments {
        get => this.get_Arguments()
    }

    /**
     * Gets the ID of the source that was invoked to launch the application.
     * @remarks
     * As an example, if the user touches a tile to launch the app, then the source ID retrieved through this property is the tile's ID. The ID of an app's primary tile is the same as its AppUserModelId. Secondary tiles have an ID that is specified when they are created. Most other UI elements will set the source ID as the AppuserModelId of the app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilaunchactivatedeventargs.tileid
     * @type {HSTRING} 
     */
    TileId {
        get => this.get_TileId()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilaunchactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before this activation.
     * @remarks
     * The app uses this information to determine whether it should restore saved state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilaunchactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object that provides information about the transition from the splash screen to the activated app.
     * @remarks
     * This property is only meaningful when the app is activated under a contract that expects a window to be presented. If the contract doesn't require a window or if the app is being activated for a background task, this call will fail.
     * 
     * You can listen for the [SplashScreen.Dismissed](../windows.applicationmodel.activation/splashscreen_dismissed.md) event to trigger additional loading tasks.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilaunchactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets an indication about whether a pre-launch has been activated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilaunchactivatedeventargs.prelaunchactivated
     * @type {Boolean} 
     */
    PrelaunchActivated {
        get => this.get_PrelaunchActivated()
    }

    /**
     * Gets the identifier for the currently shown app view.
     * @remarks
     * When an app calls CurrentlyShownApplicationViewId in the activated event handler of a secondary window (for example, **eventArgs.get_CurrentlyShownApplicationViewId**), it gets the view identifier of the child window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilaunchactivatedeventargs.currentlyshownapplicationviewid
     * @type {Integer} 
     */
    CurrentlyShownApplicationViewId {
        get => this.get_CurrentlyShownApplicationViewId()
    }

    /**
     * Gets the app activated operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilaunchactivatedeventargs.activatedoperation
     * @type {ActivatedOperation} 
     */
    ActivatedOperation {
        get => this.get_ActivatedOperation()
    }

    /**
     * Gets the user that the app was activated for.
     * @remarks
     * This property returns the logged-in user on platforms that only support single-user sessions. For platforms that support multiple users in a session, this property returns the logged-in user that the app was activated for.
     * 
     * This property returns **null** when a multi-user application is activated with no specific user context.
     * 
     * Multi-user apps can use this property to allow or restrict app behavior. For example, you might restrict access to content or features based on the user’s credentials.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilaunchactivatedeventargs.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Gets additional information that is provided when the user launches your app from a tile. This will be **null** if the app is not launched from its tile or if the app is launched on a platform that doesn't support this property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuilaunchactivatedeventargs.tileactivatedinfo
     * @type {TileActivatedInfo} 
     */
    TileActivatedInfo {
        get => this.get_TileActivatedInfo()
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
     * @returns {Boolean} 
     */
    get_PrelaunchActivated() {
        if (!this.HasProp("__IPrelaunchActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrelaunchActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrelaunchActivatedEventArgs := IPrelaunchActivatedEventArgs(outPtr)
        }

        return this.__IPrelaunchActivatedEventArgs.get_PrelaunchActivated()
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
     * @returns {TileActivatedInfo} 
     */
    get_TileActivatedInfo() {
        if (!this.HasProp("__ILaunchActivatedEventArgs2")) {
            if ((queryResult := this.QueryInterface(ILaunchActivatedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILaunchActivatedEventArgs2 := ILaunchActivatedEventArgs2(outPtr)
        }

        return this.__ILaunchActivatedEventArgs2.get_TileActivatedInfo()
    }

;@endregion Instance Methods
}
