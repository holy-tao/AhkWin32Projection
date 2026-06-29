#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains information related to connection usage.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ns-wcmapi-wcm_usage_data
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
export default struct WCM_USAGE_DATA {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The connection usage, in megabytes.
     */
    UsageInMegabytes : UInt32

    /**
     * Type: <b>FILETIME</b>
     * 
     * Specifies the last time that usage information was reconciled with the carrier's billing system.
     */
    LastSyncTime : FILETIME

}
