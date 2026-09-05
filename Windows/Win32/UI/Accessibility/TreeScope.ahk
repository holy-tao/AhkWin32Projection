#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The TreeScope (uiautomationclient.h) enumeration contains values that specify the scope of various operations in the Microsoft UI Automation tree.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/ne-uiautomationclient-treescope
 * @namespace Windows.Win32.UI.Accessibility
 */
class TreeScope extends Win32Enum {

    /**
     * The scope excludes the subtree from the search.
     * Native name: TreeScope_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The scope includes the element itself.
     * Native name: TreeScope_Element
     * @type {Integer (Int32)}
     */
    static Element => 1

    /**
     * The scope includes children of the element.
     * Native name: TreeScope_Children
     * @type {Integer (Int32)}
     */
    static Children => 2

    /**
     * The scope includes children and more distant descendants of the element.
     * Native name: TreeScope_Descendants
     * @type {Integer (Int32)}
     */
    static Descendants => 4

    /**
     * The scope includes the parent of the element.
     * Native name: TreeScope_Parent
     * @type {Integer (Int32)}
     */
    static Parent => 8

    /**
     * The scope includes the parent and more distant ancestors of the element.
     * Native name: TreeScope_Ancestors
     * @type {Integer (Int32)}
     */
    static Ancestors => 16

    /**
     * The scope includes the element and all its descendants. This flag is a combination of the TreeScope_Element and TreeScope_Descendants values.
     * Native name: TreeScope_Subtree
     * @type {Integer (Int32)}
     */
    static Subtree => 7
}
