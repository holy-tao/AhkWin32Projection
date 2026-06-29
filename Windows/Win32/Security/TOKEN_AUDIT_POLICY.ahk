#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the per user audit policy for a token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_audit_policy
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_AUDIT_POLICY {
    #StructPack 1

    /**
     * Specifies the per user audit policy for the token.
     */
    PerUserPolicy : Int8[31]

}
