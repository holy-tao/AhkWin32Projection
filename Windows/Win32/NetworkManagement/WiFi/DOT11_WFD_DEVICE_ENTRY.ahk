#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_BSS_ENTRY_PHY_SPECIFIC_INFO.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_DEVICE_ENTRY extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Integer}
     */
    uPhyId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {DOT11_BSS_ENTRY_PHY_SPECIFIC_INFO}
     */
    PhySpecificInfo{
        get {
            if(!this.HasProp("__PhySpecificInfo"))
                this.__PhySpecificInfo := DOT11_BSS_ENTRY_PHY_SPECIFIC_INFO(this.ptr + 8)
            return this.__PhySpecificInfo
        }
    }

    /**
     * @type {Array<Byte>}
     */
    dot11BSSID{
        get {
            if(!this.HasProp("__dot11BSSIDProxyArray"))
                this.__dot11BSSIDProxyArray := Win32FixedArray(this.ptr + 32, 6, Primitive, "char")
            return this.__dot11BSSIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dot11BSSType {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Array<Byte>}
     */
    TransmitterAddress{
        get {
            if(!this.HasProp("__TransmitterAddressProxyArray"))
                this.__TransmitterAddressProxyArray := Win32FixedArray(this.ptr + 44, 6, Primitive, "char")
            return this.__TransmitterAddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    lRSSI {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    uLinkQuality {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    usBeaconPeriod {
        get => NumGet(this, 60, "ushort")
        set => NumPut("ushort", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    ullTimestamp {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    ullBeaconHostTimestamp {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    ullProbeResponseHostTimestamp {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    usCapabilityInformation {
        get => NumGet(this, 88, "ushort")
        set => NumPut("ushort", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    uBeaconIEsOffset {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    uBeaconIEsLength {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    uProbeResponseIEsOffset {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    uProbeResponseIEsLength {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }
}
