#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the SHCreateShellFolderViewEx function.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-csfv
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CSFV extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b>UINT</b>
     * 
     * The size of the <b>CSFV</b> structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object for which to create the view.
     * @type {IShellFolder}
     */
    pshf {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the parent <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> interface. This parameter can be <b>NULL</b>.
     * @type {IShellView}
     */
    psvOuter {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * Ignored.
     * @type {Pointer<ITEMIDLIST>}
     */
    pidl {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>LONG</b>
     * @type {Integer}
     */
    lEvents {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nc-shlobj_core-lpfnviewcallback">LPFNVIEWCALLBACK</a></b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nc-shlobj_core-lpfnviewcallback">LPFNVIEWCALLBACK</a> function used by this folder view to handle callback messages. This parameter can be <b>NULL</b>.
     * @type {Pointer<LPFNVIEWCALLBACK>}
     */
    pfnCallback {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a></b>
     * @type {Integer}
     */
    fvm {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 56
    }
}
