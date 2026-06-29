#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POLICY_LSA_SERVER_ROLE.ahk" { POLICY_LSA_SERVER_ROLE }

/**
 * Used to set and query the role of an LSA server.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-policy_lsa_server_role_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_LSA_SERVER_ROLE_INFO {
    #StructPack 4

    /**
     * Specifies one of the values from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-policy_lsa_server_role">POLICY_LSA_SERVER_ROLE</a> enumeration type to indicate a primary or backup LSA server.
     */
    LsaServerRole : POLICY_LSA_SERVER_ROLE

}
