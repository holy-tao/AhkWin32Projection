#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_PEER_STATISTICS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_PEER_INFO extends Win32Struct
{
    static sizeof => 352

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    MacAddress{
        get {
            if(!this.HasProp("__MacAddressProxyArray"))
                this.__MacAddressProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__MacAddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    usCapabilityInformation {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    AuthAlgo {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    UnicastCipherAlgo {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    MulticastCipherAlgo {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    bWpsEnabled {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    usListenInterval {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {Array<Byte>}
     */
    ucSupportedRates{
        get {
            if(!this.HasProp("__ucSupportedRatesProxyArray"))
                this.__ucSupportedRatesProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__ucSupportedRatesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    usAssociationID {
        get => NumGet(this, 280, "ushort")
        set => NumPut("ushort", value, this, 280)
    }

    /**
     * @type {Integer}
     */
    AssociationState {
        get => NumGet(this, 284, "int")
        set => NumPut("int", value, this, 284)
    }

    /**
     * @type {Integer}
     */
    PowerMode {
        get => NumGet(this, 288, "int")
        set => NumPut("int", value, this, 288)
    }

    /**
     * @type {Integer}
     */
    liAssociationUpTime {
        get => NumGet(this, 296, "int64")
        set => NumPut("int64", value, this, 296)
    }

    /**
     * @type {DOT11_PEER_STATISTICS}
     */
    Statistics{
        get {
            if(!this.HasProp("__Statistics"))
                this.__Statistics := DOT11_PEER_STATISTICS(this.ptr + 304)
            return this.__Statistics
        }
    }
}
