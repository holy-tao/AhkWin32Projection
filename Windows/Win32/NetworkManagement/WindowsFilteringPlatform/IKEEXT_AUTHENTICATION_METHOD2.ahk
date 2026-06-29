#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_AUTHENTICATION_METHOD_TYPE.ahk" { IKEEXT_AUTHENTICATION_METHOD_TYPE }
#Import ".\IKEEXT_PRESHARED_KEY_AUTHENTICATION1.ahk" { IKEEXT_PRESHARED_KEY_AUTHENTICATION1 }
#Import ".\IKEEXT_CERTIFICATE_AUTHENTICATION2.ahk" { IKEEXT_CERTIFICATE_AUTHENTICATION2 }
#Import ".\IKEEXT_RESERVED_AUTHENTICATION_FLAGS.ahk" { IKEEXT_RESERVED_AUTHENTICATION_FLAGS }
#Import ".\IKEEXT_NTLM_V2_AUTHENTICATION0.ahk" { IKEEXT_NTLM_V2_AUTHENTICATION0 }
#Import ".\IKEEXT_CERT_CONFIG_TYPE.ahk" { IKEEXT_CERT_CONFIG_TYPE }
#Import ".\IKEEXT_EAP_AUTHENTICATION_FLAGS.ahk" { IKEEXT_EAP_AUTHENTICATION_FLAGS }
#Import ".\IKEEXT_IPV6_CGA_AUTHENTICATION0.ahk" { IKEEXT_IPV6_CGA_AUTHENTICATION0 }
#Import ".\IKEEXT_CERTIFICATE_CRITERIA0.ahk" { IKEEXT_CERTIFICATE_CRITERIA0 }
#Import ".\IKEEXT_RESERVED_AUTHENTICATION0.ahk" { IKEEXT_RESERVED_AUTHENTICATION0 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\IKEEXT_PRESHARED_KEY_AUTHENTICATION_FLAGS.ahk" { IKEEXT_PRESHARED_KEY_AUTHENTICATION_FLAGS }
#Import ".\IKEEXT_CERT_AUTH.ahk" { IKEEXT_CERT_AUTH }
#Import ".\IKEEXT_EAP_AUTHENTICATION0.ahk" { IKEEXT_EAP_AUTHENTICATION0 }
#Import ".\IKEEXT_KERBEROS_AUTHENTICATION_FLAGS.ahk" { IKEEXT_KERBEROS_AUTHENTICATION_FLAGS }
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IKEEXT_KERBEROS_AUTHENTICATION1.ahk" { IKEEXT_KERBEROS_AUTHENTICATION1 }

/**
 * Specifies various parameters for IKE/Authip authentication. (IKEEXT_AUTHENTICATION_METHOD2)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_authentication_method2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_AUTHENTICATION_METHOD2 {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_authentication_method_type">IKEEXT_AUTHENTICATION_METHOD_TYPE</a></b>
     * 
     * Type of authentication method.
     */
    authenticationMethodType : IKEEXT_AUTHENTICATION_METHOD_TYPE

    presharedKeyAuthentication : IKEEXT_PRESHARED_KEY_AUTHENTICATION1

    static __New() {
        DefineProp(this.Prototype, 'certificateAuthentication', { type: IKEEXT_CERTIFICATE_AUTHENTICATION2, offset: 8 })
        DefineProp(this.Prototype, 'kerberosAuthentication', { type: IKEEXT_KERBEROS_AUTHENTICATION1, offset: 8 })
        DefineProp(this.Prototype, 'reservedAuthentication', { type: IKEEXT_RESERVED_AUTHENTICATION0, offset: 8 })
        DefineProp(this.Prototype, 'ntlmV2Authentication', { type: IKEEXT_NTLM_V2_AUTHENTICATION0, offset: 8 })
        DefineProp(this.Prototype, 'sslAuthentication', { type: IKEEXT_CERTIFICATE_AUTHENTICATION2, offset: 8 })
        DefineProp(this.Prototype, 'cgaAuthentication', { type: IKEEXT_IPV6_CGA_AUTHENTICATION0, offset: 8 })
        DefineProp(this.Prototype, 'eapAuthentication', { type: IKEEXT_EAP_AUTHENTICATION0, offset: 8 })
        this.DeleteProp("__New")
    }
}
