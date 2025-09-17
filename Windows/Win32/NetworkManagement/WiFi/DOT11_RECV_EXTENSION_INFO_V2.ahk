#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_IV48_COUNTER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_RECV_EXTENSION_INFO_V2 extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Integer}
     */
    uVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvReserved {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dot11PhyType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    uChCenterFrequency {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    lRSSI {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    uRSSI {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    ucPriority {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ucDataRate {
        get => NumGet(this, 33, "char")
        set => NumPut("char", value, this, 33)
    }

    /**
     * @type {Array<Byte>}
     */
    ucPeerMacAddress{
        get {
            if(!this.HasProp("__ucPeerMacAddressProxyArray"))
                this.__ucPeerMacAddressProxyArray := Win32FixedArray(this.ptr + 34, 6, Primitive, "char")
            return this.__ucPeerMacAddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwExtendedStatus {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<Void>}
     */
    hWEPOffloadContext {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Void>}
     */
    hAuthOffloadContext {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    usWEPAppliedMask {
        get => NumGet(this, 64, "ushort")
        set => NumPut("ushort", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    usWPAMSDUPriority {
        get => NumGet(this, 66, "ushort")
        set => NumPut("ushort", value, this, 66)
    }

    /**
     * @type {DOT11_IV48_COUNTER}
     */
    dot11LowestIV48Counter{
        get {
            if(!this.HasProp("__dot11LowestIV48Counter"))
                this.__dot11LowestIV48Counter := DOT11_IV48_COUNTER(this.ptr + 72)
            return this.__dot11LowestIV48Counter
        }
    }

    /**
     * @type {Integer}
     */
    usDot11LeftRWBitMap {
        get => NumGet(this, 80, "ushort")
        set => NumPut("ushort", value, this, 80)
    }

    /**
     * @type {DOT11_IV48_COUNTER}
     */
    dot11HighestIV48Counter{
        get {
            if(!this.HasProp("__dot11HighestIV48Counter"))
                this.__dot11HighestIV48Counter := DOT11_IV48_COUNTER(this.ptr + 88)
            return this.__dot11HighestIV48Counter
        }
    }

    /**
     * @type {Integer}
     */
    usDot11RightRWBitMap {
        get => NumGet(this, 96, "ushort")
        set => NumPut("ushort", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    usNumberOfMPDUsReceived {
        get => NumGet(this, 98, "ushort")
        set => NumPut("ushort", value, this, 98)
    }

    /**
     * @type {Integer}
     */
    usNumberOfFragments {
        get => NumGet(this, 100, "ushort")
        set => NumPut("ushort", value, this, 100)
    }

    /**
     * @type {Array<Void>}
     */
    pNdisPackets{
        get {
            if(!this.HasProp("__pNdisPacketsProxyArray"))
                this.__pNdisPacketsProxyArray := Win32FixedArray(this.ptr + 104, 1, Primitive, "ptr")
            return this.__pNdisPacketsProxyArray
        }
    }
}
