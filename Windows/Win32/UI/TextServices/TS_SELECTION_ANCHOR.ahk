#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TS_SELECTIONSTYLE.ahk

/**
 * The TS_SELECTION_ANCHOR structure contains anchor-based text selection data.
 * @see https://learn.microsoft.com/windows/win32/api/textstor/ns-textstor-ts_selection_anchor
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TS_SELECTION_ANCHOR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Contains the start anchor of the selection.
     * @type {Pointer<IAnchor>}
     */
    paStart {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Contains the end anchor of the selection.
     * @type {Pointer<IAnchor>}
     */
    paEnd {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_selectionstyle">TS_SELECTIONSTYLE</a> structure that contains additional selection data.
     * @type {TS_SELECTIONSTYLE}
     */
    style{
        get {
            if(!this.HasProp("__style"))
                this.__style := TS_SELECTIONSTYLE(this.ptr + 16)
            return this.__style
        }
    }
}
