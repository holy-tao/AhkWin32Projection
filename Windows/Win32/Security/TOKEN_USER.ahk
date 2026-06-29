#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SID_AND_ATTRIBUTES.ahk" { SID_AND_ATTRIBUTES }
#Import ".\PSID.ahk" { PSID }

/**
 * Identifies the user associated with an access token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_user
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_USER {
    #StructPack 8

    /**
     * Specifies a
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structure representing the user associated with the access token. There are currently no attributes defined for user <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifiers</a> (SIDs).
     */
    User : SID_AND_ATTRIBUTES

}
