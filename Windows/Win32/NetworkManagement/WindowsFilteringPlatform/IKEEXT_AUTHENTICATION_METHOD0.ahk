#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_BYTE_BLOB.ahk
#Include .\IKEEXT_PRESHARED_KEY_AUTHENTICATION0.ahk
#Include .\IKEEXT_CERTIFICATE_AUTHENTICATION0.ahk
#Include .\IKEEXT_KERBEROS_AUTHENTICATION0.ahk
#Include .\FWP_BYTE_ARRAY16.ahk
#Include .\IKEEXT_IPV6_CGA_AUTHENTICATION0.ahk

/**
 * Specifies various parameters for IKE/AuthIP authentication.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_authentication_method0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_AUTHENTICATION_METHOD0 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type of authentication method specified by <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_authentication_method_type">IKEEXT_AUTHENTICATION_METHOD_TYPE</a>.
     * @type {Integer}
     */
    authenticationMethodType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {IKEEXT_PRESHARED_KEY_AUTHENTICATION0}
     */
    presharedKeyAuthentication{
        get {
            if(!this.HasProp("__presharedKeyAuthentication"))
                this.__presharedKeyAuthentication := IKEEXT_PRESHARED_KEY_AUTHENTICATION0(this.ptr + 8)
            return this.__presharedKeyAuthentication
        }
    }

    /**
     * @type {IKEEXT_CERTIFICATE_AUTHENTICATION0}
     */
    certificateAuthentication{
        get {
            if(!this.HasProp("__certificateAuthentication"))
                this.__certificateAuthentication := IKEEXT_CERTIFICATE_AUTHENTICATION0(this.ptr + 8)
            return this.__certificateAuthentication
        }
    }

    /**
     * @type {IKEEXT_KERBEROS_AUTHENTICATION0}
     */
    kerberosAuthentication{
        get {
            if(!this.HasProp("__kerberosAuthentication"))
                this.__kerberosAuthentication := IKEEXT_KERBEROS_AUTHENTICATION0(this.ptr + 8)
            return this.__kerberosAuthentication
        }
    }

    /**
     * @type {Integer}
     */
    ntlmV2Authentication {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {IKEEXT_CERTIFICATE_AUTHENTICATION0}
     */
    sslAuthentication{
        get {
            if(!this.HasProp("__sslAuthentication"))
                this.__sslAuthentication := IKEEXT_CERTIFICATE_AUTHENTICATION0(this.ptr + 8)
            return this.__sslAuthentication
        }
    }

    /**
     * @type {IKEEXT_IPV6_CGA_AUTHENTICATION0}
     */
    cgaAuthentication{
        get {
            if(!this.HasProp("__cgaAuthentication"))
                this.__cgaAuthentication := IKEEXT_IPV6_CGA_AUTHENTICATION0(this.ptr + 8)
            return this.__cgaAuthentication
        }
    }
}
