#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILaunchActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include .\IApplicationViewActivatedEventArgs.ahk
#Include .\IPrelaunchActivatedEventArgs.ahk
#Include .\IViewSwitcherProvider.ahk
#Include .\ILaunchActivatedEventArgs2.ahk
#Include .\IActivatedEventArgsWithUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event information when an app is launched.
  * 
  * > **JavaScript**
  * > This type appears as [WebUILaunchActivatedEventArgs](../windows.ui.webui/webuilaunchactivatedeventargs.md).
 * @remarks
 * This object is accessed when you respond to [Activated](../windows.applicationmodel.core/coreapplicationview_activated.md) events when [ActivationKind](activationkind.md) is **Launch**.
 * 
 * UWP app using C++, C#, or Visual Basic typically implement activation points by overriding methods of the [Application](../windows.ui.xaml/application.md) object. The default template app.xaml code-behind files always include an override for [OnLaunched](../windows.ui.xaml/application_onlaunched_859642554.md). The default implementation includes initial navigation support and state management through the SuspensionManager helper class.
 * 
 * All [Application](../windows.ui.xaml/application.md) overrides involved in an activation scenario should call [Window.Activate](../windows.ui.xaml/window_activate_1797342875.md) in their implementations.
 * 
 * Avoid performing tasks during launch if they could significantly increase the time required to launch your app. Instead, you can trigger additional loading tasks by listening for the [SplashScreen.Dismissed](splashscreen_dismissed.md) event.
 * 
 * The activation deferral object should not be used to complete complex tasks during activation. Any unhandled errors or exceptions that occur during activation (including deferred activation) will cause the app to crash. If you need to perform network calls or process a number of additional files during activation, consider launching your app to an extended splash screen and then performing these operations. For more information, see [How to display a splash screen for an extended time](/previous-versions/windows/apps/hh700390(v=win.10)).
 * 
 * > [!IMPORTANT]
 * > Apps that require an excessive amount of time to launch may be terminated by the system.
 * 
 * When testing your app, be aware that immediately reactivating an app that has just been terminated will result in a failed activation if the splash screen is still visible.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.launchactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class LaunchActivatedEventArgs extends IInspectable {
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
     * These arguments provide additional context for this activation. Similar to command-line arguments, this string can be parsed by an app to determine what action it should take in response to this activation. This argument string comes from a property such as [SecondaryTile.Arguments](../windows.ui.startscreen/secondarytile_arguments.md) or a toast's XML payload, through the *launch* attribute of the [toast](/uwp/schemas/tiles/toastschema/element-toast) element or the *arguments* attribute of the [command](/uwp/schemas/tiles/toastschema/element-command) element.
     * 
     * 
     * 
     * > [!NOTE]
     * > An app should always regard the arguments string as untrusted data and must parse and validate the string carefully before taking action based on its contents. Blindly using the arguments string without examining it first can present a security risk.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.launchactivatedeventargs.arguments
     * @type {HSTRING} 
     */
    Arguments {
        get => this.get_Arguments()
    }

    /**
     * Gets the ID of the tile that was invoked to launch the app.
     * 
     * 
     * <!-- Launch activations correspond to invocations of tiles (both primary and secondary) as well as toasts. Launch activations also occur when an app is activated for debugging using F5 in Visual Studio.-->
     * @remarks
     * Starting with Windows 10, **TileId** behavior is different for apps that are launched after having been terminated. Previously, the **TileId** always returned the ID of the tile that launched the app. The **TileId** behavior now depends on how the app is reactivated:
     * 
     * | How the app is reactivated | Behavior of TileId |
     * |---|---|
     * | The user switches to the app by using the task switcher or by using the global back key | Returns the empty string `("")`. |
     * | The user taps the app tile | Returns the tile ID. |
     * 
     * The new behavior makes it possible to differentiate between a switch to the app versus a re-launch of the app. If your app uses tile ID information during activation, handle the `TileId==""` case. For example:
     * 
     * 
     * 
     * ```csharp
     * protected override void OnLaunched(LaunchActivatedEventArgs e)
     * {
     * ...
     *   if (e.TileId == "")
     *   {
     *     // resumed from switch/backstack
     *   }
     *   else
     *   {
     *     // resumed from tile launch
     *   }
     * ...
     * }
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.launchactivatedeventargs.tileid
     * @type {HSTRING} 
     */
    TileId {
        get => this.get_TileId()
    }

    /**
     * Gets the reason that this app is being activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.launchactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before this activation.
     * @remarks
     * The app uses this information to determine whether it should restore saved state.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.launchactivatedeventargs.previousexecutionstate
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
     * You can listen for the [SplashScreen.Dismissed](splashscreen_dismissed.md) event to trigger additional loading tasks.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.launchactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the identifier for the currently shown app view.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.launchactivatedeventargs.currentlyshownapplicationviewid
     * @type {Integer} 
     */
    CurrentlyShownApplicationViewId {
        get => this.get_CurrentlyShownApplicationViewId()
    }

    /**
     * Indicates whether the app was pre-launched.
     * @remarks
     * When available system resources allow, the startup performance of UWP app is improved by proactively launching the user’s most frequently used apps in the background. See [Handle app prelaunch](/windows/uwp/launch-resume/handle-app-prelaunch) for details.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.launchactivatedeventargs.prelaunchactivated
     * @type {Boolean} 
     */
    PrelaunchActivated {
        get => this.get_PrelaunchActivated()
    }

    /**
     * Gets the view switcher object that allows you to set the view for the application.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.launchactivatedeventargs.viewswitcher
     * @type {ActivationViewSwitcher} 
     */
    ViewSwitcher {
        get => this.get_ViewSwitcher()
    }

    /**
     * Gets additional information that is provided when the user launches your app from a tile. This will be **null** if the app is not launched from its tile or if the app is launched on a platform that doesn't support this property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.launchactivatedeventargs.tileactivatedinfo
     * @type {TileActivatedInfo} 
     */
    TileActivatedInfo {
        get => this.get_TileActivatedInfo()
    }

    /**
     * Gets the user that the app was activated for.
     * @remarks
     * This property returns the logged-in user on platforms that only support single-user sessions. For platforms that support multiple users in a session, this property returns the logged-in user that the app was activated for.
     * 
     * This property returns **null** when a multi-user application is activated with no specific user context.
     * 
     * Multi-user apps can use this property to allow or restrict app behavior. For example, you might restrict access to content or features based on the user’s credentials.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.launchactivatedeventargs.user
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
