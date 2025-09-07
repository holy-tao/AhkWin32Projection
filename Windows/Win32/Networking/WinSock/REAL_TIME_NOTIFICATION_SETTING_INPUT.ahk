#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TRANSPORT_SETTING_ID.ahk

/**
 * Provides input settings to apply for the REAL_TIME_NOTIFICATION_CAPABILITY transport setting for a TCP socket that is used with ControlChannelTrigger to receive background network notifications in a Windows Store app.
 * @remarks
 * The <b>REAL_TIME_NOTIFICATION_SETTING_INPUT</b>  structure is supported on Windows 8,   and Windows Server 2012, and later versions of the operating system.
  * 
  *  If the <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ns-mstcpip-transport_setting_id">TRANSPORT_SETTING_ID</a> in the <i>lpvInBuffer</i> parameter passed to the <a href="https://docs.microsoft.com/windows/win32/winsock/sio-apply-transport-setting">SIO_APPLY_TRANSPORT_SETTING</a> 
  *         IOCTL  has the <b>Guid</b> member set to <b>REAL_TIME_NOTIFICATION_CAPABILITY</b>, then this is a request to query the real time notification settings for the TCP socket used with <a href="https://docs.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger">ControlChannelTrigger</a> to receive background network notifications in a Windows Store app. The <i>lpvInBuffer</i> parameter should point to a <b>REAL_TIME_NOTIFICATION_SETTING_INPUT</b> structure used as input to the <b>SIO_APPLY_TRANSPORT_SETTING</b> 
  *         IOCTL to apply the transport setting.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-real_time_notification_setting_input
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class REAL_TIME_NOTIFICATION_SETTING_INPUT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The transport setting ID.
     * @type {TRANSPORT_SETTING_ID}
     */
    TransportSettingId{
        get {
            if(!this.HasProp("__TransportSettingId"))
                this.__TransportSettingId := TRANSPORT_SETTING_ID(this.ptr + 0)
            return this.__TransportSettingId
        }
    }

    /**
     * The realtime notification broker event GUID for this transport ID.
     * @type {Pointer<Guid>}
     */
    BrokerEventGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
