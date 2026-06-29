#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TOKEN_TYPE.ahk" { TOKEN_TYPE }
#Import "..\Foundation\LUID.ahk" { LUID }
#Import ".\SECURITY_IMPERSONATION_LEVEL.ahk" { SECURITY_IMPERSONATION_LEVEL }

/**
 * Contains information about an access token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_statistics
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_STATISTICS {
    #StructPack 8

    /**
     * Specifies a locally unique identifier (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">LUID</a>) that identifies this instance of the token object.
     */
    TokenId : LUID

    /**
     * Specifies an LUID assigned to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session</a> this token represents. There can be many tokens representing a single <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>.
     */
    AuthenticationId : LUID

    /**
     * Specifies the time at which this token expires. Expiration times for access tokens are not currently supported.
     */
    ExpirationTime : Int64

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-token_type">TOKEN_TYPE</a> enumeration type indicating whether the token is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary</a> or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a>.
     */
    TokenType : TOKEN_TYPE

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-security_impersonation_level">SECURITY_IMPERSONATION_LEVEL</a> enumeration type indicating the impersonation level of the token. This member is valid only if the <b>TokenType</b> is TokenImpersonation.
     */
    ImpersonationLevel : SECURITY_IMPERSONATION_LEVEL

    /**
     * Specifies the amount, in bytes, of memory allocated for storing default protection and a primary group identifier.
     */
    DynamicCharged : UInt32

    /**
     * Specifies the portion of memory allocated for storing default protection and a primary group identifier not already in use. This value is returned as a count of free bytes.
     */
    DynamicAvailable : UInt32

    /**
     * Specifies the number of supplemental group <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifiers</a> (SIDs) included in the token.
     */
    GroupCount : UInt32

    /**
     * Specifies the number of privileges included in the token.
     */
    PrivilegeCount : UInt32

    /**
     * Specifies an LUID that changes each time the token is modified. An application can use this value as a test of whether a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> has changed since it was last used.
     */
    ModifiedId : LUID

}
