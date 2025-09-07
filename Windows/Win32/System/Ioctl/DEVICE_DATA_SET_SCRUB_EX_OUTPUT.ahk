#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DEVICE_DATA_SET_RANGE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_DATA_SET_SCRUB_EX_OUTPUT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    BytesProcessed {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    BytesRepaired {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    BytesFailed {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {DEVICE_DATA_SET_RANGE}
     */
    ParityExtent{
        get {
            if(!this.HasProp("__ParityExtent"))
                this.__ParityExtent := DEVICE_DATA_SET_RANGE(this.ptr + 24)
            return this.__ParityExtent
        }
    }

    /**
     * @type {Integer}
     */
    BytesScrubbed {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
