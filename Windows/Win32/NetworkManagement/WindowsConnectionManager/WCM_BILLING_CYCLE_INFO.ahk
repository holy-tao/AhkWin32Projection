#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WCM_TIME_INTERVAL.ahk" { WCM_TIME_INTERVAL }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Specifies information about the billing cycle.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ns-wcmapi-wcm_billing_cycle_info
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
export default struct WCM_BILLING_CYCLE_INFO {
    #StructPack 4

    /**
     * Type: <b>FILETIME</b>
     * 
     * Specifies the start date of the cycle.
     */
    StartDate : FILETIME

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_time_interval">WCM_TIME_INTERVAL</a></b>
     * 
     * Specifies the billing cycle duration.
     */
    Duration : WCM_TIME_INTERVAL

    /**
     * Type: <b>BOOL</b>
     * 
     * True if at the end of the billing cycle, a new billing cycle of the same duration will start. False if the service will terminate at the end of the billing cycle.
     */
    Reset : BOOL

}
