#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information for merging menu items into Windows Explorer menus.
 * @remarks
 * 
  * See <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu-querycontextmenu">IContextMenu::QueryContextMenu</a> as this structure performs the same role as the parameters of that method. Note, however, that the information provided by the return value of that method is not a parallel to the information provided by the return value of an operation involving <b>QCMINFO</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-qcminfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class QCMINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>HMENU</b>
     * 
     * [in] The handle of the menu where the new commands are to be added.
     * @type {Pointer<Void>}
     */
    hmenu {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * [in] The zero-based index where the first menu item are to be inserted.
     * @type {Integer}
     */
    indexMenu {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * [in, out] On entry, this member contains the first available ID to be used for the context menu. On exit, it contains the last ID added plus one.
     * @type {Integer}
     */
    idCmdFirst {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * [in] The maximum value for a menu item identifier. The difference between the input value of <b>idCmdFirst</b> and <b>idCmdLast</b> is the maximum number of menu items that can be added.
     * @type {Integer}
     */
    idCmdLast {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>QCMINFO_IDMAP*</b>
     * 
     * Not used, must be <b>NULL</b>.
     * @type {Pointer<QCMINFO_IDMAP>}
     */
    pIdMap {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
