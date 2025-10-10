#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\WCM_TIME_INTERVAL.ahk

/**
 * Specifies information about the billing cycle.
 * @see https://docs.microsoft.com/windows/win32/api//wcmapi/ns-wcmapi-wcm_billing_cycle_info
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 * @version v4.0.30319
 */
class WCM_BILLING_CYCLE_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>FILETIME</b>
     * 
     * Specifies the start date of the cycle.
     * @type {FILETIME}
     */
    StartDate{
        get {
            if(!this.HasProp("__StartDate"))
                this.__StartDate := FILETIME(this.ptr + 0)
            return this.__StartDate
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_time_interval">WCM_TIME_INTERVAL</a></b>
     * 
     * Specifies the billing cycle duration.
     * @type {WCM_TIME_INTERVAL}
     */
    Duration{
        get {
            if(!this.HasProp("__Duration"))
                this.__Duration := WCM_TIME_INTERVAL(this.ptr + 8)
            return this.__Duration
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * True if at the end of the billing cycle, a new billing cycle of the same duration will start. False if the service will terminate at the end of the billing cycle.
     * @type {Integer}
     */
    Reset {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
