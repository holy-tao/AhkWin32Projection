#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnForegroundActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IActivatedEventArgsWithUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Arguments passed with the **Activated** event (see [Application.OnActivated](/uwp/api/windows.ui.xaml.application.onactivated)) when your VPN app is activated in the foreground.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnforegroundactivatedeventargs
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnForegroundActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnForegroundActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnForegroundActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the VPN profile that is active.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnforegroundactivatedeventargs.profilename
     * @type {HSTRING} 
     */
    ProfileName {
        get => this.get_ProfileName()
    }

    /**
     * Gets the set of values that the VPN plug-in provided when it activated your VPN foreground app. See [VpnChannel.ActivateForeground](vpnchannel_activateforeground_291551645.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnforegroundactivatedeventargs.sharedcontext
     * @type {ValueSet} 
     */
    SharedContext {
        get => this.get_SharedContext()
    }

    /**
     * Gets an object representing a VPN foreground operation.
     * 
     * When you're done handling a foreground operation, you must call the [Complete](vpnforegroundactivationoperation_complete_1656373823.md) method of this [VpnForegroundActivationOperation](vpnforegroundactivationoperation.md) object, passing in a [ValueSet](/uwp/api/windows.foundation.collections.valueset) of values that you want to be returned to the [IVpnPlugin.Connect](/uwp/api/windows.networking.vpn.ivpnplugin.connect) call. See [VpnChannel.ActivateForeground](vpnchannel_activateforeground_291551645.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnforegroundactivatedeventargs.activationoperation
     * @type {VpnForegroundActivationOperation} 
     */
    ActivationOperation {
        get => this.get_ActivationOperation()
    }

    /**
     * Gets the reason that this app is being activated.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnforegroundactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state that the app was in prior to this activation.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnforegroundactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object that provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnforegroundactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the user that the app was activated for. Also see [IActivatedEventArgsWithUser.User](/uwp/api/windows.applicationmodel.activation.iactivatedeventargswithuser.user).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnforegroundactivatedeventargs.user
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
    get_ProfileName() {
        if (!this.HasProp("__IVpnForegroundActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVpnForegroundActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnForegroundActivatedEventArgs := IVpnForegroundActivatedEventArgs(outPtr)
        }

        return this.__IVpnForegroundActivatedEventArgs.get_ProfileName()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_SharedContext() {
        if (!this.HasProp("__IVpnForegroundActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVpnForegroundActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnForegroundActivatedEventArgs := IVpnForegroundActivatedEventArgs(outPtr)
        }

        return this.__IVpnForegroundActivatedEventArgs.get_SharedContext()
    }

    /**
     * 
     * @returns {VpnForegroundActivationOperation} 
     */
    get_ActivationOperation() {
        if (!this.HasProp("__IVpnForegroundActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVpnForegroundActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnForegroundActivatedEventArgs := IVpnForegroundActivatedEventArgs(outPtr)
        }

        return this.__IVpnForegroundActivatedEventArgs.get_ActivationOperation()
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
