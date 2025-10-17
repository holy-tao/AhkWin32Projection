#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk

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
                this.__Header := NDIS_OBJECT_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bPersistentGroupEnabled {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {BOOLEAN}
     */
    bIntraBSSDistributionSupported {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {BOOLEAN}
     */
    bCrossConnectionSupported {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {BOOLEAN}
     */
    bPersistentReconnectSupported {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {BOOLEAN}
     */
    bGroupFormationEnabled {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
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
    bEapolKeyIpAddressAllocationSupported {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}
