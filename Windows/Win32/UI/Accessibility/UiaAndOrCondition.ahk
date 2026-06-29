#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UiaCondition.ahk" { UiaCondition }
#Import ".\ConditionType.ahk" { ConditionType }

/**
 * Note  This structure is deprecated.  Contains information about a complex condition.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiaandorcondition
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaAndOrCondition {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-conditiontype">ConditionType</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-conditiontype">ConditionType</a> enumerated type indicating the type of the condition.
     */
    ConditionType : ConditionType

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a>**</b>
     * 
     * The address of an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a> structures containing information about the complex condition.
     */
    ppConditions : IntPtr

    /**
     * Type: <b>int</b>
     * 
     * The count of elements in the <b>ppConditions</b> array.
     */
    cConditions : Int32

}
