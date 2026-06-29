#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PSID.ahk" { PSID }

/**
 * Specifies a group security identifier (SID) for an access token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_primary_group
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_PRIMARY_GROUP {
    #StructPack 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure representing a group that will become the primary group of any objects created by a process using this access token. The SID must be one of the group SIDs already in the token.
     */
    PrimaryGroup : PSID

}
