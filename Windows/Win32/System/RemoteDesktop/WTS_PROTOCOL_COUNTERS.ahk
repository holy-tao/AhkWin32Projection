#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains protocol performance counters.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_protocol_status">WTS_PROTOCOL_STATUS</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_protocol_counters
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_PROTOCOL_COUNTERS {
    #StructPack 4

    /**
     * The number of bytes sent and received.
     */
    WdBytes : UInt32

    /**
     * The number of frames sent and received.
     */
    WdFrames : UInt32

    /**
     * The number of times the protocol waited for an output buffer to become available.
     */
    WaitForOutBuf : UInt32

    /**
     * Transport driver number of frames sent and received.
     */
    Frames : UInt32

    /**
     * Transport driver number of bytes sent and received.
     */
    Bytes : UInt32

    /**
     * The number of compressed bytes.
     */
    CompressedBytes : UInt32

    /**
     * The number of compressed flushes. A compressed flush occurs when compression for a packet fails and is replaced by the original uncompressed packet.
     */
    CompressFlushes : UInt32

    /**
     * The number of packets that were in error during the session.
     */
    Errors : UInt32

    /**
     * The number of timeouts during the session.
     */
    Timeouts : UInt32

    /**
     * The number of asynchronous framing errors during the session.
     */
    AsyncFramingError : UInt32

    /**
     * The number of asynchronous overrun errors during the session.
     */
    AsyncOverrunError : UInt32

    /**
     * The number of asynchronous overflow errors during the session.
     */
    AsyncOverflowError : UInt32

    /**
     * The number of asynchronous parity errors during the session.
     */
    AsyncParityError : UInt32

    /**
     * The number of transport protocol errors during the session.
     */
    TdErrors : UInt32

    /**
     * The type of the protocol.
     */
    ProtocolType : UInt16

    /**
     * The length of data in the <b>Reserved</b> field.
     */
    Length : UInt16

    /**
     * Specifies the type of counter that can be queried. This can be <b>TShareCounters</b> or <b>Reserved</b>.
     */
    Specific : UInt16

    /**
     * An array of protocol specific data. The maximum length can be WTS_MAX_RESERVED multiplied by the size of an unsigned long integer.
     */
    Reserved : UInt32[100]

}
