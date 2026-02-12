#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the types of change in the Microsoft UI Automation tree structure.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationstructurechangetype
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class AutomationStructureChangeType extends Win32Enum{

    /**
     * A child has been added to the current node.
     * @type {Integer (Int32)}
     */
    static ChildAdded => 0

    /**
     * A child has been removed from the current node.
     * @type {Integer (Int32)}
     */
    static ChildRemoved => 1

    /**
     * One or more children of the current node have been invalidated.
     * @type {Integer (Int32)}
     */
    static ChildrenInvalidated => 2

    /**
     * Children have been bulk added to the current node.
     * @type {Integer (Int32)}
     */
    static ChildrenBulkAdded => 3

    /**
     * Children have been bulk removed from the current node.
     * @type {Integer (Int32)}
     */
    static ChildrenBulkRemoved => 4

    /**
     * The children of the current node have been reordered.
     * @type {Integer (Int32)}
     */
    static ChildrenReordered => 5
}
