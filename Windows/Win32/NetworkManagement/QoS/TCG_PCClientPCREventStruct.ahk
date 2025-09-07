#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class TCG_PCClientPCREventStruct extends Win32Struct
{
    static sizeof => 33

    static packingSize => 1

    /**
     * @type {Integer}
     */
    pcrIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    eventType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    digest{
        get {
            if(!this.HasProp("__digestProxyArray"))
                this.__digestProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__digestProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    eventDataSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Array<Byte>}
     */
    event{
        get {
            if(!this.HasProp("__eventProxyArray"))
                this.__eventProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__eventProxyArray
        }
    }
}
