#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_PRESHARED_KEY_AUTHENTICATION1.ahk" { IKEEXT_PRESHARED_KEY_AUTHENTICATION1 }
#Import ".\IKEEXT_CERTIFICATE_CREDENTIAL1.ahk" { IKEEXT_CERTIFICATE_CREDENTIAL1 }
#Import ".\IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE.ahk" { IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE }
#Import ".\IKEEXT_AUTHENTICATION_METHOD_TYPE.ahk" { IKEEXT_AUTHENTICATION_METHOD_TYPE }
#Import ".\IKEEXT_NAME_CREDENTIAL0.ahk" { IKEEXT_NAME_CREDENTIAL0 }

/**
 * Is used to store credential information used for the authentication. (IKEEXT_CREDENTIAL1)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_credential1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_CREDENTIAL1 {
    #StructPack 8

    /**
     * Type of authentication method.
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_authentication_method_type">IKEEXT_AUTHENTICATION_METHOD_TYPE</a> for more information.
     */
    authenticationMethodType : IKEEXT_AUTHENTICATION_METHOD_TYPE

    /**
     * Type of impersonation.
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_authentication_impersonation_type">IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE</a> for more information.
     */
    impersonationType : IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE

    presharedKey : IKEEXT_PRESHARED_KEY_AUTHENTICATION1.Ptr

    static __New() {
        DefineProp(this.Prototype, 'certificate', { type: IKEEXT_CERTIFICATE_CREDENTIAL1.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'name', { type: IKEEXT_NAME_CREDENTIAL0.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
