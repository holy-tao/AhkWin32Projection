#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UiaCondition.ahk" { UiaCondition }
#Import ".\ConditionType.ahk" { ConditionType }

/**
 * Note  This structure is deprecated.  Contains information about a negative condition.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ns-uiautomationcoreapi-uianotcondition
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaNotCondition {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-conditiontype">ConditionType</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-conditiontype">ConditionType</a> enumerated type indicating the type of condition.
     */
    ConditionType : ConditionType

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a>*</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a> structure containing information about the condition.
     */
    pCondition : UiaCondition.Ptr

}
