#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the levels of information that can be included in a logon token.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecpkg/ne-ntsecpkg-lsa_token_information_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_TOKEN_INFORMATION_TYPE{

    /**
     * The token information is stored in an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-lsa_token_information_null">LSA_TOKEN_INFORMATION_NULL</a> structure. 
     * 
     * 
     * 
     * 
     * This token information type is used for anonymous logons or <b>null</b> sessions, where a token is needed but the client's identity is unknown.
     * 
     * For example, a non-authenticated network circuit (such as a domain controller's <b>null</b> session) can be given <b>NULL</b> information. In this case, an anonymous token is generated for the logon. An anonymous token does not permit access to protected system resources, but does allow access to unprotected system resources.
     * @type {Integer (Int32)}
     */
    static LsaTokenInformationNull => 0

    /**
     * The token information is stored in a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa378721(v=vs.85)">LSA_TOKEN_INFORMATION_V1</a> structure. This structure contains information that an authentication package can place in a Version 1 Windows token object. A Version 1 Windows token object stores all the information needed to build a token and is used in most logon cases. The LSA creates the token object, and returns a handle to that token object to the caller of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a>.
     * @type {Integer (Int32)}
     */
    static LsaTokenInformationV1 => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static LsaTokenInformationV2 => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static LsaTokenInformationV3 => 3
}
