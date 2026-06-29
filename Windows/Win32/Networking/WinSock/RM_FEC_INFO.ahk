#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * The RM_FEC_INFO structure specifies settings for using forward error correction (FEC) with Reliable Multicast. This structure is used with the RM_USE_FEC socket option.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/WinSock/socket-options">RM_USE_FEC</a> socket option notifies the Reliable Multicast sender to apply forward error correction techniques to send repair data. there are three modes of using forward error correction:
 * 
 * <ol>
 * <li>Pro-active parity packets only</li>
 * <li>OnDemand parity packets only</li>
 * <li>Both pro-active and OnDemand parity packets</li>
 * </ol>
 * Since the use of this structure implies the need for forward error correction, either the <b>FECProActivePackets</b> or <b>fFECOnDemandParityEnabled</b> member must be nonzero, otherwise the function call fails.
 * @see https://learn.microsoft.com/windows/win32/api/wsrm/ns-wsrm-rm_fec_info
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct RM_FEC_INFO {
    #StructPack 2

    /**
     * Maximum number of packets that can be sent for any group, including original data and parity packets. Maximum and default value is 255.
     */
    FECBlockSize : UInt16

    /**
     * Number of packets to send proactively with each group. Use this option when the network is dispersed, and upstream NAK requests would have an impact on throughput.
     */
    FECProActivePackets : UInt16

    /**
     * Number of packets to be treated as one group for the purpose of computing parity packets. Group size must be a power of two. In lossy networks, keep the group size relatively small.
     */
    FECGroupSize : Int8

    /**
     * Specifies whether the sender is enabled for sending parity repair packets. When <b>TRUE</b>, receivers should only request parity repair packets.
     */
    fFECOnDemandParityEnabled : BOOLEAN

}
