#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SESSION_HEADER structure contains information about a network session.
 * @see https://docs.microsoft.com/windows/win32/api//nb30/ns-nb30-session_header
 * @namespace Windows.Win32.NetworkManagement.NetBios
 * @version v4.0.30319
 */
class SESSION_HEADER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * Specifies the name number of the session. This value corresponds to the <b>ncb_num</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure.
     * @type {Integer}
     */
    sess_name {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies the number of sessions that have the name specified by the <b>sess_name</b> member.
     * @type {Integer}
     */
    num_sess {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Specifies the number of outstanding <b>NCBDGRECV</b> and <b>NCBDGRECVBC</b> commands.
     * @type {Integer}
     */
    rcv_dg_outstanding {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Specifies the number of outstanding <b>NCBRECVANY</b> commands.
     * @type {Integer}
     */
    rcv_any_outstanding {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }
}
