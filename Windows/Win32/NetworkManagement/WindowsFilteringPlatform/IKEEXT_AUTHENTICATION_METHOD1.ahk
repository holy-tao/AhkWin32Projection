#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_BYTE_BLOB.ahk
#Include .\IKEEXT_PRESHARED_KEY_AUTHENTICATION1.ahk
#Include .\IKEEXT_CERTIFICATE_AUTHENTICATION1.ahk
#Include .\IKEEXT_KERBEROS_AUTHENTICATION0.ahk
#Include .\FWP_BYTE_ARRAY16.ahk
#Include .\IKEEXT_IPV6_CGA_AUTHENTICATION0.ahk
#Include .\IKEEXT_EAP_AUTHENTICATION0.ahk

/**
 * Specifies various parameters for IKE/Authip authentication.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_authentication_method1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_AUTHENTICATION_METHOD1 extends Win32Struct
{
    static sizeof => 88

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
     * @type {IKEEXT_PRESHARED_KEY_AUTHENTICATION1}
     */
    presharedKeyAuthentication{
        get {
            if(!this.HasProp("__presharedKeyAuthentication"))
                this.__presharedKeyAuthentication := IKEEXT_PRESHARED_KEY_AUTHENTICATION1(this.ptr + 8)
            return this.__presharedKeyAuthentication
        }
    }

    /**
     * @type {IKEEXT_CERTIFICATE_AUTHENTICATION1}
     */
    certificateAuthentication{
        get {
            if(!this.HasProp("__certificateAuthentication"))
                this.__certificateAuthentication := IKEEXT_CERTIFICATE_AUTHENTICATION1(this.ptr + 8)
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
     * @type {IKEEXT_CERTIFICATE_AUTHENTICATION1}
     */
    sslAuthentication{
        get {
            if(!this.HasProp("__sslAuthentication"))
                this.__sslAuthentication := IKEEXT_CERTIFICATE_AUTHENTICATION1(this.ptr + 8)
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

    /**
     * @type {IKEEXT_EAP_AUTHENTICATION0}
     */
    eapAuthentication{
        get {
            if(!this.HasProp("__eapAuthentication"))
                this.__eapAuthentication := IKEEXT_EAP_AUTHENTICATION0(this.ptr + 8)
            return this.__eapAuthentication
        }
    }
}
