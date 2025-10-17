#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains information about a hit test. This structure supersedes the TC_HITTESTINFO structure.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-tchittestinfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TCHITTESTINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * Position to hit test, in client coordinates.
     * @type {POINT}
     */
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(0, this)
            return this.__pt
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
