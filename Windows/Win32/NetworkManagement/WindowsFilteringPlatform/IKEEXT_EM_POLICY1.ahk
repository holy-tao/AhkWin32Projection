#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_AUTHENTICATION_METHOD1.ahk" { IKEEXT_AUTHENTICATION_METHOD1 }
#Import ".\IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE.ahk" { IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE }

/**
 * Is used to store AuthIP's extended mode negotiation policy. (IKEEXT_EM_POLICY1)
 * @remarks
 * Applies only to AuthIP.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_em_policy1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_EM_POLICY1 {
    #StructPack 8

    /**
     * Number of authentication methods in the array.
     */
    numAuthenticationMethods : UInt32

    /**
     * size_is(numAuthenticationMethods)
     * 
     * Array of acceptable authentication methods as specified by [IKEEXT_AUTHENTICATION_METHOD1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_authentication_method1).
     */
    authenticationMethods : IKEEXT_AUTHENTICATION_METHOD1.Ptr

    /**
     * Type of impersonation.
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_authentication_impersonation_type">IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE</a> for more information.
     */
    initiatorImpersonationType : IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE

}
