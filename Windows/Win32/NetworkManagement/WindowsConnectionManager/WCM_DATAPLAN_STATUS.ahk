#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\WCM_USAGE_DATA.ahk
#Include .\WCM_TIME_INTERVAL.ahk
#Include .\WCM_BILLING_CYCLE_INFO.ahk

/**
 * Specifies subscription information for a network connection.
 * @see https://docs.microsoft.com/windows/win32/api//wcmapi/ns-wcmapi-wcm_dataplan_status
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 * @version v4.0.30319
 */
class WCM_DATAPLAN_STATUS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_usage_data">WCM_USAGE_DATA</a></b>
     * 
     * Contains usage data.
     * @type {WCM_USAGE_DATA}
     */
    UsageData{
        get {
            if(!this.HasProp("__UsageData"))
                this.__UsageData := WCM_USAGE_DATA(this.ptr + 0)
            return this.__UsageData
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the data limit, in megabytes.
     * @type {Integer}
     */
    DataLimitInMegabytes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the inbound bandwidth, in kilobits per second.
     * @type {Integer}
     */
    InboundBandwidthInKbps {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the outbound bandwidth, in kilobits per second.
     * @type {Integer}
     */
    OutboundBandwidthInKbps {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_billing_cycle_info">WCM_BILLING_CYCLE_INFO</a></b>
     * 
     * Contains information about the billing cycle.
     * @type {WCM_BILLING_CYCLE_INFO}
     */
    BillingCycle{
        get {
            if(!this.HasProp("__BillingCycle"))
                this.__BillingCycle := WCM_BILLING_CYCLE_INFO(this.ptr + 32)
            return this.__BillingCycle
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the maximum size of a file that can be transferred, in megabytes.
     * @type {Integer}
     */
    MaxTransferSizeInMegabytes {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }
}
