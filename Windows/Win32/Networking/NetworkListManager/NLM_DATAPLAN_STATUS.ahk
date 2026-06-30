#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\NLM_USAGE_DATA.ahk

/**
 * NLM_DATAPLAN_STATUS structure stores the current data plan status information supplied by the carrier.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ns-netlistmgr-nlm_dataplan_status
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
class NLM_DATAPLAN_STATUS extends Win32Struct {
    static sizeof => 56

    static packingSize => 4

    /**
     * The unique ID of the interface associated with the data plan. This GUID is determined by the system when a data plan is first used by a system connection.
     * @type {Guid}
     */
    InterfaceGuid {
        get {
            if(!this.HasProp("__InterfaceGuid"))
                this.__InterfaceGuid := Guid(0, this)
            return this.__InterfaceGuid
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ns-netlistmgr-nlm_usage_data">NLM_USAGE_DATA</a> structure containing  current data usage value expressed in megabytes, as well as the  system time at the moment this value was last synced. 
     * 
     * If this value is not supplied, <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ns-netlistmgr-nlm_usage_data">NLM_USAGE_DATA</a> will indicate <b>NLM_UNKNOWN_DATAPLAN_STATUS</b> for <b>UsageInMegabytes</b> and a value of '0' will be set for <b>LastSyncTime.</b>
     * @type {NLM_USAGE_DATA}
     */
    UsageData {
        get {
            if(!this.HasProp("__UsageData"))
                this.__UsageData := NLM_USAGE_DATA(16, this)
            return this.__UsageData
        }
    }

    /**
     * The data plan usage limit expressed in megabytes. If this value is not supplied, a default value of <b>NLM_UNKNOWN_DATAPLAN_STATUS</b> is set.
     * @type {Integer}
     */
    DataLimitInMegabytes {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The maximum inbound connection bandwidth expressed in kbps. If this value is not supplied, a default value of <b>NLM_UNKNOWN_DATAPLAN_STATUS</b> is set.
     * @type {Integer}
     */
    InboundBandwidthInKbps {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The maximum outbound connection bandwidth expressed in kbps. If this value is not supplied, a default value of <b>NLM_UNKNOWN_DATAPLAN_STATUS</b> is set.
     * @type {Integer}
     */
    OutboundBandwidthInKbps {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The start time of the next billing cycle. If this value is not supplied, a default value of '0' is set.
     * @type {FILETIME}
     */
    NextBillingCycle {
        get {
            if(!this.HasProp("__NextBillingCycle"))
                this.__NextBillingCycle := FILETIME(40, this)
            return this.__NextBillingCycle
        }
    }

    /**
     * The maximum suggested transfer size for this network expressed in megabytes. If this value is not supplied, a default value of <b>NLM_UNKNOWN_DATAPLAN_STATUS</b> is set.
     * @type {Integer}
     */
    MaxTransferSizeInMegabytes {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
