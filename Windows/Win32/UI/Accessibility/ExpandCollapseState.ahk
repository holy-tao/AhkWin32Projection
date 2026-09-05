#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the state of a UI element that can be expanded and collapsed.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-expandcollapsestate
 * @namespace Windows.Win32.UI.Accessibility
 */
class ExpandCollapseState extends Win32Enum {

    /**
     * No children are visible.
     * Native name: ExpandCollapseState_Collapsed
     * @type {Integer (Int32)}
     */
    static Collapsed => 0

    /**
     * All children are visible.
     * Native name: ExpandCollapseState_Expanded
     * @type {Integer (Int32)}
     */
    static Expanded => 1

    /**
     * Some, but not all, children are visible.
     * Native name: ExpandCollapseState_PartiallyExpanded
     * @type {Integer (Int32)}
     */
    static PartiallyExpanded => 2

    /**
     * The element does not expand or collapse.
     * Native name: ExpandCollapseState_LeafNode
     * @type {Integer (Int32)}
     */
    static LeafNode => 3
}
