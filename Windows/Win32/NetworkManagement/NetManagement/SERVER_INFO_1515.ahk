#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1515 structure specifies whether the server should force a client to disconnect once the client's logon time has expired.
 * @see https://docs.microsoft.com/windows/win32/api//lmserver/ns-lmserver-server_info_1515
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1515 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies whether the server should force a client to disconnect, even if the client has open files, once the client's logon time has expired.
     * @type {BOOL}
     */
    sv1515_enableforcedlogoff {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
