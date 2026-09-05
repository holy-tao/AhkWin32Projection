#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The AutomationElementMode (uiautomationclient.h) enumeration contains values that specify the type of reference to use when returning UI Automation elements.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/ne-uiautomationclient-automationelementmode
 * @namespace Windows.Win32.UI.Accessibility
 */
class AutomationElementMode extends Win32Enum {

    /**
     * Specifies that returned elements have no reference to the underlying UI and contain only cached information.
     * Native name: AutomationElementMode_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Specifies that returned elements have a full reference to the underlying UI.
     * Native name: AutomationElementMode_Full
     * @type {Integer (Int32)}
     */
    static Full => 1
}
