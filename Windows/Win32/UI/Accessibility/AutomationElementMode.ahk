#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that specify the type of reference to use when returning UI Automation elements.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcoreapi/ne-uiautomationcoreapi-automationelementmode
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class AutomationElementMode{

    /**
     * Specifies that returned elements have no reference to the underlying UI and contain only cached information.
     * @type {Integer (Int32)}
     */
    static AutomationElementMode_None => 0

    /**
     * Specifies that returned elements have a full reference to the underlying UI.
     * @type {Integer (Int32)}
     */
    static AutomationElementMode_Full => 1
}
