#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_ATTRIBUTES extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    uNumConcurrentGORole {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    uNumConcurrentClientRole {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    WPSVersionsSupported {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {BOOLEAN}
     */
    bServiceDiscoverySupported{
        get {
            if(!this.HasProp("__bServiceDiscoverySupported"))
                this.__bServiceDiscoverySupported := BOOLEAN(this.ptr + 16)
            return this.__bServiceDiscoverySupported
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bClientDiscoverabilitySupported{
        get {
            if(!this.HasProp("__bClientDiscoverabilitySupported"))
                this.__bClientDiscoverabilitySupported := BOOLEAN(this.ptr + 17)
            return this.__bClientDiscoverabilitySupported
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bInfrastructureManagementSupported{
        get {
            if(!this.HasProp("__bInfrastructureManagementSupported"))
                this.__bInfrastructureManagementSupported := BOOLEAN(this.ptr + 18)
            return this.__bInfrastructureManagementSupported
        }
    }

    /**
     * @type {Integer}
     */
    uMaxSecondaryDeviceTypeListSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<Byte>}
     */
    DeviceAddress{
        get {
            if(!this.HasProp("__DeviceAddressProxyArray"))
                this.__DeviceAddressProxyArray := Win32FixedArray(this.ptr + 24, 6, Primitive, "char")
            return this.__DeviceAddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    uInterfaceAddressListCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pInterfaceAddressList {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    uNumSupportedCountryOrRegionStrings {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pSupportedCountryOrRegionStrings {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    uDiscoveryFilterListSize {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    uGORoleClientTableSize {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }
}
