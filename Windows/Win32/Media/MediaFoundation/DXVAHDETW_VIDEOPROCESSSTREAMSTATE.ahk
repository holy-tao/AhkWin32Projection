#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXVAHD_STREAM_STATE.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVAHDETW_VIDEOPROCESSSTREAMSTATE extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    pObject {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    StreamNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {DXVAHD_STREAM_STATE}
     */
    State {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {BOOL}
     */
    SetState {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
