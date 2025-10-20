#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Note  This structure is deprecated.  Contains information about a complex condition.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcoreapi/ns-uiautomationcoreapi-uiaandorcondition
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UiaAndOrCondition extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a>**</b>
     * 
     * The address of an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a> structures containing information about the complex condition.
     * @type {Pointer<Pointer<UiaCondition>>}
     */
    ppConditions {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * The count of elements in the <b>ppConditions</b> array.
     * @type {Integer}
     */
    cConditions {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
