#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ADAPTER_STATUS structure contains information about a network adapter.
 * @see https://learn.microsoft.com/windows/win32/api/nb30/ns-nb30-adapter_status
 * @namespace Windows.Win32.NetworkManagement.NetBios
 */
export default struct ADAPTER_STATUS {
    #StructPack 4

    /**
     * Specifies encoded address of the adapter.
     */
    adapter_address : Int8[6]

    /**
     * Specifies the major software-release level. This value is 3 for IBM NetBIOS 3. x.
     */
    rev_major : Int8

    /**
     * Reserved. This value is always zero.
     */
    reserved0 : Int8

    /**
     * Specifies the adapter type. This value is 0xFF for a Token Ring adapter or 0xFE for an Ethernet adapter.
     */
    adapter_type : Int8

    /**
     * Specifies the minor software-release level. This value is zero for IBM NetBIOS x.0.
     */
    rev_minor : Int8

    /**
     * Specifies the duration of the reporting period, in minutes.
     */
    duration : UInt16

    /**
     * Specifies the number of FRMR frames received.
     */
    frmr_recv : UInt16

    /**
     * Specifies the number of FRMR frames transmitted.
     */
    frmr_xmit : UInt16

    /**
     * Specifies the number of I frames received in error.
     */
    iframe_recv_err : UInt16

    /**
     * Specifies the number of aborted transmissions.
     */
    xmit_aborts : UInt16

    /**
     * Specifies the number of successfully transmitted packets.
     */
    xmit_success : UInt32

    /**
     * Specifies the number of successfully received packets.
     */
    recv_success : UInt32

    /**
     * Specifies the number of I frames transmitted in error.
     */
    iframe_xmit_err : UInt16

    /**
     * Specifies the number of times a buffer was not available to service a request from a remote computer.
     */
    recv_buff_unavail : UInt16

    /**
     * Specifies the number of times that the DLC T1 timer timed out.
     * 
     * <b>Windows 95:  </b>DLC is no longer supported.
     */
    t1_timeouts : UInt16

    /**
     * Specifies the number of times that the ti inactivity timer timed out. The ti timer is used to detect links that have been broken.
     */
    ti_timeouts : UInt16

    /**
     * Reserved. This value is always zero.
     */
    reserved1 : UInt32

    /**
     * Specifies the current number of free network control blocks.
     */
    free_ncbs : UInt16

    /**
     * Undefined for IBM NetBIOS 3.0.
     */
    max_cfg_ncbs : UInt16

    /**
     * Undefined for IBM NetBIOS 3.0.
     */
    max_ncbs : UInt16

    /**
     * Undefined for IBM NetBIOS 3.0.
     */
    xmit_buf_unavail : UInt16

    /**
     * Specifies the maximum size of a datagram packet. This value is always at least 512 bytes.
     */
    max_dgram_size : UInt16

    /**
     * Specifies the number of pending sessions.
     */
    pending_sess : UInt16

    /**
     * Specifies the configured maximum pending sessions.
     */
    max_cfg_sess : UInt16

    /**
     * Undefined for IBM NetBIOS 3.0.
     */
    max_sess : UInt16

    /**
     * Specifies the maximum size of a session data packet.
     */
    max_sess_pkt_size : UInt16

    /**
     * Specifies the number of names in the local names table.
     */
    name_count : UInt16

}
