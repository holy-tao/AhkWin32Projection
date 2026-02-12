#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnCredential.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the credentials requested and provided by the platform. This class holds username, password, PIN, OTP, and any additional PIN or certificate to which access has been granted.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncredential
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnCredential extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnCredential

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnCredential.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current password credential used by the user to log on to the VPN server.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncredential.passkeycredential
     * @type {PasswordCredential} 
     */
    PasskeyCredential {
        get => this.get_PasskeyCredential()
    }

    /**
     * Gets the certificate to which we were granted access for use in the VPN connection.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncredential.certificatecredential
     * @type {Certificate} 
     */
    CertificateCredential {
        get => this.get_CertificateCredential()
    }

    /**
     * Gets an additional PIN provided by the user, typically used when requesting a credential type of username, password, and PIN.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncredential.additionalpin
     * @type {HSTRING} 
     */
    AdditionalPin {
        get => this.get_AdditionalPin()
    }

    /**
     * Gets the previous credential the user used to log on to the VPN server, as in the case of a password change.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpncredential.oldpasswordcredential
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
        if (!this.HasProp("__IVpnCredential")) {
            if ((queryResult := this.QueryInterface(IVpnCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCredential := IVpnCredential(outPtr)
        }

        return this.__IVpnCredential.get_PasskeyCredential()
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_CertificateCredential() {
        if (!this.HasProp("__IVpnCredential")) {
            if ((queryResult := this.QueryInterface(IVpnCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCredential := IVpnCredential(outPtr)
        }

        return this.__IVpnCredential.get_CertificateCredential()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AdditionalPin() {
        if (!this.HasProp("__IVpnCredential")) {
            if ((queryResult := this.QueryInterface(IVpnCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCredential := IVpnCredential(outPtr)
        }

        return this.__IVpnCredential.get_AdditionalPin()
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_OldPasswordCredential() {
        if (!this.HasProp("__IVpnCredential")) {
            if ((queryResult := this.QueryInterface(IVpnCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnCredential := IVpnCredential(outPtr)
        }

        return this.__IVpnCredential.get_OldPasswordCredential()
    }

;@endregion Instance Methods
}
