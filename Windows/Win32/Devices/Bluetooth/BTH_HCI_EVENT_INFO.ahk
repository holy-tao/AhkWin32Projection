#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used in connection with obtaining WM_DEVICECHANGE messages for Bluetooth.
 * @see https://learn.microsoft.com/windows/win32/api/bthdef/ns-bthdef-bth_hci_event_info
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_HCI_EVENT_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Address of the remote device, in the form of a <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothauthenticatemultipledevices">BTH_ADDR</a> structure.
     * @type {Integer}
     */
    bthAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type of connection. Valid values are <b>HCI_CONNECTION_TYPE_ACL</b> or <b>HCI_CONNECTION_TYPE_SCO</b>.
     * @type {Integer}
     */
    connectionType {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Status of the connection. If nonzero, the connection has been established. If zero, the connection has been terminated.
     * @type {Integer}
     */
    connected {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }
}
