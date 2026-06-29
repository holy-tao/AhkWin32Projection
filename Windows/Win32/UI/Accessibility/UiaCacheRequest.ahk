#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AutomationElementMode.ahk" { AutomationElementMode }
#Import ".\UiaCondition.ahk" { UiaCondition }
#Import ".\TreeScope.ahk" { TreeScope }

/**
 * Note  This structure is deprecated.  Contains information about a request to cache data about UI Automation elements.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaCacheRequest {
    #StructPack 8

    /**
     * Type: <b>UiaCondition *</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a> structure that specifies the condition that cached elements must match.
     */
    pViewCondition : UiaCondition.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope</a> enumerated type indicating the scope of the cache request; for example, whether it includes children of the root element.
     */
    Scope : TreeScope

    /**
     * Type: <b>PROPERTYID*</b>
     * 
     * The address of an array of identifiers for properties to cache. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     */
    pProperties : IntPtr

    /**
     * Type: <b>int</b>
     * 
     * The count of elements in the <b>pProperties</b> array.
     */
    cProperties : Int32

    /**
     * Type: <b>PATTERNID*</b>
     * 
     * The address of an array of identifiers for control patterns to cache. For a list of control pattern IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids">Control Pattern Identifiers</a>.
     */
    pPatterns : IntPtr

    /**
     * Type: <b>int</b>
     * 
     * The count of elements in the <b>pPatterns</b> array.
     */
    cPatterns : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-automationelementmode">AutomationElementMode</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-automationelementmode">AutomationElementMode</a> enumerated type indicating the type of reference to cached UI Automation elements that is to be returned.
     */
    automationElementMode : AutomationElementMode

}
