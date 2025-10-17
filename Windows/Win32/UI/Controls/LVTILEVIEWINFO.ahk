#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Provides information about a list-view control when it is displayed in tile view.
 * @remarks
 * 
  * By default, the dimensions of tiles are determined automatically. To apply a fixed size, supply the correct value or values in <b>sizeTile</b> and set the appropriate flag in <b>dwFlags</b>. Allow enough vertical space for all lines of the label to be displayed. If a line does not fit in the allowed horizontal space, it is terminated with an ellipsis.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-lvtileviewinfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LVTILEVIEWINFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the <b>LVTILEVIEWINFO</b> structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a></b>
     * 
     * Size of an individual tile. Values for dimensions not specified as fixed in <b>dwFlags</b> are ignored.
     * @type {SIZE}
     */
    sizeTile{
        get {
            if(!this.HasProp("__sizeTile"))
                this.__sizeTile := SIZE(16, this)
            return this.__sizeTile
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * Maximum number of text lines in each item label, not counting the title.
     * @type {Integer}
     */
    cLines {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> that contains coordinates of the label margin.
     * @type {RECT}
     */
    rcLabelMargin{
        get {
            if(!this.HasProp("__rcLabelMargin"))
                this.__rcLabelMargin := RECT(32, this)
            return this.__rcLabelMargin
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 48
    }
}
