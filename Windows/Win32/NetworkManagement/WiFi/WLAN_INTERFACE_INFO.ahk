#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WLAN_INTERFACE_STATE.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a wireless LAN interface.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_interface_info
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WLAN_INTERFACE_INFO extends Win32Struct {
    static sizeof => 532

    static packingSize => 4

    /**
     * Contains the GUID of the interface.
     * @type {Guid}
     */
    InterfaceGuid {
        get {
            if(!this.HasProp("__InterfaceGuid"))
                this.__InterfaceGuid := Guid(0, this)
            return this.__InterfaceGuid
        }
    }

    /**
     * Contains the description of the interface.
     * @type {String}
     */
    strInterfaceDescription {
        get => StrGet(this.ptr + 16, 255, "UTF-16")
        set => StrPut(value, this.ptr + 16, 255, "UTF-16")
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_interface_state-r1">WLAN_INTERFACE_STATE</a> value that indicates the current state of the interface.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Only the <b>wlan_interface_state_connected</b>, <b>wlan_interface_state_disconnected</b>, and <b>wlan_interface_state_authenticating</b> values are supported.
     * @type {WLAN_INTERFACE_STATE}
     */
    isState {
        get => NumGet(this, 528, "int")
        set => NumPut("int", value, this, 528)
    }
}
