#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnChannelActivityStateChangedArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the ActivityStateChanged event specifying the new VPN channel state (idle or active).
 * @remarks
 * An instance of this class is created externally and passed to your app's handler for the [ActivityStateChanged](vpnchannel_activitystatechange.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannelactivitystatechangedargs
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnChannelActivityStateChangedArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnChannelActivityStateChangedArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnChannelActivityStateChangedArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value identifying whether the VPN channel is idle or active.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannelactivitystatechangedargs.activitystate
     * @type {Integer} 
     */
    ActivityState {
        get => this.get_ActivityState()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActivityState() {
        if (!this.HasProp("__IVpnChannelActivityStateChangedArgs")) {
            if ((queryResult := this.QueryInterface(IVpnChannelActivityStateChangedArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannelActivityStateChangedArgs := IVpnChannelActivityStateChangedArgs(outPtr)
        }

        return this.__IVpnChannelActivityStateChangedArgs.get_ActivityState()
    }

;@endregion Instance Methods
}
