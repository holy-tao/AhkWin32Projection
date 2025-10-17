#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_BYTE_BLOB.ahk
#Include .\IKEEXT_PRESHARED_KEY_AUTHENTICATION1.ahk
#Include .\IKEEXT_CERTIFICATE_AUTHENTICATION2.ahk
#Include .\IKEEXT_KERBEROS_AUTHENTICATION1.ahk
#Include .\IKEEXT_RESERVED_AUTHENTICATION0.ahk
#Include .\IKEEXT_NTLM_V2_AUTHENTICATION0.ahk
#Include .\FWP_BYTE_ARRAY16.ahk
#Include .\IKEEXT_IPV6_CGA_AUTHENTICATION0.ahk
#Include .\IKEEXT_EAP_AUTHENTICATION0.ahk

/**
 * Specifies various parameters for IKE/Authip authentication.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_authentication_method2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_AUTHENTICATION_METHOD2 extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_authentication_method_type">IKEEXT_AUTHENTICATION_METHOD_TYPE</a></b>
     * 
     * Type of authentication method.
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
                this.__presharedKeyAuthentication := IKEEXT_PRESHARED_KEY_AUTHENTICATION1(8, this)
            return this.__presharedKeyAuthentication
        }
    }

    /**
     * @type {IKEEXT_CERTIFICATE_AUTHENTICATION2}
     */
    certificateAuthentication{
        get {
            if(!this.HasProp("__certificateAuthentication"))
                this.__certificateAuthentication := IKEEXT_CERTIFICATE_AUTHENTICATION2(8, this)
            return this.__certificateAuthentication
        }
    }

    /**
     * @type {IKEEXT_KERBEROS_AUTHENTICATION1}
     */
    kerberosAuthentication{
        get {
            if(!this.HasProp("__kerberosAuthentication"))
                this.__kerberosAuthentication := IKEEXT_KERBEROS_AUTHENTICATION1(8, this)
            return this.__kerberosAuthentication
        }
    }

    /**
     * @type {IKEEXT_RESERVED_AUTHENTICATION0}
     */
    reservedAuthentication{
        get {
            if(!this.HasProp("__reservedAuthentication"))
                this.__reservedAuthentication := IKEEXT_RESERVED_AUTHENTICATION0(8, this)
            return this.__reservedAuthentication
        }
    }

    /**
     * @type {IKEEXT_NTLM_V2_AUTHENTICATION0}
     */
    ntlmV2Authentication{
        get {
            if(!this.HasProp("__ntlmV2Authentication"))
                this.__ntlmV2Authentication := IKEEXT_NTLM_V2_AUTHENTICATION0(8, this)
            return this.__ntlmV2Authentication
        }
    }

    /**
     * @type {IKEEXT_CERTIFICATE_AUTHENTICATION2}
     */
    sslAuthentication{
        get {
            if(!this.HasProp("__sslAuthentication"))
                this.__sslAuthentication := IKEEXT_CERTIFICATE_AUTHENTICATION2(8, this)
            return this.__sslAuthentication
        }
    }

    /**
     * @type {IKEEXT_IPV6_CGA_AUTHENTICATION0}
     */
    cgaAuthentication{
        get {
            if(!this.HasProp("__cgaAuthentication"))
                this.__cgaAuthentication := IKEEXT_IPV6_CGA_AUTHENTICATION0(8, this)
            return this.__cgaAuthentication
        }
    }

    /**
     * @type {IKEEXT_EAP_AUTHENTICATION0}
     */
    eapAuthentication{
        get {
            if(!this.HasProp("__eapAuthentication"))
                this.__eapAuthentication := IKEEXT_EAP_AUTHENTICATION0(8, this)
            return this.__eapAuthentication
        }
    }
}
