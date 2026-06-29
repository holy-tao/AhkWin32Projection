#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains data about events associated with an L2CAP channel.
 * @remarks
 * Notifications for a destroyed channel are only to be sent for channels that have been successfully established.
 * @see https://learn.microsoft.com/windows/win32/api/bthdef/ns-bthdef-bth_l2cap_event_info
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BTH_L2CAP_EVENT_INFO {
    #StructPack 8

    /**
     * Remote radio address with which the L2CAP event is associated, in the form of a <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothauthenticatemultipledevices">BTH_ADDR</a> structure.
     */
    bthAddress : Int64

    /**
     * Channel number established or terminated.
     */
    psm : UInt16

    /**
     * Status of the connection. If nonzero, the channel has been established. If zero, the channel has been terminated.
     */
    connected : Int8

    /**
     * Provides connection information. If nonzero, the local radio initiated the L2CAP connection.  If zero,  the remote Bluetooth device initiated the L2CAP connection.  If <b>connected</b> is zero,  this member is undefined and  not applicable.
     */
    initiated : Int8

}
