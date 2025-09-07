#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_IV48_COUNTER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WEP_OFFLOAD extends Win32Struct
{
    static sizeof => 224

    static packingSize => 8

    /**
     * @type {Integer}
     */
    uReserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    hOffloadContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    hOffload {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dot11OffloadType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwAlgorithm {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    bRowIsOutbound {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    bUseDefault {
        get => NumGet(this, 33, "char")
        set => NumPut("char", value, this, 33)
    }

    /**
     * @type {Integer}
     */
    uFlags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Array<Byte>}
     */
    ucMacAddress{
        get {
            if(!this.HasProp("__ucMacAddressProxyArray"))
                this.__ucMacAddressProxyArray := Win32FixedArray(this.ptr + 40, 1, Primitive, "char")
            return this.__ucMacAddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    uNumOfRWsOnPeer {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    uNumOfRWsOnMe {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Array<DOT11_IV48_COUNTER>}
     */
    dot11IV48Counters{
        get {
            if(!this.HasProp("__dot11IV48CountersProxyArray"))
                this.__dot11IV48CountersProxyArray := Win32FixedArray(this.ptr + 56, 8, DOT11_IV48_COUNTER, "")
            return this.__dot11IV48CountersProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    usDot11RWBitMaps{
        get {
            if(!this.HasProp("__usDot11RWBitMapsProxyArray"))
                this.__usDot11RWBitMapsProxyArray := Win32FixedArray(this.ptr + 184, 2, Primitive, "ushort")
            return this.__usDot11RWBitMapsProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    usKeyLength {
        get => NumGet(this, 216, "ushort")
        set => NumPut("ushort", value, this, 216)
    }

    /**
     * @type {Array<Byte>}
     */
    ucKey{
        get {
            if(!this.HasProp("__ucKeyProxyArray"))
                this.__ucKeyProxyArray := Win32FixedArray(this.ptr + 218, 1, Primitive, "char")
            return this.__ucKeyProxyArray
        }
    }
}
