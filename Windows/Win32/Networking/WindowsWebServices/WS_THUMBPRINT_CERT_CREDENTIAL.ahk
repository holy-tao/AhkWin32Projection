#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_CERT_CREDENTIAL.ahk
#Include .\WS_STRING.ahk

/**
 * The type for specifying a certificate credential using the certificate's thumbprint, store location and store name. The specified credential is loaded when the containing channel or listener is opened.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_thumbprint_cert_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_THUMBPRINT_CERT_CREDENTIAL extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The base type from which this type and all other certificate credential types derive.
     * @type {WS_CERT_CREDENTIAL}
     */
    credential{
        get {
            if(!this.HasProp("__credential"))
                this.__credential := WS_CERT_CREDENTIAL(this.ptr + 0)
            return this.__credential
        }
    }

    /**
     * The certificate store location (such as CERT_SYSTEM_STORE_CURRENT_USER
     * or CERT_SYSTEM_STORE_LOCAL_MACHINE) that contains the specified
     * certificate.
     * @type {Integer}
     */
    storeLocation {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The certificate store name (such as "My") that contains the specified
     * certificate.
     * @type {WS_STRING}
     */
    storeName{
        get {
            if(!this.HasProp("__storeName"))
                this.__storeName := WS_STRING(this.ptr + 8)
            return this.__storeName
        }
    }

    /**
     * The SHA-1 thumbprint (such as
     * "c0f89c8d4e4e80f250b58c3fae944a0edee02804") of the specified
     * certificate.  The supplied value should be a hexadecimal string
     * without whitespace characters or a leading 0x.  A tool such as
     * certmgr.exe may be used to find the thumbprint of a certificate.
     * @type {WS_STRING}
     */
    thumbprint{
        get {
            if(!this.HasProp("__thumbprint"))
                this.__thumbprint := WS_STRING(this.ptr + 24)
            return this.__thumbprint
        }
    }
}
