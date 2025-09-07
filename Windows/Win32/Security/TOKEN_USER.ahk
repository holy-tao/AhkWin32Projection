#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\PSID.ahk
#Include .\SID_AND_ATTRIBUTES.ahk

/**
 * Identifies the user associated with an access token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_user
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_USER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies a
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structure representing the user associated with the access token. There are currently no attributes defined for user <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifiers</a> (SIDs).
     * @type {SID_AND_ATTRIBUTES}
     */
    User{
        get {
            if(!this.HasProp("__User"))
                this.__User := SID_AND_ATTRIBUTES(this.ptr + 0)
            return this.__User
        }
    }
}
