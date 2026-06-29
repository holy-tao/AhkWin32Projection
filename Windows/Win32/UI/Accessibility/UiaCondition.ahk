#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ConditionType.ahk" { ConditionType }

/**
 * Note  This structure is deprecated.  Contains information about a condition.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaCondition {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-conditiontype">ConditionType</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-conditiontype">ConditionType</a> enumerated type indicating the type of the condition.
     */
    ConditionType : ConditionType

}
