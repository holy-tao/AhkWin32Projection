#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\UIAutomationType.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a custom property.
 * @remarks
 * A custom property must have one of the following data types specified by the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-uiautomationtype">UIAutomationType</a> enumeration. No other data types are supported for custom properties. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-custompropertieseventscontrolpatterns">Custom Properties, Events, and Control Patterns</a>.
 * 
 * 
 * <ul>
 * <li><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-uiautomationtype">UIAutomationType_Bool</a></li>
 * <li><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-uiautomationtype">UIAutomationType_Double</a></li>
 * <li><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-uiautomationtype">UIAutomationType_Element</a></li>
 * <li><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-uiautomationtype">UIAutomationType_Int</a></li>
 * <li><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-uiautomationtype">UIAutomationType_Point</a></li>
 * <li><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-uiautomationtype">UIAutomationType_String</a></li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ns-uiautomationcore-uiautomationpropertyinfo
 * @namespace Windows.Win32.UI.Accessibility
 */
class UIAutomationPropertyInfo extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>GUID</b>
     * 
     * The unique identifier of the property.
     * @type {Guid}
     */
    guid {
        get {
            if(!this.HasProp("__guid"))
                this.__guid := Guid(0, this)
            return this.__guid
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The programmatic name of the property (a non-localizable string).
     * @type {PWSTR}
     */
    pProgrammaticName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-uiautomationtype">UIAutomationType</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-uiautomationtype">UIAutomationType</a> enumerated type indicating the data type of the property value.
     * @type {UIAutomationType}
     */
    type {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
