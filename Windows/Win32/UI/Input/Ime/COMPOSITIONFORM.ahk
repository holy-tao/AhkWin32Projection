#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\POINT.ahk
#Include ..\..\..\Foundation\RECT.ahk

/**
 * Contains style and position information for a composition window.
 * @remarks
 * 
  * Some IME windows adjust the composition window position specified by the system or the application. The CFS_FORCE_POSITION directs the IME window to skip this adjustment.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imm/ns-imm-compositionform
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class COMPOSITIONFORM extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwStyle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure containing the coordinates of the upper left corner of the composition window.
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the coordinates of the upper left and lower right corners of the composition window.
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
