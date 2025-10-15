#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_DEVICE_CAPABILITY_CONFIG extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

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
     * @type {BOOLEAN}
     */
    bServiceDiscoveryEnabled{
        get {
            if(!this.HasProp("__bServiceDiscoveryEnabled"))
                this.__bServiceDiscoveryEnabled := BOOLEAN(this.ptr + 4)
            return this.__bServiceDiscoveryEnabled
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bClientDiscoverabilityEnabled{
        get {
            if(!this.HasProp("__bClientDiscoverabilityEnabled"))
                this.__bClientDiscoverabilityEnabled := BOOLEAN(this.ptr + 5)
            return this.__bClientDiscoverabilityEnabled
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bConcurrentOperationSupported{
        get {
            if(!this.HasProp("__bConcurrentOperationSupported"))
                this.__bConcurrentOperationSupported := BOOLEAN(this.ptr + 6)
            return this.__bConcurrentOperationSupported
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bInfrastructureManagementEnabled{
        get {
            if(!this.HasProp("__bInfrastructureManagementEnabled"))
                this.__bInfrastructureManagementEnabled := BOOLEAN(this.ptr + 7)
            return this.__bInfrastructureManagementEnabled
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bDeviceLimitReached{
        get {
            if(!this.HasProp("__bDeviceLimitReached"))
                this.__bDeviceLimitReached := BOOLEAN(this.ptr + 8)
            return this.__bDeviceLimitReached
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bInvitationProcedureEnabled{
        get {
            if(!this.HasProp("__bInvitationProcedureEnabled"))
                this.__bInvitationProcedureEnabled := BOOLEAN(this.ptr + 9)
            return this.__bInvitationProcedureEnabled
        }
    }

    /**
     * @type {Integer}
     */
    WPSVersionsEnabled {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
