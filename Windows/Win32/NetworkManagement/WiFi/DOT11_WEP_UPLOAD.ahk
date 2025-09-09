#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_IV48_COUNTER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WEP_UPLOAD extends Win32Struct
{
    static sizeof => 184

    static packingSize => 8

    /**
     * @type {Integer}
     */
    uReserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dot11OffloadType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    hOffload {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    uNumOfRWsUsed {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<DOT11_IV48_COUNTER>}
     */
    dot11IV48Counters{
        get {
            if(!this.HasProp("__dot11IV48CountersProxyArray"))
                this.__dot11IV48CountersProxyArray := Win32FixedArray(this.ptr + 24, 16, DOT11_IV48_COUNTER, "")
            return this.__dot11IV48CountersProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    usDot11RWBitMaps{
        get {
            if(!this.HasProp("__usDot11RWBitMapsProxyArray"))
                this.__usDot11RWBitMapsProxyArray := Win32FixedArray(this.ptr + 152, 16, Primitive, "ushort")
            return this.__usDot11RWBitMapsProxyArray
        }
    }
}
