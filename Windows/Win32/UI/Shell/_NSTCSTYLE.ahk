#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the characteristics of a given namespace tree control.
 * @remarks
 * Three values have effect only in conjunction with NSTCS_CHECKBOXES: NSTCS_PARTIALCHECKBOXES, NSTCS_EXCLUSIONCHECKBOXES, and NSTCS_DIMMEDCHECKBOXES. The icons associated with these states are inserted into the state image list as follows:
 * 
 * 
 * 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>Image Slot</th>
 * <th>Image</th>
 * <th>Associated Flags</th>
 * </tr>
 * <tr>
 * <td>0</td>
 * <td>Blank</td>
 * <td>NSTCS_CHECKBOXES</td>
 * </tr>
 * <tr>
 * <td>1</td>
 * <td>Unchecked</td>
 * <td>NSTCS_CHECKBOXES</td>
 * </tr>
 * <tr>
 * <td>2</td>
 * <td>Checked</td>
 * <td>NSTCS_CHECKBOXES</td>
 * </tr>
 * <tr>
 * <td>3</td>
 * <td>Partial</td>
 * <td>NSTCS_CHECKBOXES | NSTCS_PARTIALCHECKBOXES</td>
 * </tr>
 * <tr>
 * <td>4</td>
 * <td>Exclusion (red X)</td>
 * <td>NSTCS_CHECKBOXES | NSTCS_EXCLUSIONCHECKBOXES</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _NSTCSTYLE extends Win32Enum{

    /**
     * The control displays a triangle—known as an expando—on the leftmost edge of those items that have child items. Clicking on the expando expands the item to reveal the children of the item. Has no effect when combined with NSTCS_SHOWTABSBUTTON, NSTCS_SHOWDELETEBUTTON, or NSTCS_SHOWREFRESHBUTTON.
     * 
     *                         
     * 
     * Maps to the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-styles">TVS_HASBUTTONS</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_HASEXPANDOS => 1

    /**
     * The control draws lines to the left of the tree items that lead to their individual parent items. Has no effect when combined with NSTCS_SHOWTABSBUTTON, NSTCS_SHOWDELETEBUTTON, or NSTCS_SHOWREFRESHBUTTON.
     *                     
     *                         
     * 
     * Maps to the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-styles">TVS_HASLINES</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_HASLINES => 2

    /**
     * An item expands to show its child items in response to a single mouse click.
     *                     
     *                         
     * 
     * Maps to the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-styles">TVS_SINGLEEXPAND</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_SINGLECLICKEXPAND => 4

    /**
     * The selection of an item fills the row with inverse text to the end of the window area, regardless of the length of the text. When this option is not declared, only the area behind text is inverted. This value cannot be combined with NSTCS_HASLINES.
     * 
     *                         
     * 
     * Maps to the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-styles">TVS_FULLROWSELECT</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_FULLROWSELECT => 8

    /**
     * When one item is selected and expanded and you select a second item, the first selection automatically collapses.
     *                         
     * 
     * This is the opposite of the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-extended-styles">TVS_EX_NOSINGLECOLLAPSE</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_SPRINGEXPAND => 16

    /**
     * The area of the window that contains the tree of namespace items has a horizontal scroll bar.
     *                     
     *                         
     * 
     * Maps to the <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">WS_HSCROLL</a> Windows style.
     * @type {Integer (Int32)}
     */
    static NSTCS_HORIZONTALSCROLL => 32

    /**
     * The root item is preceded by an expando that allows expansion of the root item.
     *                     
     *                         
     * 
     * Maps to the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-styles">TVS_LINESATROOT</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_ROOTHASEXPANDO => 64

    /**
     * The node of an item is outlined when the control does not have the focus.
     *                     
     *                         
     * 
     * Maps to the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-styles">TVS_SHOWSELALWAYS</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_SHOWSELECTIONALWAYS => 128

    /**
     * Do not display infotips when the mouse cursor is over an item.
     *                     
     *                         
     * 
     * This is the opposite of the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-styles">TVS_INFOTIP</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_NOINFOTIP => 512

    /**
     * Sets the height of the items to an even height. By default, the height of items can be even or odd.
     *                     
     *                         
     * 
     * This is the opposite of the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-styles">TVS_NONEVENHEIGHT</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_EVENHEIGHT => 1024

    /**
     * Do not replace the <b>Open</b> command in the shortcut menu with a user-defined function.
     * @type {Integer (Int32)}
     */
    static NSTCS_NOREPLACEOPEN => 2048

    /**
     * Do not allow drag-and-drop operations within the control. Note that you can still drag an item from outside of the control and drop it onto the control.
     * 
     *                         
     * 
     * Maps to the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-styles">TVS_DISABLEDRAGDROP</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_DISABLEDRAGDROP => 4096

    /**
     * Do not persist reordering changes. Used with NSTCS_FAVORITESMODE. If favorites mode is not specified, this flag has no effect.
     * @type {Integer (Int32)}
     */
    static NSTCS_NOORDERSTREAM => 8192

    /**
     * Use a rich tooltip. Rich tooltips display the item's icon in addition to the item's text. A standard tooltip displays only the item's text. The tree view displays tooltips only for items in the tree that are partially visible.
     * 
     *                         
     * 
     * Maps to the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-extended-styles">TVS_EX_RICHTOOLTIP</a> tree view control style.
     * 
     * NSTCS_RICHTOOLTIP has no effect unless it is combined with NSTCS_NOINFOTIP and/or NSTCS_FAVORITESMODE. If NSTCS_NOINFOTIP is not specified, the tree view displays an infotip instead of a tooltip. If NSTCS_FAVORITESMODE is not specified, the namespace tree control always sets the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-extended-styles">TVS_EX_RICHTOOLTIP</a> style.
     * @type {Integer (Int32)}
     */
    static NSTCS_RICHTOOLTIP => 16384

    /**
     * Draw a thin border around the control. Corresponds to <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">WS_BORDER</a>.
     * @type {Integer (Int32)}
     */
    static NSTCS_BORDER => 32768

    /**
     * Do not allow creation of an in-place edit box, which would allow the user to rename the given item.
     *                     
     *                         
     * 
     * This is the opposite of the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-styles">TVS_EDITLABELS</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_NOEDITLABELS => 65536

    /**
     * If the control is hosted, you can tabstop into the control. Corresponds to <a href="https://docs.microsoft.com/windows/desktop/winmsg/extended-window-styles">WS_EX_CONTROLPARENT</a>.
     * @type {Integer (Int32)}
     */
    static NSTCS_TABSTOP => 131072

    /**
     * The control has the appearance of the favorites band in Windows XP.
     * @type {Integer (Int32)}
     */
    static NSTCS_FAVORITESMODE => 524288

    /**
     * When you hover the mouse pointer over an item that extends past the end of the control window, the control automatically scrolls horizontally so that the item appears more fully in the window area.
     * 
     *                         
     * 
     * Maps to the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-extended-styles">TVS_EX_AUTOHSCROLL</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_AUTOHSCROLL => 1048576

    /**
     * If the control does not have the focus and there are items that are preceded by expandos, then these expandos are visible only when the mouse pointer is near to the control.
     * 
     *                         
     * 
     * Maps to the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-extended-styles">TVS_EX_FADEINOUTEXPANDOS</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_FADEINOUTEXPANDOS => 2097152

    /**
     * If an item has no children and is not expanded, then that item contains a line of text at the child level that says "empty".
     * @type {Integer (Int32)}
     */
    static NSTCS_EMPTYTEXT => 4194304

    /**
     * Items have check boxes on their leftmost side. These check boxes can be of types partial, exclusion or dimmed, which correspond to the flags NSTCS_PARTIALCHECKBOXES, NSTCS_EXCLUSIONCHECKBOXES, and NSTCS_DIMMEDCHECKBOXES.
     * 
     *                         
     * 
     * Maps to the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-styles">TVS_CHECKBOXES</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_CHECKBOXES => 8388608

    /**
     * Adds a checkbox icon on the leftmost side of a given item with a square in the center, that indicates that the node is partially selected. Must be combined with NSTCS_CHECKBOXES.
     * 
     *                         
     * 
     * Maps to the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-extended-styles">TVS_EX_PARTIALCHECKBOXES</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_PARTIALCHECKBOXES => 16777216

    /**
     * Adds a checkbox icon on the leftmost side of a given item that contains a red <b>X</b>, which indicates that the item is excluded from the current selection. Without this exclusion icon, selection of a parent item includes selection of its child items. Must be combined with NSTCS_CHECKBOXES.
     * 
     *                         
     * 
     * Maps to the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-extended-styles">TVS_EX_EXCLUSIONCHECKBOXES</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_EXCLUSIONCHECKBOXES => 33554432

    /**
     * Adds a checkbox on the leftmost side of a given item that contains an icon of a dimmed check mark, that indicates that a node is selected because its parent is selected. Must be combined with NSTCS_CHECKBOXES.
     * 
     *                         
     * 
     * Maps to the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-extended-styles">TVS_EX_DIMMEDCHECKBOXES</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_DIMMEDCHECKBOXES => 67108864

    /**
     * Check boxes are located at the far left edge of the window area instead of being indented.
     *                     
     *                         
     * 
     * Maps to the <a href="https://docs.microsoft.com/windows/desktop/Controls/tree-view-control-window-extended-styles">TVS_EX_NOINDENTSTATE</a> tree view control style.
     * @type {Integer (Int32)}
     */
    static NSTCS_NOINDENTCHECKS => 134217728

    /**
     * Allow junctions. A junction point, or just junction, is a root of a namespace extension that is normally displayed by Windows Explorer as a folder in both tree and folder views. For Windows Explorer to display your extension's files and subfolders, you must specify where the root folder is located in the Shell namespace hierarchy.
     *                     
     *                      
     * 
     * Junctions exist in the file system as files, but are not treated as files. An example is a compressed file with a .zip file name extension, which to the file system is just a file. However, if this file is treated as a junction, it can represent an entire namespace. This allows the namespace tree control to treat compressed files and similar junctions as folders rather than as files.
     * @type {Integer (Int32)}
     */
    static NSTCS_ALLOWJUNCTIONS => 268435456

    /**
     * Displays an arrow on the right side of an item if the item is a folder. The action associated with the arrow is implementation specific. Cannot be combined with NSTCS_SHOWDELETEBUTTON or NSTCS_SHOWREFRESHBUTTON.
     * @type {Integer (Int32)}
     */
    static NSTCS_SHOWTABSBUTTON => 536870912

    /**
     * Displays a red <b>X</b> on the right side of an item. The action associated with the <b>X</b> is implementation specific. Cannot be combined with NSTCS_SHOWTABSBUTTON or NSTCS_SHOWREFRESHBUTTON.
     * @type {Integer (Int32)}
     */
    static NSTCS_SHOWDELETEBUTTON => 1073741824

    /**
     * Displays a refresh button on the right side of an item. The action associated with the button is implementation specific. Cannot be combined with NSTCS_SHOWTABSBUTTON or NSTCS_SHOWDELETEBUTTON.
     * @type {Integer (Int32)}
     */
    static NSTCS_SHOWREFRESHBUTTON => -2147483648
}
