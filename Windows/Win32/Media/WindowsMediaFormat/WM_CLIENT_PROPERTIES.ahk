#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WM_CLIENT_PROPERTIES structure records information about the client.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_client_properties
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_CLIENT_PROPERTIES {
    #StructPack 4

    /**
     * <b>DWORD</b> containing the IP address.
     */
    dwIPAddress : UInt32

    /**
     * <b>DWORD</b> containing the port number.
     */
    dwPort : UInt32

}
