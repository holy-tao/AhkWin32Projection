#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnForegroundActivationOperation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a VPN foreground operation. When you're done handling a foreground operation, you must call the [Complete](vpnforegroundactivationoperation_complete_1656373823.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnforegroundactivationoperation
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnForegroundActivationOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnForegroundActivationOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnForegroundActivationOperation.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Represents a VPN foreground operation. When you're done handling a foreground operation, you must call **Complete** from your foreground app to mark that the activation is done. Doing so will resume the control flow in the plugin. See [VpnChannel.ActivateForeground](vpnchannel_activateforeground_291551645.md).
     * @param {ValueSet} result_ A [ValueSet](/uwp/api/windows.foundation.collections.valueset) of values that you want to be returned to the [IVpnPlugin.Connect](/uwp/api/windows.networking.vpn.ivpnplugin.connect) call. The **ValueSet** will be returned to the plugin, allowing you to pass information from the foreground app to the plugin task.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnforegroundactivationoperation.complete
     */
    Complete(result_) {
        if (!this.HasProp("__IVpnForegroundActivationOperation")) {
            if ((queryResult := this.QueryInterface(IVpnForegroundActivationOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnForegroundActivationOperation := IVpnForegroundActivationOperation(outPtr)
        }

        return this.__IVpnForegroundActivationOperation.Complete(result_)
    }

;@endregion Instance Methods
}
