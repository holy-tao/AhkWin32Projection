#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Note  This structure is deprecated.  Contains information about a request to cache data about UI Automation elements.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UiaCacheRequest extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>UiaCondition *</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a> structure that specifies the condition that cached elements must match.
     * @type {Pointer<UiaCondition>}
     */
    pViewCondition {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope</a> enumerated type indicating the scope of the cache request; for example, whether it includes children of the root element.
     * @type {Integer}
     */
    Scope {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>PROPERTYID*</b>
     * 
     * The address of an array of identifiers for properties to cache. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @type {Pointer<Integer>}
     */
    pProperties {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>int</b>
     * 
     * The count of elements in the <b>pProperties</b> array.
     * @type {Integer}
     */
    cProperties {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>PATTERNID*</b>
     * 
     * The address of an array of identifiers for control patterns to cache. For a list of control pattern IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids">Control Pattern Identifiers</a>.
     * @type {Pointer<Integer>}
     */
    pPatterns {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>int</b>
     * 
     * The count of elements in the <b>pPatterns</b> array.
     * @type {Integer}
     */
    cPatterns {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-automationelementmode">AutomationElementMode</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-automationelementmode">AutomationElementMode</a> enumerated type indicating the type of reference to cached UI Automation elements that is to be returned.
     * @type {Integer}
     */
    automationElementMode {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }
}
