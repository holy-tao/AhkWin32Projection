#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACL.ahk" { ACL }

/**
 * Specifies a discretionary access control list (DACL).
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-gettokeninformation">GetTokenInformation</a> function retrieves the default DACL for an access token, in the form of a <b>TOKEN_DEFAULT_DACL</b> structure. This structure is also used with the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-settokeninformation">SetTokenInformation</a> function to set the default DACL.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_default_dacl
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_DEFAULT_DACL {
    #StructPack 8

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure assigned by default to any objects created by the user. The user is represented by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a>.
     */
    DefaultDacl : ACL.Ptr

}
