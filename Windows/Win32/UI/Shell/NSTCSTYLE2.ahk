#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by methods of the INameSpaceTreeControl2 to specify extended display styles in a Shell namespace treeview.
 * @remarks
 * The value NSTCS2_ALLMASK can be used to mask for the NSTCS2_INTERRUPTNOTIFICATIONS, NSTCS2_SHOWNULLSPACEMENU, and NSTCS2_DISPLAYPADDING values.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/ne-shobjidl-nstcstyle2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class NSTCSTYLE2 extends Win32BitflagEnum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NSTCS2_DEFAULT => 0

    /**
     * Displays interrupt notifications.
     * @type {Integer (Int32)}
     */
    static NSTCS2_INTERRUPTNOTIFICATIONS => 1

    /**
     * Displays the context menu in the padding space.
     * @type {Integer (Int32)}
     */
    static NSTCS2_SHOWNULLSPACEMENU => 2

    /**
     * Inserts spacing (padding) between top-level nodes.
     * @type {Integer (Int32)}
     */
    static NSTCS2_DISPLAYPADDING => 4

    /**
     * Filters items based on the <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-ispinnedtonamespacetree">System.IsPinnedToNameSpaceTree</a> value when <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-inamespacetreecontrolfoldercapabilities">INameSpaceTreeControlFolderCapabilities</a> is implemented.
     * @type {Integer (Int32)}
     */
    static NSTCS2_DISPLAYPINNEDONLY => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NTSCS2_NOSINGLETONAUTOEXPAND => 16

    /**
     * Do not insert nonenumerated (SFGAO_NONENUMERATED) items in the tree.
     * @type {Integer (Int32)}
     */
    static NTSCS2_NEVERINSERTNONENUMERATED => 32
}
