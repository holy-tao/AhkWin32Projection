#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class TCG_PCClientTaggedEventStruct extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    EventID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    EventDataSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    EventData{
        get {
            if(!this.HasProp("__EventDataProxyArray"))
                this.__EventDataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__EventDataProxyArray
        }
    }
}
