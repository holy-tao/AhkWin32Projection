#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains the default owner security identifier (SID) that will be applied to newly created objects.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-token_owner
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_OWNER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure representing a user who will become the owner of any objects created by a process using this <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a>. The SID must be one of the user or group SIDs already in the token.
     * @type {PSID}
     */
    Owner {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
