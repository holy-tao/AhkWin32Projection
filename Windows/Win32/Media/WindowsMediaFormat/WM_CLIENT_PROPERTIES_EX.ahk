#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The WM_CLIENT_PROPERTIES_EX structure holds extended client information.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_client_properties_ex
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_CLIENT_PROPERTIES_EX {
    #StructPack 8

    /**
     * <b>DWORD</b> containing the size of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * String containing the client's IP address in dot notation (for example, "192.168.10.2").
     */
    pwszIPAddress : PWSTR

    /**
     * String containing the client's port number.
     */
    pwszPort : PWSTR

    /**
     * String containing the client's name on the domain name server (DNS), if known.
     */
    pwszDNSName : PWSTR

}
