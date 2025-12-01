#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data about events associated with an L2CAP channel.
 * @remarks
 * Notifications for a destroyed channel are only to be sent for channels that have been successfully established.
 * @see https://learn.microsoft.com/windows/win32/api/bthdef/ns-bthdef-bth_l2cap_event_info
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_L2CAP_EVENT_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Remote radio address with which the L2CAP event is associated, in the form of a <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothauthenticatemultipledevices">BTH_ADDR</a> structure.
     * @type {Integer}
     */
    bthAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Channel number established or terminated.
     * @type {Integer}
     */
    psm {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Status of the connection. If nonzero, the channel has been established. If zero, the channel has been terminated.
     * @type {Integer}
     */
    connected {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * Provides connection information. If nonzero, the local radio initiated the L2CAP connection.  If zero,  the remote Bluetooth device initiated the L2CAP connection.  If <b>connected</b> is zero,  this member is undefined and  not applicable.
     * @type {Integer}
     */
    initiated {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }
}
