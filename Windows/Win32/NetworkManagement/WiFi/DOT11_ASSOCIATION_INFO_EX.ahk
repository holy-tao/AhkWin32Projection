#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_ASSOCIATION_INFO_EX extends Win32Struct
{
    static sizeof => 328

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    PeerMacAddress{
        get {
            if(!this.HasProp("__PeerMacAddressProxyArray"))
                this.__PeerMacAddressProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__PeerMacAddressProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    BSSID{
        get {
            if(!this.HasProp("__BSSIDProxyArray"))
                this.__BSSIDProxyArray := Win32FixedArray(this.ptr + 6, 6, Primitive, "char")
            return this.__BSSIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    usCapabilityInformation {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    usListenInterval {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * @type {Array<Byte>}
     */
    ucPeerSupportedRates{
        get {
            if(!this.HasProp("__ucPeerSupportedRatesProxyArray"))
                this.__ucPeerSupportedRatesProxyArray := Win32FixedArray(this.ptr + 16, 255, Primitive, "char")
            return this.__ucPeerSupportedRatesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    usAssociationID {
        get => NumGet(this, 272, "ushort")
        set => NumPut("ushort", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    dot11AssociationState {
        get => NumGet(this, 276, "int")
        set => NumPut("int", value, this, 276)
    }

    /**
     * @type {Integer}
     */
    dot11PowerMode {
        get => NumGet(this, 280, "int")
        set => NumPut("int", value, this, 280)
    }

    /**
     * @type {Integer}
     */
    liAssociationUpTime {
        get => NumGet(this, 288, "int64")
        set => NumPut("int64", value, this, 288)
    }

    /**
     * @type {Integer}
     */
    ullNumOfTxPacketSuccesses {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * @type {Integer}
     */
    ullNumOfTxPacketFailures {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }

    /**
     * @type {Integer}
     */
    ullNumOfRxPacketSuccesses {
        get => NumGet(this, 312, "uint")
        set => NumPut("uint", value, this, 312)
    }

    /**
     * @type {Integer}
     */
    ullNumOfRxPacketFailures {
        get => NumGet(this, 320, "uint")
        set => NumPut("uint", value, this, 320)
    }
}
