#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PSID.ahk" { PSID }

/**
 * Contains the default owner security identifier (SID) that will be applied to newly created objects.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_owner
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_OWNER {
    #StructPack 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure representing a user who will become the owner of any objects created by a process using this <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a>. The SID must be one of the user or group SIDs already in the token.
     */
    Owner : PSID

}
