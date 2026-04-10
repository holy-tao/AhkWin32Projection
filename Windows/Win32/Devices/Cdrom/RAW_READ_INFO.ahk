#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TRACK_MODE_TYPE.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
class RAW_READ_INFO extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    DiskOffset {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SectorCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {TRACK_MODE_TYPE}
     */
    TrackMode {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
