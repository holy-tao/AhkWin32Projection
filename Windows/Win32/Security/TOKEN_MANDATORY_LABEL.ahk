#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SID_AND_ATTRIBUTES.ahk" { SID_AND_ATTRIBUTES }
#Import ".\PSID.ahk" { PSID }

/**
 * Specifies the mandatory integrity level for a token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_mandatory_label
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_MANDATORY_LABEL {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structure that specifies the mandatory integrity level of the token.
     */
    Label : SID_AND_ATTRIBUTES

}
