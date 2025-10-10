#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Contains extended parameters for the TrackPopupMenuEx function.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-tpmparams
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class TPMPARAMS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>UINT</b>
     * 
     * The size of structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The rectangle to be excluded when positioning the window, in screen coordinates.
     * @type {RECT}
     */
    rcExclude{
        get {
            if(!this.HasProp("__rcExclude"))
                this.__rcExclude := RECT(this.ptr + 8)
            return this.__rcExclude
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 24
    }
}
