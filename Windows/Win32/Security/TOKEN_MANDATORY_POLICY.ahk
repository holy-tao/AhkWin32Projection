#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\TOKEN_MANDATORY_POLICY_ID.ahk

/**
 * Specifies the mandatory integrity policy for a token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_mandatory_policy
 * @namespace Windows.Win32.Security
 */
class TOKEN_MANDATORY_POLICY extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {TOKEN_MANDATORY_POLICY_ID}
     */
    Policy {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
