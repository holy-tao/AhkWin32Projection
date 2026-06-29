#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SESSION_BUFFER structure contains information about a local network session. One or more SESSION_BUFFER structures follows a SESSION_HEADER structure when an application specifies the NCBSSTAT command in the ncb_command member of the NCB structure.
 * @see https://learn.microsoft.com/windows/win32/api/nb30/ns-nb30-session_buffer
 * @namespace Windows.Win32.NetworkManagement.NetBios
 */
export default struct SESSION_BUFFER {
    #StructPack 1

    /**
     * Specifies the local session number.
     */
    lsn : Int8

    state : Int8

    /**
     * Specifies the 16-byte NetBIOS name on the local computer used for this session.
     */
    local_name : Int8[16]

    /**
     * Specifies the 16-byte NetBIOS name on the remote computer used for this session.
     */
    remote_name : Int8[16]

    /**
     * Specifies the number of pending <b>NCBRECV</b> commands.
     */
    rcvs_outstanding : Int8

    /**
     * Specifies the number of pending <b>NCBSEND</b> and <b>NCBCHAINSEND</b> commands.
     */
    sends_outstanding : Int8

}
