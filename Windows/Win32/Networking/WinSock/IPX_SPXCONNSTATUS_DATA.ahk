#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IPX_SPXCONNSTATUS_DATA structure provides information about a connected SPX socket.
 * @see https://docs.microsoft.com/windows/win32/api//wsnwlink/ns-wsnwlink-ipx_spxconnstatus_data
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IPX_SPXCONNSTATUS_DATA extends Win32Struct
{
    static sizeof => 44

    static packingSize => 2

    /**
     * Specifies the connection state.
     * @type {Integer}
     */
    ConnectionState {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies whether watchdog capabilities are active.
     * @type {Integer}
     */
    WatchDogActive {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Specifies the local connection ID.
     * @type {Integer}
     */
    LocalConnectionId {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Specifies the remote connection ID.
     * @type {Integer}
     */
    RemoteConnectionId {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Specifies the local sequence number.
     * @type {Integer}
     */
    LocalSequenceNumber {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Specifies the local acknowledgment (ACK) number.
     * @type {Integer}
     */
    LocalAckNumber {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Specifies the local allocation number.
     * @type {Integer}
     */
    LocalAllocNumber {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * Specifies the remote acknowledgment (ACK) number.
     * @type {Integer}
     */
    RemoteAckNumber {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Specifies the remote allocation number.
     * @type {Integer}
     */
    RemoteAllocNumber {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * Specifies the local socket.
     * @type {Integer}
     */
    LocalSocket {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * Specifies the IPX address to which the local computer is attached.
     * @type {Array<Byte>}
     */
    ImmediateAddress{
        get {
            if(!this.HasProp("__ImmediateAddressProxyArray"))
                this.__ImmediateAddressProxyArray := Win32FixedArray(this.ptr + 18, 6, Primitive, "char")
            return this.__ImmediateAddressProxyArray
        }
    }

    /**
     * Specifies the network to which the remote host is attached.
     * @type {Array<Byte>}
     */
    RemoteNetwork{
        get {
            if(!this.HasProp("__RemoteNetworkProxyArray"))
                this.__RemoteNetworkProxyArray := Win32FixedArray(this.ptr + 24, 4, Primitive, "char")
            return this.__RemoteNetworkProxyArray
        }
    }

    /**
     * Specifies the remote node.
     * @type {Array<Byte>}
     */
    RemoteNode{
        get {
            if(!this.HasProp("__RemoteNodeProxyArray"))
                this.__RemoteNodeProxyArray := Win32FixedArray(this.ptr + 28, 6, Primitive, "char")
            return this.__RemoteNodeProxyArray
        }
    }

    /**
     * Specifies the remote socket.
     * @type {Integer}
     */
    RemoteSocket {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }

    /**
     * Specifies the number of retransmissions.
     * @type {Integer}
     */
    RetransmissionCount {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * Specifies the estimated round trip–time, in milliseconds, delay for a given packet.
     * @type {Integer}
     */
    EstimatedRoundTripDelay {
        get => NumGet(this, 38, "ushort")
        set => NumPut("ushort", value, this, 38)
    }

    /**
     * Specifies the number of retransmitted packets on the socket.
     * @type {Integer}
     */
    RetransmittedPackets {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * Specifies the number of suppressed packets on the socket.
     * @type {Integer}
     */
    SuppressedPacket {
        get => NumGet(this, 42, "ushort")
        set => NumPut("ushort", value, this, 42)
    }
}
