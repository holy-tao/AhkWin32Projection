#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used in connection with obtaining WM_DEVICECHANGE messages for Bluetooth.
 * @see https://learn.microsoft.com/windows/win32/api/bthdef/ns-bthdef-bth_hci_event_info
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BTH_HCI_EVENT_INFO {
    #StructPack 8

    /**
     * Address of the remote device, in the form of a <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothauthenticatemultipledevices">BTH_ADDR</a> structure.
     */
    bthAddress : Int64

    /**
     * Type of connection. Valid values are <b>HCI_CONNECTION_TYPE_ACL</b> or <b>HCI_CONNECTION_TYPE_SCO</b>.
     */
    connectionType : Int8

    /**
     * Status of the connection. If nonzero, the connection has been established. If zero, the connection has been terminated.
     */
    connected : Int8

}
