#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the [ExpandCollapseState](../windows.ui.xaml.automation.provider/iexpandcollapseprovider_expandcollapsestate.md) automation property value of a UI Automation element.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.expandcollapsestate
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class ExpandCollapseState extends Win32Enum{

    /**
     * No child nodes, controls, or content of the UI Automation element are displayed.
     * @type {Integer (Int32)}
     */
    static Collapsed => 0

    /**
     * All child nodes, controls, and content of the UI Automation element are displayed.
     * @type {Integer (Int32)}
     */
    static Expanded => 1

    /**
     * Some, but not all, child nodes, controls, or content of the UI Automation element are displayed.
     * @type {Integer (Int32)}
     */
    static PartiallyExpanded => 2

    /**
     * The UI Automation element has no child nodes, controls, or content to display.
     * @type {Integer (Int32)}
     */
    static LeafNode => 3
}
