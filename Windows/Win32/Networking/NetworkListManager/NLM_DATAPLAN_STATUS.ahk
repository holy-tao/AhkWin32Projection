#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NLM_USAGE_DATA.ahk" { NLM_USAGE_DATA }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * NLM_DATAPLAN_STATUS structure stores the current data plan status information supplied by the carrier.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ns-netlistmgr-nlm_dataplan_status
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct NLM_DATAPLAN_STATUS {
    #StructPack 4

    /**
     * The unique ID of the interface associated with the data plan. This GUID is determined by the system when a data plan is first used by a system connection.
     */
    InterfaceGuid : Guid

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ns-netlistmgr-nlm_usage_data">NLM_USAGE_DATA</a> structure containing  current data usage value expressed in megabytes, as well as the  system time at the moment this value was last synced. 
     * 
     * If this value is not supplied, <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ns-netlistmgr-nlm_usage_data">NLM_USAGE_DATA</a> will indicate <b>NLM_UNKNOWN_DATAPLAN_STATUS</b> for <b>UsageInMegabytes</b> and a value of '0' will be set for <b>LastSyncTime.</b>
     */
    UsageData : NLM_USAGE_DATA

    /**
     * The data plan usage limit expressed in megabytes. If this value is not supplied, a default value of <b>NLM_UNKNOWN_DATAPLAN_STATUS</b> is set.
     */
    DataLimitInMegabytes : UInt32

    /**
     * The maximum inbound connection bandwidth expressed in kbps. If this value is not supplied, a default value of <b>NLM_UNKNOWN_DATAPLAN_STATUS</b> is set.
     */
    InboundBandwidthInKbps : UInt32

    /**
     * The maximum outbound connection bandwidth expressed in kbps. If this value is not supplied, a default value of <b>NLM_UNKNOWN_DATAPLAN_STATUS</b> is set.
     */
    OutboundBandwidthInKbps : UInt32

    /**
     * The start time of the next billing cycle. If this value is not supplied, a default value of '0' is set.
     */
    NextBillingCycle : FILETIME

    /**
     * The maximum suggested transfer size for this network expressed in megabytes. If this value is not supplied, a default value of <b>NLM_UNKNOWN_DATAPLAN_STATUS</b> is set.
     */
    MaxTransferSizeInMegabytes : UInt32

    /**
     * Reserved for future use.
     */
    Reserved : UInt32

}
