#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains protocol performance counters.
 * @remarks
 * 
  * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_protocol_status">WTS_PROTOCOL_STATUS</a> structure.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsdefs/ns-wtsdefs-wts_protocol_counters
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_PROTOCOL_COUNTERS extends Win32Struct
{
    static sizeof => 464

    static packingSize => 4

    /**
     * The number of bytes sent and received.
     * @type {Integer}
     */
    WdBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of frames sent and received.
     * @type {Integer}
     */
    WdFrames {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of times the protocol waited for an output buffer to become available.
     * @type {Integer}
     */
    WaitForOutBuf {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Transport driver number of frames sent and received.
     * @type {Integer}
     */
    Frames {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Transport driver number of bytes sent and received.
     * @type {Integer}
     */
    Bytes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of compressed bytes.
     * @type {Integer}
     */
    CompressedBytes {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The number of compressed flushes. A compressed flush occurs when compression for a packet fails and is replaced by the original uncompressed packet.
     * @type {Integer}
     */
    CompressFlushes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of packets that were in error during the session.
     * @type {Integer}
     */
    Errors {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The number of timeouts during the session.
     * @type {Integer}
     */
    Timeouts {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The number of asynchronous framing errors during the session.
     * @type {Integer}
     */
    AsyncFramingError {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The number of asynchronous overrun errors during the session.
     * @type {Integer}
     */
    AsyncOverrunError {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The number of asynchronous overflow errors during the session.
     * @type {Integer}
     */
    AsyncOverflowError {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The number of asynchronous parity errors during the session.
     * @type {Integer}
     */
    AsyncParityError {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The number of transport protocol errors during the session.
     * @type {Integer}
     */
    TdErrors {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The type of the protocol.
     * @type {Integer}
     */
    ProtocolType {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * The length of data in the <b>Reserved</b> field.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 58, "ushort")
        set => NumPut("ushort", value, this, 58)
    }

    /**
     * Specifies the type of counter that can be queried. This can be <b>TShareCounters</b> or <b>Reserved</b>.
     * @type {Integer}
     */
    Specific {
        get => NumGet(this, 60, "ushort")
        set => NumPut("ushort", value, this, 60)
    }

    /**
     * An array of protocol specific data. The maximum length can be WTS_MAX_RESERVED multiplied by the size of an unsigned long integer.
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 64, 100, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
