#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the directions of navigation within the Microsoft UI Automation tree.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationnavigationdirection
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class AutomationNavigationDirection extends Win32Enum{

    /**
     * Navigate to the parent of the current node.
     * @type {Integer (Int32)}
     */
    static Parent => 0

    /**
     * Navigate to the next sibling of the current node.
     * @type {Integer (Int32)}
     */
    static NextSibling => 1

    /**
     * Navigate to the previous sibling of the current node.
     * @type {Integer (Int32)}
     */
    static PreviousSibling => 2

    /**
     * Navigate to the first child of the current node.
     * @type {Integer (Int32)}
     */
    static FirstChild => 3

    /**
     * Navigate to the last child of the current node.
     * @type {Integer (Int32)}
     */
    static LastChild => 4
}
