#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_BSS_ENTRY_PHY_SPECIFIC_INFO.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_BSS_ENTRY extends Win32Struct
{
    static sizeof => 80

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
                this.__PhySpecificInfo := DOT11_BSS_ENTRY_PHY_SPECIFIC_INFO(4, this)
            return this.__PhySpecificInfo
        }
    }

    /**
     * @type {Array<Byte>}
     */
    dot11BSSID{
        get {
            if(!this.HasProp("__dot11BSSIDProxyArray"))
                this.__dot11BSSIDProxyArray := Win32FixedArray(this.ptr + 20, 6, Primitive, "char")
            return this.__dot11BSSIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dot11BSSType {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    lRSSI {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    uLinkQuality {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {BOOLEAN}
     */
    bInRegDomain {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    usBeaconPeriod {
        get => NumGet(this, 42, "ushort")
        set => NumPut("ushort", value, this, 42)
    }

    /**
     * @type {Integer}
     */
    ullTimestamp {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    ullHostTimestamp {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    usCapabilityInformation {
        get => NumGet(this, 64, "ushort")
        set => NumPut("ushort", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    uBufferLength {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Array<Byte>}
     */
    ucBuffer{
        get {
            if(!this.HasProp("__ucBufferProxyArray"))
                this.__ucBufferProxyArray := Win32FixedArray(this.ptr + 72, 1, Primitive, "char")
            return this.__ucBufferProxyArray
        }
    }
}
