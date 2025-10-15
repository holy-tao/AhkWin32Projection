#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The SERVER_INFO_1541 structure specifies the minimum number of free connection blocks the server sets aside to handle bursts of requests by clients to connect to the server.
 * @see https://docs.microsoft.com/windows/win32/api//lmserver/ns-lmserver-server_info_1541
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1541 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the minimum number of free connection blocks maintained per endpoint. The server sets these aside to handle bursts of requests by clients to connect to the server.
     * @type {BOOL}
     */
    sv1541_minfreeconnections{
        get {
            if(!this.HasProp("__sv1541_minfreeconnections"))
                this.__sv1541_minfreeconnections := BOOL(this.ptr + 0)
            return this.__sv1541_minfreeconnections
        }
    }
}
