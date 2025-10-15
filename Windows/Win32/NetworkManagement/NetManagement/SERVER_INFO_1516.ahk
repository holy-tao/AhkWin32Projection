#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The SERVER_INFO_1516 structure specifies whether the server is a reliable time source.
 * @see https://docs.microsoft.com/windows/win32/api//lmserver/ns-lmserver-server_info_1516
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1516 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies whether the server is a reliable time source.
     * @type {BOOL}
     */
    sv1516_timesource{
        get {
            if(!this.HasProp("__sv1516_timesource"))
                this.__sv1516_timesource := BOOL(this.ptr + 0)
            return this.__sv1516_timesource
        }
    }
}
