#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RM_FEC_INFO structure specifies settings for using forward error correction (FEC) with Reliable Multicast. This structure is used with the RM_USE_FEC socket option.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/WinSock/socket-options">RM_USE_FEC</a> socket option notifies the Reliable Multicast sender to apply forward error correction techniques to send repair data. there are three modes of using forward error correction:
 * 
 * <ol>
 * <li>Pro-active parity packets only</li>
 * <li>OnDemand parity packets only</li>
 * <li>Both pro-active and OnDemand parity packets</li>
 * </ol>
 * Since the use of this structure implies the need for forward error correction, either the <b>FECProActivePackets</b> or <b>fFECOnDemandParityEnabled</b> member must be nonzero, otherwise the function call fails.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wsrm/ns-wsrm-rm_fec_info
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class RM_FEC_INFO extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * Maximum number of packets that can be sent for any group, including original data and parity packets. Maximum and default value is 255.
     * @type {Integer}
     */
    FECBlockSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Number of packets to send proactively with each group. Use this option when the network is dispersed, and upstream NAK requests would have an impact on throughput.
     * @type {Integer}
     */
    FECProActivePackets {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Number of packets to be treated as one group for the purpose of computing parity packets. Group size must be a power of two. In lossy networks, keep the group size relatively small.
     * @type {Integer}
     */
    FECGroupSize {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * Specifies whether the sender is enabled for sending parity repair packets. When <b>TRUE</b>, receivers should only request parity repair packets.
     * @type {BOOLEAN}
     */
    fFECOnDemandParityEnabled {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }
}
