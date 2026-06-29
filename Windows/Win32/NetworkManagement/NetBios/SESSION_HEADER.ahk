#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SESSION_HEADER structure contains information about a network session.
 * @see https://learn.microsoft.com/windows/win32/api/nb30/ns-nb30-session_header
 * @namespace Windows.Win32.NetworkManagement.NetBios
 */
export default struct SESSION_HEADER {
    #StructPack 1

    /**
     * Specifies the name number of the session. This value corresponds to the <b>ncb_num</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure.
     */
    sess_name : Int8

    /**
     * Specifies the number of sessions that have the name specified by the <b>sess_name</b> member.
     */
    num_sess : Int8

    /**
     * Specifies the number of outstanding <b>NCBDGRECV</b> and <b>NCBDGRECVBC</b> commands.
     */
    rcv_dg_outstanding : Int8

    /**
     * Specifies the number of outstanding <b>NCBRECVANY</b> commands.
     */
    rcv_any_outstanding : Int8

}
