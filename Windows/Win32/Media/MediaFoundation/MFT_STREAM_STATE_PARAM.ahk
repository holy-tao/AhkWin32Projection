#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MF_STREAM_STATE.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFT_STREAM_STATE_PARAM extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    StreamId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {MF_STREAM_STATE}
     */
    State {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
