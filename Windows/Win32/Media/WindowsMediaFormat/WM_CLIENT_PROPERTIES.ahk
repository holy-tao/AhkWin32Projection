#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WM_CLIENT_PROPERTIES structure records information about the client.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ns-wmsdkidl-wm_client_properties
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WM_CLIENT_PROPERTIES extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * <b>DWORD</b> containing the IP address.
     * @type {Integer}
     */
    dwIPAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <b>DWORD</b> containing the port number.
     * @type {Integer}
     */
    dwPort {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
