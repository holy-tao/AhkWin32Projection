#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADAPTER_STATUS structure contains information about a network adapter.
 * @see https://learn.microsoft.com/windows/win32/api/nb30/ns-nb30-adapter_status
 * @namespace Windows.Win32.NetworkManagement.NetBios
 * @version v4.0.30319
 */
class ADAPTER_STATUS extends Win32Struct
{
    static sizeof => 60

    static packingSize => 4

    /**
     * Specifies encoded address of the adapter.
     * @type {Array<Byte>}
     */
    adapter_address{
        get {
            if(!this.HasProp("__adapter_addressProxyArray"))
                this.__adapter_addressProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__adapter_addressProxyArray
        }
    }

    /**
     * Specifies the major software-release level. This value is 3 for IBM NetBIOS 3. x.
     * @type {Integer}
     */
    rev_major {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * Reserved. This value is always zero.
     * @type {Integer}
     */
    reserved0 {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * Specifies the adapter type. This value is 0xFF for a Token Ring adapter or 0xFE for an Ethernet adapter.
     * @type {Integer}
     */
    adapter_type {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Specifies the minor software-release level. This value is zero for IBM NetBIOS x.0.
     * @type {Integer}
     */
    rev_minor {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * Specifies the duration of the reporting period, in minutes.
     * @type {Integer}
     */
    duration {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * Specifies the number of FRMR frames received.
     * @type {Integer}
     */
    frmr_recv {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Specifies the number of FRMR frames transmitted.
     * @type {Integer}
     */
    frmr_xmit {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * Specifies the number of I frames received in error.
     * @type {Integer}
     */
    iframe_recv_err {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * Specifies the number of aborted transmissions.
     * @type {Integer}
     */
    xmit_aborts {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * Specifies the number of successfully transmitted packets.
     * @type {Integer}
     */
    xmit_success {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies the number of successfully received packets.
     * @type {Integer}
     */
    recv_success {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the number of I frames transmitted in error.
     * @type {Integer}
     */
    iframe_xmit_err {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }

    /**
     * Specifies the number of times a buffer was not available to service a request from a remote computer.
     * @type {Integer}
     */
    recv_buff_unavail {
        get => NumGet(this, 30, "ushort")
        set => NumPut("ushort", value, this, 30)
    }

    /**
     * Specifies the number of times that the DLC T1 timer timed out.
     * 
     * <b>Windows 95:  </b>DLC is no longer supported.
     * @type {Integer}
     */
    t1_timeouts {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * Specifies the number of times that the ti inactivity timer timed out. The ti timer is used to detect links that have been broken.
     * @type {Integer}
     */
    ti_timeouts {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }

    /**
     * Reserved. This value is always zero.
     * @type {Integer}
     */
    reserved1 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Specifies the current number of free network control blocks.
     * @type {Integer}
     */
    free_ncbs {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * Undefined for IBM NetBIOS 3.0.
     * @type {Integer}
     */
    max_cfg_ncbs {
        get => NumGet(this, 42, "ushort")
        set => NumPut("ushort", value, this, 42)
    }

    /**
     * Undefined for IBM NetBIOS 3.0.
     * @type {Integer}
     */
    max_ncbs {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * Undefined for IBM NetBIOS 3.0.
     * @type {Integer}
     */
    xmit_buf_unavail {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }

    /**
     * Specifies the maximum size of a datagram packet. This value is always at least 512 bytes.
     * @type {Integer}
     */
    max_dgram_size {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * Specifies the number of pending sessions.
     * @type {Integer}
     */
    pending_sess {
        get => NumGet(this, 50, "ushort")
        set => NumPut("ushort", value, this, 50)
    }

    /**
     * Specifies the configured maximum pending sessions.
     * @type {Integer}
     */
    max_cfg_sess {
        get => NumGet(this, 52, "ushort")
        set => NumPut("ushort", value, this, 52)
    }

    /**
     * Undefined for IBM NetBIOS 3.0.
     * @type {Integer}
     */
    max_sess {
        get => NumGet(this, 54, "ushort")
        set => NumPut("ushort", value, this, 54)
    }

    /**
     * Specifies the maximum size of a session data packet.
     * @type {Integer}
     */
    max_sess_pkt_size {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * Specifies the number of names in the local names table.
     * @type {Integer}
     */
    name_count {
        get => NumGet(this, 58, "ushort")
        set => NumPut("ushort", value, this, 58)
    }
}
