#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnPickedCredential.ahk
#Include ..\..\..\Guid.ahk

/**
 * **VpnPickedCredential** is not supported and may be altered or unavailable in the future. Instead, use [VpnCredential](vpncredential.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpickedcredential
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnPickedCredential extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnPickedCredential

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnPickedCredential.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Not supported. Use [VpnCredential](vpncredential.md) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpickedcredential.passkeycredential
     * @type {PasswordCredential} 
     */
    PasskeyCredential {
        get => this.get_PasskeyCredential()
    }

    /**
     * Not supported. Use [VpnCredential](vpncredential.md) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpickedcredential.additionalpin
     * @type {HSTRING} 
     */
    AdditionalPin {
        get => this.get_AdditionalPin()
    }

    /**
     * Not supported. Use [VpnCredential](vpncredential.md) instead.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpickedcredential.oldpasswordcredential
     * @type {PasswordCredential} 
     */
    OldPasswordCredential {
        get => this.get_OldPasswordCredential()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_PasskeyCredential() {
        if (!this.HasProp("__IVpnPickedCredential")) {
            if ((queryResult := this.QueryInterface(IVpnPickedCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPickedCredential := IVpnPickedCredential(outPtr)
        }

        return this.__IVpnPickedCredential.get_PasskeyCredential()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AdditionalPin() {
        if (!this.HasProp("__IVpnPickedCredential")) {
            if ((queryResult := this.QueryInterface(IVpnPickedCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPickedCredential := IVpnPickedCredential(outPtr)
        }

        return this.__IVpnPickedCredential.get_AdditionalPin()
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_OldPasswordCredential() {
        if (!this.HasProp("__IVpnPickedCredential")) {
            if ((queryResult := this.QueryInterface(IVpnPickedCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPickedCredential := IVpnPickedCredential(outPtr)
        }

        return this.__IVpnPickedCredential.get_OldPasswordCredential()
    }

;@endregion Instance Methods
}
