#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\UIAutomationType.ahk" { UIAutomationType }
#Import "..\..\..\..\Guid.ahk" { Guid }

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
export default struct UIAutomationPropertyInfo {
    #StructPack 8

    /**
     * Type: <b>GUID</b>
     * 
     * The unique identifier of the property.
     */
    guid : Guid

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The programmatic name of the property (a non-localizable string).
     */
    pProgrammaticName : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-uiautomationtype">UIAutomationType</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-uiautomationtype">UIAutomationType</a> enumerated type indicating the data type of the property value.
     */
    type : UIAutomationType

}
