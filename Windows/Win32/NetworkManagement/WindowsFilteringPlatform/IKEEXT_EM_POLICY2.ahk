#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE.ahk" { IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE }
#Import ".\IKEEXT_AUTHENTICATION_METHOD2.ahk" { IKEEXT_AUTHENTICATION_METHOD2 }

/**
 * Is used to store AuthIP's extended mode negotiation policy. (IKEEXT_EM_POLICY2)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_em_policy2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_EM_POLICY2 {
    #StructPack 8

    /**
     * Type: <b>UINT32</b>
     * 
     *  Number of authentication methods in the array.
     */
    numAuthenticationMethods : UInt32

    /**
     * Type: [IKEEXT_AUTHENTICATION_METHOD2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_authentication_method2)*</b>
     * 
     * size_is(numAuthenticationMethods)
     * 
     * Array of acceptable authentication methods.
     */
    authenticationMethods : IKEEXT_AUTHENTICATION_METHOD2.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_authentication_impersonation_type">IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE</a></b>
     * 
     * Type of impersonation.
     */
    initiatorImpersonationType : IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE

}
