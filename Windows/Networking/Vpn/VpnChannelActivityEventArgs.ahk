#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnChannelActivityEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * **VpnChannelActivityEventArgs** is not supported and may be altered or unavailable in the future. Instead, use [VpnChannelActivityStateChangedArgs](vpnchannelactivitystatechangedargs.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannelactivityeventargs
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnChannelActivityEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnChannelActivityEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnChannelActivityEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **VpnChannelActivityEventArgs** is not supported and may be altered or unavailable in the future. Instead, use [VpnChannelActivityStateChangedArgs](vpnchannelactivitystatechangedargs.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannelactivityeventargs.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
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
    get_Type() {
        if (!this.HasProp("__IVpnChannelActivityEventArgs")) {
            if ((queryResult := this.QueryInterface(IVpnChannelActivityEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannelActivityEventArgs := IVpnChannelActivityEventArgs(outPtr)
        }

        return this.__IVpnChannelActivityEventArgs.get_Type()
    }

;@endregion Instance Methods
}
