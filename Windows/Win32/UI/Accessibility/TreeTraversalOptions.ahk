#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The TreeTraversalOptions (uiautomationclient.h) enumeration defines values that can be used to customize tree navigation order.
 * @remarks
 * Option groups (flags):
 * 
 * <ul>
 * <li>Traversal order (pre-order, post-order) defines when nodes should be tested 
 * against search conditions. For example, "on enter" or "on leave".
 * </li>
 * <li> Visit order defines in which order relatives are visited. Relatives include
 * children and siblings. Visit orders are relative to parents. From the child 
 * perspective First-to-Last means "visit the next sibling from the child" while
 * Last-to-First means "visit the previous sibling from the child".
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/ne-uiautomationclient-treetraversaloptions
 * @namespace Windows.Win32.UI.Accessibility
 */
class TreeTraversalOptions extends Win32Enum {

    /**
     * Pre-order,
     *     visit children from first to last.
     * Native name: TreeTraversalOptions_Default
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Post-order, see Remarks for more info.
     * Native name: TreeTraversalOptions_PostOrder
     * @type {Integer (Int32)}
     */
    static PostOrder => 1

    /**
     * Visit children from last to first.
     * Native name: TreeTraversalOptions_LastToFirstOrder
     * @type {Integer (Int32)}
     */
    static LastToFirstOrder => 2
}
