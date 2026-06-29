#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_AUTHENTICATION_METHOD_TYPE.ahk" { IKEEXT_AUTHENTICATION_METHOD_TYPE }
#Import ".\IKEEXT_PRESHARED_KEY_AUTHENTICATION1.ahk" { IKEEXT_PRESHARED_KEY_AUTHENTICATION1 }
#Import ".\IKEEXT_NTLM_V2_AUTHENTICATION0.ahk" { IKEEXT_NTLM_V2_AUTHENTICATION0 }
#Import ".\IKEEXT_CERT_CONFIG_TYPE.ahk" { IKEEXT_CERT_CONFIG_TYPE }
#Import ".\IKEEXT_EAP_AUTHENTICATION_FLAGS.ahk" { IKEEXT_EAP_AUTHENTICATION_FLAGS }
#Import ".\IKEEXT_IPV6_CGA_AUTHENTICATION0.ahk" { IKEEXT_IPV6_CGA_AUTHENTICATION0 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\IKEEXT_PRESHARED_KEY_AUTHENTICATION_FLAGS.ahk" { IKEEXT_PRESHARED_KEY_AUTHENTICATION_FLAGS }
#Import ".\IKEEXT_CERT_ROOT_CONFIG0.ahk" { IKEEXT_CERT_ROOT_CONFIG0 }
#Import ".\IKEEXT_CERT_AUTH.ahk" { IKEEXT_CERT_AUTH }
#Import ".\IKEEXT_EAP_AUTHENTICATION0.ahk" { IKEEXT_EAP_AUTHENTICATION0 }
#Import ".\IKEEXT_KERBEROS_AUTHENTICATION_FLAGS.ahk" { IKEEXT_KERBEROS_AUTHENTICATION_FLAGS }
#Import ".\IKEEXT_KERBEROS_AUTHENTICATION0.ahk" { IKEEXT_KERBEROS_AUTHENTICATION0 }
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }
#Import ".\IKEEXT_CERTIFICATE_AUTHENTICATION1.ahk" { IKEEXT_CERTIFICATE_AUTHENTICATION1 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Specifies various parameters for IKE/Authip authentication. (IKEEXT_AUTHENTICATION_METHOD1)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_authentication_method1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_AUTHENTICATION_METHOD1 {
    #StructPack 8

    /**
     * Type of authentication method specified by <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_authentication_method_type">IKEEXT_AUTHENTICATION_METHOD_TYPE</a>.
     */
    authenticationMethodType : IKEEXT_AUTHENTICATION_METHOD_TYPE

    presharedKeyAuthentication : IKEEXT_PRESHARED_KEY_AUTHENTICATION1

    static __New() {
        DefineProp(this.Prototype, 'certificateAuthentication', { type: IKEEXT_CERTIFICATE_AUTHENTICATION1, offset: 8 })
        DefineProp(this.Prototype, 'kerberosAuthentication', { type: IKEEXT_KERBEROS_AUTHENTICATION0, offset: 8 })
        DefineProp(this.Prototype, 'ntlmV2Authentication', { type: IKEEXT_NTLM_V2_AUTHENTICATION0, offset: 8 })
        DefineProp(this.Prototype, 'sslAuthentication', { type: IKEEXT_CERTIFICATE_AUTHENTICATION1, offset: 8 })
        DefineProp(this.Prototype, 'cgaAuthentication', { type: IKEEXT_IPV6_CGA_AUTHENTICATION0, offset: 8 })
        DefineProp(this.Prototype, 'eapAuthentication', { type: IKEEXT_EAP_AUTHENTICATION0, offset: 8 })
        this.DeleteProp("__New")
    }
}
