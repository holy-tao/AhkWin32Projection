#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the certificate that the EAP method uses for authentication.
 * @see https://docs.microsoft.com/windows/win32/api//eaptypes/ns-eaptypes-eapcertificatecredential
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EapCertificateCredential extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * SHA1 hash of the certificate.
     * @type {Array<Byte>}
     */
    certHash{
        get {
            if(!this.HasProp("__certHashProxyArray"))
                this.__certHashProxyArray := Win32FixedArray(this.ptr + 0, 20, Primitive, "char")
            return this.__certHashProxyArray
        }
    }

    /**
     * If the certificate is present on the system and strong private key protection is turned on for this certificate, this field contains the password to access the certificate.
     * @type {Pointer<Char>}
     */
    password {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
