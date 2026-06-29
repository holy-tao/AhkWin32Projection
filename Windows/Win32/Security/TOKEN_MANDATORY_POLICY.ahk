#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TOKEN_MANDATORY_POLICY_ID.ahk" { TOKEN_MANDATORY_POLICY_ID }

/**
 * Specifies the mandatory integrity policy for a token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_mandatory_policy
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_MANDATORY_POLICY {
    #StructPack 4

    Policy : TOKEN_MANDATORY_POLICY_ID

}
