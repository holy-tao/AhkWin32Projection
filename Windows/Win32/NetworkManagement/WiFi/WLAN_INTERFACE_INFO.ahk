#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a wireless LAN interface.
 * @see https://docs.microsoft.com/windows/win32/api//wlanapi/ns-wlanapi-wlan_interface_info
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_INTERFACE_INFO extends Win32Struct
{
    static sizeof => 528

    static packingSize => 8

    /**
     * Contains the GUID of the interface.
     * @type {Pointer<Guid>}
     */
    InterfaceGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Contains the description of the interface.
     * @type {String}
     */
    strInterfaceDescription {
        get => StrGet(this.ptr + 8, 255, "UTF-16")
        set => StrPut(value, this.ptr + 8, 255, "UTF-16")
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_interface_state-r1">WLAN_INTERFACE_STATE</a> value that indicates the current state of the interface.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Only the <b>wlan_interface_state_connected</b>, <b>wlan_interface_state_disconnected</b>, and <b>wlan_interface_state_authenticating</b> values are supported.
     * @type {Integer}
     */
    isState {
        get => NumGet(this, 520, "int")
        set => NumPut("int", value, this, 520)
    }
}
