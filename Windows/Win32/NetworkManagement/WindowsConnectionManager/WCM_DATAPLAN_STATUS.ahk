#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WCM_TIME_INTERVAL.ahk" { WCM_TIME_INTERVAL }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\WCM_USAGE_DATA.ahk" { WCM_USAGE_DATA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WCM_BILLING_CYCLE_INFO.ahk" { WCM_BILLING_CYCLE_INFO }

/**
 * Specifies subscription information for a network connection.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ns-wcmapi-wcm_dataplan_status
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
export default struct WCM_DATAPLAN_STATUS {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_usage_data">WCM_USAGE_DATA</a></b>
     * 
     * Contains usage data.
     */
    UsageData : WCM_USAGE_DATA

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the data limit, in megabytes.
     */
    DataLimitInMegabytes : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the inbound bandwidth, in kilobits per second.
     */
    InboundBandwidthInKbps : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the outbound bandwidth, in kilobits per second.
     */
    OutboundBandwidthInKbps : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_billing_cycle_info">WCM_BILLING_CYCLE_INFO</a></b>
     * 
     * Contains information about the billing cycle.
     */
    BillingCycle : WCM_BILLING_CYCLE_INFO

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the maximum size of a file that can be transferred, in megabytes.
     */
    MaxTransferSizeInMegabytes : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     */
    Reserved : UInt32

}
