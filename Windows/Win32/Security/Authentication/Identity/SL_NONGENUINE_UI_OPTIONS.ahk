#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies an application that displays a dialog box when the SLIsGenuineLocal function indicates that an installation is not genuine.
 * @see https://docs.microsoft.com/windows/win32/api//slpublic/ns-slpublic-sl_nongenuine_ui_options
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SL_NONGENUINE_UI_OPTIONS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an <b>SLID</b> structure that specifies an application that displays a dialog box.
     * @type {Pointer<Guid>}
     */
    pComponentId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The return value that the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-slisgenuinelocal">SLIsGenuineLocal</a> function returns when an installation is not genuine.
     * @type {HRESULT}
     */
    hResultUI {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 24
    }
}
