#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1533 structure specifies the maximum number of outstanding requests a client can send to the server.
 * @see https://docs.microsoft.com/windows/win32/api//lmserver/ns-lmserver-server_info_1533
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1533 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the maximum number of outstanding requests any one client can send to the server. For example, 10 means you can have 10 unanswered requests at the server. When any single client has 10 requests queued within the server, the client must wait for a server response before sending another request.
     * @type {Integer}
     */
    sv1533_maxmpxct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
