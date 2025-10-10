#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\STRRET.ahk

/**
 * Contains detail information for a Shell folder item. Used with the SFVM_GETDETAILSOF notification.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-detailsinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DETAILSINFO extends Win32Struct
{
    static sizeof => 296

    static packingSize => 8

    /**
     * Type: <b>PCUITEMID_CHILD</b>
     * 
     * PIDL of the item whose details are being retrieved.
     * @type {Pointer<ITEMIDLIST>}
     */
    pidl {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * @type {Integer}
     */
    fmt {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * The number of average-sized characters in the heading.
     * @type {Integer}
     */
    cxChar {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-strret">STRRET</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-strret">STRRET</a> structure that includes a string containing the requested detail. To convert this structure to a string, use <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-strrettobufa">StrRetToBuf</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-strrettostra">StrRetToStr</a>.
     * @type {STRRET}
     */
    str{
        get {
            if(!this.HasProp("__str"))
                this.__str := STRRET(this.ptr + 16)
            return this.__str
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * The index of an icon in the Shell image list that is displayed in the view.
     * @type {Integer}
     */
    iImage {
        get => NumGet(this, 288, "int")
        set => NumPut("int", value, this, 288)
    }
}
