#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSSTREAM_UVC_METADATATYPE_TIMESTAMP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    PresentationTimeStamp {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SourceClockReference {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This bitfield backs the following members:
     * - Counter
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Counter {
        get => (this._bitfield >> 0) & 0x7FF
        set => this._bitfield := ((value & 0x7FF) << 0) | (this._bitfield & ~(0x7FF << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => (this._bitfield >> 11) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 11) | (this._bitfield & ~(0x1F << 11))
    }

    /**
     * @type {Integer}
     */
    SCRToken {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
