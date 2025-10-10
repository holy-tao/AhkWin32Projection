#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Specifies the per user audit policy for a token.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-token_audit_policy
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_AUDIT_POLICY extends Win32Struct
{
    static sizeof => 30

    static packingSize => 1

    /**
     * Specifies the per user audit policy for the token.
     * @type {Array<Byte>}
     */
    PerUserPolicy{
        get {
            if(!this.HasProp("__PerUserPolicyProxyArray"))
                this.__PerUserPolicyProxyArray := Win32FixedArray(this.ptr + 0, 30, Primitive, "char")
            return this.__PerUserPolicyProxyArray
        }
    }
}
