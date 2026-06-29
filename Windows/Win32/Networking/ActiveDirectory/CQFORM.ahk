#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\UI\WindowsAndMessaging\HICON.ahk

/**
 * Used to define a query form added to the query dialog box with the CQAddFormsProc callback function.
 * @see https://learn.microsoft.com/windows/win32/api/cmnquery/ns-cmnquery-cqform
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
class CQFORM extends Win32Struct {
    static sizeof => 40

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains  the class identifier used to identify the query form.
     * @type {Guid}
     */
    clsid {
        get {
            if(!this.HasProp("__clsid"))
                this.__clsid := Guid(8, this)
            return this.__clsid
        }
    }

    /**
     * Contains the  handle of the icon to be displayed with the query form.
     * @type {HICON}
     */
    hIcon {
        get {
            if(!this.HasProp("__hIcon"))
                this.__hIcon := HICON(24, this)
            return this.__hIcon
        }
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the title of the query form.
     * @type {PWSTR}
     */
    pszTitle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
