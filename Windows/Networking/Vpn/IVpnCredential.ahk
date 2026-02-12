#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Security\Credentials\PasswordCredential.ahk
#Include ..\..\Security\Cryptography\Certificates\Certificate.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides an interface for the VPN platform to support requested credentials.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpncredential
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnCredential extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnCredential
     * @type {Guid}
     */
    static IID => Guid("{b7e78af3-a46d-404b-8729-1832522853ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PasskeyCredential", "get_CertificateCredential", "get_AdditionalPin", "get_OldPasswordCredential"]

    /**
     * Gets password or PIN corresponding to this credential request.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpncredential.passkeycredential
     * @type {PasswordCredential} 
     */
    PasskeyCredential {
        get => this.get_PasskeyCredential()
    }

    /**
     * Gets the certificate that the plug-in was granted access to after requesting it.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpncredential.certificatecredential
     * @type {Certificate} 
     */
    CertificateCredential {
        get => this.get_CertificateCredential()
    }

    /**
     * Gets an additional PIN supplied by the user, typically when requesting user name, password, and PIN.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpncredential.additionalpin
     * @type {HSTRING} 
     */
    AdditionalPin {
        get => this.get_AdditionalPin()
    }

    /**
     * Gets the previous credential the user used to log on to the VPN server, as in the case of a password change.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpncredential.oldpasswordcredential
     * @type {PasswordCredential} 
     */
    OldPasswordCredential {
        get => this.get_OldPasswordCredential()
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_PasskeyCredential() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(value)
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_CertificateCredential() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Certificate(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AdditionalPin() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_OldPasswordCredential() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(value)
    }
}
