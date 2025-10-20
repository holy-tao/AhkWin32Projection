#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains additional arguments used by DFM_INVOKECOMMANDEX.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-dfmics
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DFMICS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Zero, or one or more of the following flags that specify how to handle the data in the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfo">CMINVOKECOMMANDINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfoex">CMINVOKECOMMANDINFOEX</a> structure pointed to by <b>pici</b>.
     * @type {Integer}
     */
    fMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>LPARAM</b>
     * 
     * A pointer to a null-terminated string that contains additional arguments to the selected menu command. This member can be <b>NULL</b>.
     * @type {LPARAM}
     */
    lParam {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The minimum value that the handler can specify for a menu item identifier.
     * @type {Integer}
     */
    idCmdFirst {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The maximum value that the handler can specify for a menu item identifier.
     * @type {Integer}
     */
    idDefMax {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>LPCMINVOKECOMMANDINFO</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfo">CMINVOKECOMMANDINFO</a> or <b>CMINVOKECOMMANDINFO</b> structure.
     * @type {Pointer<CMINVOKECOMMANDINFO>}
     */
    pici {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the site of the context menu handler.
     * @type {IUnknown}
     */
    punkSite {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 40
    }
}
