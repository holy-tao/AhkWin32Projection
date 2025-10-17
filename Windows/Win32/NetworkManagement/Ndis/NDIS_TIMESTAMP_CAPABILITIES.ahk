#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_OBJECT_HEADER.ahk
#Include .\NDIS_TIMESTAMP_CAPABILITY_FLAGS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_TIMESTAMP_CAPABILITIES extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    HardwareClockFrequencyHz {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {BOOLEAN}
     */
    CrossTimestamp {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {NDIS_TIMESTAMP_CAPABILITY_FLAGS}
     */
    TimestampFlags{
        get {
            if(!this.HasProp("__TimestampFlags"))
                this.__TimestampFlags := NDIS_TIMESTAMP_CAPABILITY_FLAGS(40, this)
            return this.__TimestampFlags
        }
    }
}
