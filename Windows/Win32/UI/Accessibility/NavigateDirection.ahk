#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values used to specify the direction of navigation within the Microsoft UI Automation tree.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-navigatedirection
 * @namespace Windows.Win32.UI.Accessibility
 */
class NavigateDirection extends Win32Enum {

    /**
     * The navigation direction is to the parent.
     * Native name: NavigateDirection_Parent
     * @type {Integer (Int32)}
     */
    static Parent => 0

    /**
     * The navigation direction is to the next sibling.
     * Native name: NavigateDirection_NextSibling
     * @type {Integer (Int32)}
     */
    static NextSibling => 1

    /**
     * The navigation direction is to the previous sibling.
     * Native name: NavigateDirection_PreviousSibling
     * @type {Integer (Int32)}
     */
    static PreviousSibling => 2

    /**
     * The navigation direction is to the first child.
     * Native name: NavigateDirection_FirstChild
     * @type {Integer (Int32)}
     */
    static FirstChild => 3

    /**
     * The navigation direction is to the last child.
     * Native name: NavigateDirection_LastChild
     * @type {Integer (Int32)}
     */
    static LastChild => 4
}
