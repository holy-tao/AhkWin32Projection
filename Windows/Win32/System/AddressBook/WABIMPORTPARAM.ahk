#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Do not use. Structure passed to Import that gives information about importing .wab files.
 * @see https://learn.microsoft.com/windows/win32/api/wabapi/ns-wabapi-wabimportparam
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class WABIMPORTPARAM extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies the size of the structure in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a> interface that specifies the address book object to import to.
     * @type {Pointer<IAddrBook>}
     */
    lpAdrBook {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {HWND}
     */
    hWnd{
        get {
            if(!this.HasProp("__hWnd"))
                this.__hWnd := HWND(this.ptr + 16)
            return this.__hWnd
        }
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies flags affecting behavior.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>LPSTR</b>
     * 
     * Value of type <b>LPSTR</b> that specifies the filename to import, or <b>NULL</b> to cause a FileOpen dialog box to open.
     * @type {PSTR}
     */
    lpszFileName{
        get {
            if(!this.HasProp("__lpszFileName"))
                this.__lpszFileName := PSTR(this.ptr + 32)
            return this.__lpszFileName
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
