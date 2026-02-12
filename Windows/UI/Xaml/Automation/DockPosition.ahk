#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the dock position of an object within a docking container. Used by [IDockProvider.DockPosition](../windows.ui.xaml.automation.provider/idockprovider_dockposition.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.dockposition
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class DockPosition extends Win32Enum{

    /**
     * Indicates that the UI Automation element is docked along the top edge of the docking container.
     * @type {Integer (Int32)}
     */
    static Top => 0

    /**
     * Indicates that the UI Automation element is docked along the left edge of the docking container.
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * Indicates that the UI Automation element is docked along the bottom edge of the docking container.
     * @type {Integer (Int32)}
     */
    static Bottom => 2

    /**
     * Indicates that the UI Automation element is docked along the right edge of the docking container.
     * @type {Integer (Int32)}
     */
    static Right => 3

    /**
     * Indicates that the UI Automation element is docked along all edges of the docking container and fills all available space within the container.
     * @type {Integer (Int32)}
     */
    static Fill => 4

    /**
     * Indicates that the UI Automation element is not docked to any edge of the docking container.
     * @type {Integer (Int32)}
     */
    static None => 5
}
