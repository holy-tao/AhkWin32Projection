#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\Foundation\LUID.ahk

/**
 * Contains information about an access token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_statistics
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_STATISTICS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Specifies a locally unique identifier (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">LUID</a>) that identifies this instance of the token object.
     * @type {LUID}
     */
    TokenId{
        get {
            if(!this.HasProp("__TokenId"))
                this.__TokenId := LUID(0, this)
            return this.__TokenId
        }
    }

    /**
     * Specifies an LUID assigned to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session</a> this token represents. There can be many tokens representing a single <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>.
     * @type {LUID}
     */
    AuthenticationId{
        get {
            if(!this.HasProp("__AuthenticationId"))
                this.__AuthenticationId := LUID(8, this)
            return this.__AuthenticationId
        }
    }

    /**
     * Specifies the time at which this token expires. Expiration times for access tokens are not currently supported.
     * @type {Integer}
     */
    ExpirationTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-token_type">TOKEN_TYPE</a> enumeration type indicating whether the token is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary</a> or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a>.
     * @type {Integer}
     */
    TokenType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-security_impersonation_level">SECURITY_IMPERSONATION_LEVEL</a> enumeration type indicating the impersonation level of the token. This member is valid only if the <b>TokenType</b> is TokenImpersonation.
     * @type {Integer}
     */
    ImpersonationLevel {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Specifies the amount, in bytes, of memory allocated for storing default protection and a primary group identifier.
     * @type {Integer}
     */
    DynamicCharged {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Specifies the portion of memory allocated for storing default protection and a primary group identifier not already in use. This value is returned as a count of free bytes.
     * @type {Integer}
     */
    DynamicAvailable {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Specifies the number of supplemental group <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifiers</a> (SIDs) included in the token.
     * @type {Integer}
     */
    GroupCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Specifies the number of privileges included in the token.
     * @type {Integer}
     */
    PrivilegeCount {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Specifies an LUID that changes each time the token is modified. An application can use this value as a test of whether a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> has changed since it was last used.
     * @type {LUID}
     */
    ModifiedId{
        get {
            if(!this.HasProp("__ModifiedId"))
                this.__ModifiedId := LUID(48, this)
            return this.__ModifiedId
        }
    }
}
