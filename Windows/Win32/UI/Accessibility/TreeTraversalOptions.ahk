#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values that can be used to customize tree navigation order.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcoreapi/ne-uiautomationcoreapi-treetraversaloptions
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class TreeTraversalOptions{

    /**
     * Pre-order,
 *     visit children from first to last.
     * @type {Integer (Int32)}
     */
    static TreeTraversalOptions_Default => 0

    /**
     * Post-order, see Remarks for more info.
     * @type {Integer (Int32)}
     */
    static TreeTraversalOptions_PostOrder => 1

    /**
     * Visit children from last to first.
     * @type {Integer (Int32)}
     */
    static TreeTraversalOptions_LastToFirstOrder => 2
}
