#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TS_SELECTIONSTYLE.ahk

/**
 * The TS_SELECTION_ACP structure contains ACP-based text selection data.
 * @see https://docs.microsoft.com/windows/win32/api//textstor/ns-textstor-ts_selection_acp
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TS_SELECTION_ACP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains the start position of the selection.
     * @type {Integer}
     */
    acpStart {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Contains the end position of the selection.
     * @type {Integer}
     */
    acpEnd {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_selectionstyle">TS_SELECTIONSTYLE</a> structure that contains additional selection data.
     * @type {TS_SELECTIONSTYLE}
     */
    style{
        get {
            if(!this.HasProp("__style"))
                this.__style := TS_SELECTIONSTYLE(this.ptr + 8)
            return this.__style
        }
    }
}
