#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains image list statistics. Used by GetStatistics.
 * @see https://docs.microsoft.com/windows/win32/api//commoncontrols/ns-commoncontrols-imageliststats
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class IMAGELISTSTATS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The image list size.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The number of images allocated.
     * @type {Integer}
     */
    cAlloc {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>int</b>
     * 
     * The number of images in use.
     * @type {Integer}
     */
    cUsed {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * The number of standby images.
     * @type {Integer}
     */
    cStandby {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 16
    }
}
