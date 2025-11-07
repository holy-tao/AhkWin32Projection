#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides the output settings from a query for the REAL_TIME_NOTIFICATION_CAPABILITY transport setting for a TCP socket that is used with ControlChannelTrigger to receive background network notifications in a Windows Store app.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-real_time_notification_setting_output">REAL_TIME_NOTIFICATION_SETTING_OUTPUT</a>   structure is supported on Windows 8,   and Windows Server 2012, and later versions of the operating system.
 * 
 *  If the <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ns-mstcpip-transport_setting_id">TRANSPORT_SETTING_ID</a> in the <i>lpvInBuffer</i> parameter passed to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/jj553483(v=vs.85)">SIO_QUERY_TRANSPORT_SETTING</a> 
 *         IOCTL  has the <b>Guid</b> member set to <b>REAL_TIME_NOTIFICATION_CAPABILITY</b>, then this is a request to query the real time notification settings for the TCP socket used with <a href="https://docs.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-real_time_notification_setting_output">ControlChannelTrigger</a> to receive background network notifications in a Windows Store app. If the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaioctl">WSAIoctl</a> or <a href="https://docs.microsoft.com/previous-versions/windows/hardware/network/ff566296(v=vs.85)">LPWSPIoctl</a> call is successful, this IOCTL returns a <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ns-mstcpip-real_time_notification_setting_input">REAL_TIME_NOTIFICATION_SETTING_OUTPUT</a> structure with the current status.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mstcpip/ns-mstcpip-real_time_notification_setting_output
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class REAL_TIME_NOTIFICATION_SETTING_OUTPUT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The channel status for a socket that is used with the <a href="https://docs.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger">ControlChannelTrigger</a>.
     * @type {Integer}
     */
    ChannelStatus {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
