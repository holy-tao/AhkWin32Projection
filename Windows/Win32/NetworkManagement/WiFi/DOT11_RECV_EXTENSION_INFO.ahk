#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\DOT11_IV48_COUNTER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_RECV_EXTENSION_INFO extends Win32Struct
{
    static sizeof => 120

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
    lRSSIMin {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    lRSSIMax {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    uRSSI {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    ucPriority {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ucDataRate {
        get => NumGet(this, 41, "char")
        set => NumPut("char", value, this, 41)
    }

    /**
     * @type {Array<Byte>}
     */
    ucPeerMacAddress{
        get {
            if(!this.HasProp("__ucPeerMacAddressProxyArray"))
                this.__ucPeerMacAddressProxyArray := Win32FixedArray(this.ptr + 42, 6, Primitive, "char")
            return this.__ucPeerMacAddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwExtendedStatus {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {HANDLE}
     */
    hWEPOffloadContext{
        get {
            if(!this.HasProp("__hWEPOffloadContext"))
                this.__hWEPOffloadContext := HANDLE(this.ptr + 56)
            return this.__hWEPOffloadContext
        }
    }

    /**
     * @type {HANDLE}
     */
    hAuthOffloadContext{
        get {
            if(!this.HasProp("__hAuthOffloadContext"))
                this.__hAuthOffloadContext := HANDLE(this.ptr + 64)
            return this.__hAuthOffloadContext
        }
    }

    /**
     * @type {Integer}
     */
    usWEPAppliedMask {
        get => NumGet(this, 72, "ushort")
        set => NumPut("ushort", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    usWPAMSDUPriority {
        get => NumGet(this, 74, "ushort")
        set => NumPut("ushort", value, this, 74)
    }

    /**
     * @type {DOT11_IV48_COUNTER}
     */
    dot11LowestIV48Counter{
        get {
            if(!this.HasProp("__dot11LowestIV48Counter"))
                this.__dot11LowestIV48Counter := DOT11_IV48_COUNTER(this.ptr + 80)
            return this.__dot11LowestIV48Counter
        }
    }

    /**
     * @type {Integer}
     */
    usDot11LeftRWBitMap {
        get => NumGet(this, 88, "ushort")
        set => NumPut("ushort", value, this, 88)
    }

    /**
     * @type {DOT11_IV48_COUNTER}
     */
    dot11HighestIV48Counter{
        get {
            if(!this.HasProp("__dot11HighestIV48Counter"))
                this.__dot11HighestIV48Counter := DOT11_IV48_COUNTER(this.ptr + 96)
            return this.__dot11HighestIV48Counter
        }
    }

    /**
     * @type {Integer}
     */
    usDot11RightRWBitMap {
        get => NumGet(this, 104, "ushort")
        set => NumPut("ushort", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    usNumberOfMPDUsReceived {
        get => NumGet(this, 106, "ushort")
        set => NumPut("ushort", value, this, 106)
    }

    /**
     * @type {Integer}
     */
    usNumberOfFragments {
        get => NumGet(this, 108, "ushort")
        set => NumPut("ushort", value, this, 108)
    }

    /**
     * @type {Array<Void>}
     */
    pNdisPackets{
        get {
            if(!this.HasProp("__pNdisPacketsProxyArray"))
                this.__pNdisPacketsProxyArray := Win32FixedArray(this.ptr + 112, 1, Primitive, "ptr")
            return this.__pNdisPacketsProxyArray
        }
    }
}
