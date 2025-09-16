#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to define a query form added to the query dialog box with the CQAddFormsProc callback function.
 * @see https://learn.microsoft.com/windows/win32/api/cmnquery/ns-cmnquery-cqform
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class CQFORM extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Contains the size, in bytes, of the structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains  the class identifier used to identify the query form.
     * @type {Pointer<Guid>}
     */
    clsid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Contains the  handle of the icon to be displayed with the query form.
     * @type {Pointer<HICON>}
     */
    hIcon {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the title of the query form.
     * @type {Pointer<PWSTR>}
     */
    pszTitle {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
