#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The SERVER_INFO_1538 structure specifies whether several MS-DOS File Control Blocks (FCBs) are placed in a single location.
 * @see https://docs.microsoft.com/windows/win32/api//lmserver/ns-lmserver-server_info_1538
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1538 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies whether several MS-DOS File Control Blocks (FCBs) are placed in a single location accessible to the server.
     * @type {BOOL}
     */
    sv1538_enablefcbopens{
        get {
            if(!this.HasProp("__sv1538_enablefcbopens"))
                this.__sv1538_enablefcbopens := BOOL(this.ptr + 0)
            return this.__sv1538_enablefcbopens
        }
    }
}
