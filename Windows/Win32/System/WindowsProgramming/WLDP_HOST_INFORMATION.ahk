#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WLDP_HOST_ID.ahk" { WLDP_HOST_ID }

/**
 * A structure identifying the host and source file to be evaluated.
 * @see https://learn.microsoft.com/windows/win32/api/wldp/ns-wldp-wldp_host_information
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct WLDP_HOST_INFORMATION {
    #StructPack 8

    /**
     * Must be **WLDP\_HOST\_INFORMATION\_REVISION**.
     */
    dwRevision : UInt32

    /**
     * Enumeration value from [**WLDP\_HOST\_ID**](ne-wldp-wldp_host_id.md) that describes the host ID.
     */
    dwHostId : WLDP_HOST_ID

    /**
     * Full path and script name with the extension. NULL for **WLDP\_HOST\_ID\_GLOBAL**, or manual script execution.
     */
    szSource : PWSTR

    /**
     * In addition to the name, the caller can specify a handle to the file used for validation.
     */
    hSource : HANDLE

}
