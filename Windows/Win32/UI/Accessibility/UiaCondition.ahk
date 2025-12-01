#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Note  This structure is deprecated.  Contains information about a condition.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UiaCondition extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-conditiontype">ConditionType</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-conditiontype">ConditionType</a> enumerated type indicating the type of the condition.
     * @type {Integer}
     */
    ConditionType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
