#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QCMINFO_IDMAP.ahk" { QCMINFO_IDMAP }
#Import "..\WindowsAndMessaging\HMENU.ahk" { HMENU }

/**
 * Contains information for merging menu items into Windows Explorer menus.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu-querycontextmenu">IContextMenu::QueryContextMenu</a> as this structure performs the same role as the parameters of that method. Note, however, that the information provided by the return value of that method is not a parallel to the information provided by the return value of an operation involving <b>QCMINFO</b>.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-qcminfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct QCMINFO {
    #StructPack 8

    /**
     * Type: <b>HMENU</b>
     * 
     * [in] The handle of the menu where the new commands are to be added.
     */
    hmenu : HMENU

    /**
     * Type: <b>UINT</b>
     * 
     * [in] The zero-based index where the first menu item are to be inserted.
     */
    indexMenu : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * [in, out] On entry, this member contains the first available ID to be used for the context menu. On exit, it contains the last ID added plus one.
     */
    idCmdFirst : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * [in] The maximum value for a menu item identifier. The difference between the input value of <b>idCmdFirst</b> and <b>idCmdLast</b> is the maximum number of menu items that can be added.
     */
    idCmdLast : UInt32

    /**
     * Type: <b>QCMINFO_IDMAP*</b>
     * 
     * Not used, must be <b>NULL</b>.
     */
    pIdMap : QCMINFO_IDMAP.Ptr

}
