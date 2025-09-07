#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TRANSPORT_SETTING_ID structure (mstcpip.h) specifies the transport setting ID used by specific IOCTLs to apply or query the transport setting for a socket.
 * @remarks
 * The only transport setting defined for Windows 8 and Windows Server 2012 is for the <b>REAL_TIME_NOTIFICATION_CAPABILITY</b> capability on a TCP socket. For Windows 10 and Windows Server 2016, there is another transport setting defined as <b>ASSOCIATE_NAMERES_CONTEXT</b>.
  * 
  * The <b>TRANSPORT_SETTING_ID</b> structure is passed as input to the <a href="https://docs.microsoft.com/windows/win32/winsock/sio-apply-transport-setting">SIO_APPLY_TRANSPORT_SETTING</a> and <a href="https://docs.microsoft.com/windows/win32/winsock/sio-query-transport-setting">SIO_QUERY_TRANSPORT_SETTING</a> 
  *         IOCTLs. The <b>Guid</b> member determines what transport setting is applied or queried. 
  * 
  * The only transport setting currently defines is for the <b>REAL_TIME_NOTIFICATION_CAPABILITY</b> capability on a TCP socket.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-transport_setting_id
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class TRANSPORT_SETTING_ID extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The transport setting ID.
     * @type {Pointer<Guid>}
     */
    Guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
