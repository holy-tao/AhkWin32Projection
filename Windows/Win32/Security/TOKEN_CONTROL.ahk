#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\Foundation\LUID.ahk
#Include .\TOKEN_SOURCE.ahk

/**
 * Contains information that identifies an access token.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-token_control
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_CONTROL extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">locally unique identifier</a> (LUID) identifying this instance of the token object.
     * @type {LUID}
     */
    TokenId{
        get {
            if(!this.HasProp("__TokenId"))
                this.__TokenId := LUID(this.ptr + 0)
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
                this.__AuthenticationId := LUID(this.ptr + 8)
            return this.__AuthenticationId
        }
    }

    /**
     * Specifies an LUID that changes each time the token is modified. An application can use this value as a test of whether a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> has changed since it was last used.
     * @type {LUID}
     */
    ModifiedId{
        get {
            if(!this.HasProp("__ModifiedId"))
                this.__ModifiedId := LUID(this.ptr + 16)
            return this.__ModifiedId
        }
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_source">TOKEN_SOURCE</a> structure identifying the agency that issued the token. This information is used in audit trails.
     * @type {TOKEN_SOURCE}
     */
    TokenSource{
        get {
            if(!this.HasProp("__TokenSource"))
                this.__TokenSource := TOKEN_SOURCE(this.ptr + 24)
            return this.__TokenSource
        }
    }
}
