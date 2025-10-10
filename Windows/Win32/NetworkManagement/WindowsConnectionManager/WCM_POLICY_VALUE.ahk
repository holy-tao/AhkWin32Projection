#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the current value of a policy.
 * @see https://docs.microsoft.com/windows/win32/api//wcmapi/ns-wcmapi-wcm_policy_value
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 * @version v4.0.30319
 */
class WCM_POLICY_VALUE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>BOOL</b>
     * 
     * True if the policy is enabled; otherwise, false.
     * @type {Integer}
     */
    fValue {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * True if the current value was provided by Group Policy; otherwise, false.
     * @type {Integer}
     */
    fIsGroupPolicy {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
