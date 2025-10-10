#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that specify the state of a UI element that can be expanded and collapsed.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/ne-uiautomationcore-expandcollapsestate
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ExpandCollapseState{

    /**
     * No children are visible.
     * @type {Integer (Int32)}
     */
    static ExpandCollapseState_Collapsed => 0

    /**
     * All children are visible.
     * @type {Integer (Int32)}
     */
    static ExpandCollapseState_Expanded => 1

    /**
     * Some, but not all, children are visible.
     * @type {Integer (Int32)}
     */
    static ExpandCollapseState_PartiallyExpanded => 2

    /**
     * The element does not expand or collapse.
     * @type {Integer (Int32)}
     */
    static ExpandCollapseState_LeafNode => 3
}
