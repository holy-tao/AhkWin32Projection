#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\POINT.ahk
#Include ..\..\..\Foundation\RECT.ahk

/**
 * Contains position information for the candidate window.
 * @see https://docs.microsoft.com/windows/win32/api//imm/ns-imm-candidateform
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class CANDIDATEFORM extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Candidate list identifier. It is 0 for the first list, 1 for the second, and so on. The maximum index is 3.
     * @type {Integer}
     */
    dwIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwStyle {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure containing the coordinates of the upper left corner of the candidate window or the caret position, depending on the value of <b>dwStyle</b>.
     * @type {POINT}
     */
    ptCurrentPos{
        get {
            if(!this.HasProp("__ptCurrentPos"))
                this.__ptCurrentPos := POINT(this.ptr + 8)
            return this.__ptCurrentPos
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the coordinates of the upper left and lower right corners of the exclusion area.
     * @type {RECT}
     */
    rcArea{
        get {
            if(!this.HasProp("__rcArea"))
                this.__rcArea := RECT(this.ptr + 16)
            return this.__rcArea
        }
    }
}
