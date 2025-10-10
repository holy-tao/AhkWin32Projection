#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information from a menu band.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ns-shobjidl_core-smdata
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SMDATA extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * A mask that is always set to SMDM_HMENU.
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>HMENU</b>
     * 
     * The static menu portion of the menu band.
     * @type {Pointer<Void>}
     */
    hmenu {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * The HWND value of the owner window.
     * @type {Pointer<Void>}
     */
    hwnd {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The identifier of the menu item. This value is -1 for the menu itself.
     * @type {Integer}
     */
    uId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The identifier of the parent menu.
     * @type {Integer}
     */
    uIdParent {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>UINT</b>
     * @type {Integer}
     */
    uIdAncestor {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>IUknown*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the <a href="https://docs.microsoft.com/windows/desktop/shell/profiles-directory">MenuBand</a> object.
     * @type {Pointer<IUnknown>}
     */
    punk {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>PIDLIST_ABSOLUTE</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> of the shell folder portion of the menu.
     * @type {Pointer<ITEMIDLIST>}
     */
    pidlFolder {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>PUITEMID_CHILD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> of the selected item in the shell folder portion of the menu.
     * @type {Pointer<ITEMIDLIST>}
     */
    pidlItem {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface for the folder associated with the shell folder portion of the menu.
     * @type {Pointer<IShellFolder>}
     */
    psf {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: <b>void*</b>
     * 
     * A pointer to a user-defined data structure.
     * @type {Pointer<Void>}
     */
    pvUserData {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
