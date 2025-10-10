#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Specifies a group security identifier (SID) for an access token.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-token_primary_group
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_PRIMARY_GROUP extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure representing a group that will become the primary group of any objects created by a process using this access token. The SID must be one of the group SIDs already in the token.
     * @type {Pointer<Void>}
     */
    PrimaryGroup {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
