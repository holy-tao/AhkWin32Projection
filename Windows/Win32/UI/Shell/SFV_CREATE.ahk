#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure is used with the SHCreateShellFolderView function.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-sfv_create
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SFV_CREATE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>UINT</b>
     * 
     * The size of the <b>SFV_CREATE</b> structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface of the folder for which to create the view.
     * @type {IShellFolder}
     */
    pshf {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the parent <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface. This parameter may be <b>NULL</b>. This parameter is used only when the view created by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreateshellfolderview">SHCreateShellFolderView</a> is hosted in a common dialog box.
     * @type {IShellView}
     */
    psvOuter {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-ishellfolderviewcb">IShellFolderViewCB</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-ishellfolderviewcb">IShellFolderViewCB</a> interface that handles the view's callbacks when various events occur. This parameter may be <b>NULL</b>.
     * @type {IShellFolderViewCB}
     */
    psfvcb {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 32
    }
}
