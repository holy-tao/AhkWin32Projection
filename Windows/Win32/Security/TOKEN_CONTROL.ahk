#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TOKEN_SOURCE.ahk" { TOKEN_SOURCE }
#Import "..\Foundation\LUID.ahk" { LUID }
#Import "..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains information that identifies an access token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_control
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_CONTROL {
    #StructPack 4

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">locally unique identifier</a> (LUID) identifying this instance of the token object.
     */
    TokenId : LUID

    /**
     * Specifies an LUID assigned to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session</a> this token represents. There can be many tokens representing a single <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>.
     */
    AuthenticationId : LUID

    /**
     * Specifies an LUID that changes each time the token is modified. An application can use this value as a test of whether a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> has changed since it was last used.
     */
    ModifiedId : LUID

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_source">TOKEN_SOURCE</a> structure identifying the agency that issued the token. This information is used in audit trails.
     */
    TokenSource : TOKEN_SOURCE

}
