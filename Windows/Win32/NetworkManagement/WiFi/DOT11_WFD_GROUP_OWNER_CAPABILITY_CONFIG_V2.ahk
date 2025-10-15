#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_GROUP_OWNER_CAPABILITY_CONFIG_V2 extends Win32Struct
{
    static sizeof => 20

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
    bPersistentGroupEnabled{
        get {
            if(!this.HasProp("__bPersistentGroupEnabled"))
                this.__bPersistentGroupEnabled := BOOLEAN(this.ptr + 4)
            return this.__bPersistentGroupEnabled
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bIntraBSSDistributionSupported{
        get {
            if(!this.HasProp("__bIntraBSSDistributionSupported"))
                this.__bIntraBSSDistributionSupported := BOOLEAN(this.ptr + 5)
            return this.__bIntraBSSDistributionSupported
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bCrossConnectionSupported{
        get {
            if(!this.HasProp("__bCrossConnectionSupported"))
                this.__bCrossConnectionSupported := BOOLEAN(this.ptr + 6)
            return this.__bCrossConnectionSupported
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bPersistentReconnectSupported{
        get {
            if(!this.HasProp("__bPersistentReconnectSupported"))
                this.__bPersistentReconnectSupported := BOOLEAN(this.ptr + 7)
            return this.__bPersistentReconnectSupported
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bGroupFormationEnabled{
        get {
            if(!this.HasProp("__bGroupFormationEnabled"))
                this.__bGroupFormationEnabled := BOOLEAN(this.ptr + 8)
            return this.__bGroupFormationEnabled
        }
    }

    /**
     * @type {Integer}
     */
    uMaximumGroupLimit {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {BOOLEAN}
     */
    bEapolKeyIpAddressAllocationSupported{
        get {
            if(!this.HasProp("__bEapolKeyIpAddressAllocationSupported"))
                this.__bEapolKeyIpAddressAllocationSupported := BOOLEAN(this.ptr + 16)
            return this.__bEapolKeyIpAddressAllocationSupported
        }
    }
}
