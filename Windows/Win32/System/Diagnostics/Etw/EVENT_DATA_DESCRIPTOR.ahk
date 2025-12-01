#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The EVENT_DATA_DESCRIPTOR structure defines a block of data that will be used in an ETW event.
 * @remarks
 * Most event providers will not call **EventDataDescCreate** directly. Instead,
 * most event providers are implemented using an ETW framework that wraps the calls
 * to **EventRegister**, **EventWrite**, and **EventUnregister**. For example, you
 * might
 * [write an event manifest](/windows/win32/etw/writing-manifest-based-events) and
 * then use the [Message Compiler](/windows/win32/wes/message-compiler--mc-exe-) to
 * generate C/C++ code for the events, or you might use
 * [TraceLogging](/windows/win32/tracelogging/trace-logging-portal) to avoid the
 * need for a manifest.
 * 
 * To write an event that contains event data, you would create an array of
 * **EVENT_DATA_DESCRIPTOR** structures (one element for each chunk of data) and
 * call the
 * [EventDataDescCreate](/windows/desktop/api/evntprov/nf-evntprov-eventdatadesccreate)
 * function to initialize each element with the data to be included in your event.
 * You would then pass this array to
 * [EventWrite](/windows/desktop/api/evntprov/nf-evntprov-eventwrite) to include
 * the data into the event. For an example, see
 * [Writing Manifest-based Events](/windows/desktop/ETW/writing-manifest-based-events).
 * 
 * The data written to the event will be the concatenation of the data chunks
 * referenced by the **EVENT_DATA_DESCRIPTOR** structures passed to the
 * `EventWrite` function. This concatenation contains no padding and does not
 * retain any of the boundaries or size information from the original set of data
 * chunks.
 * 
 * The total size of an ETW event (the sum of the user-provided data, the
 * [EVENT_HEADER](/windows/desktop/api/evntcons/ns-evntcons-event_header), and any
 * [EVENT_HEADER_EXTENDED_DATA_ITEM](/windows/desktop/api/evntcons/ns-evntcons-event_header_extended_data_item)
 * that might be needed for the event) cannot exceed 64KB. Events larger than 64KB
 * will be dropped by the ETW runtime.
 * 
 * In addition, ETW events that cannot fit into a trace session buffer will also be
 * dropped. Each buffer has a 72-byte header, so the largest event that can fit
 * into a buffer is slightly smaller than the buffer's size. For example, a trace
 * session that uses 32KB buffers will not be able to accept any event larger than
 * 32,696 bytes (32,768-byte buffer minus the 72-byte header leaves 32,696 bytes
 * for events).
 * @see https://learn.microsoft.com/windows/win32/api/evntprov/ns-evntprov-event_data_descriptor
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_DATA_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to the data.
     * 
     * > [!Important]
     * > This is a 64-bit unsigned integer value in both 32-bit and
     * > 64-bit architectures. To properly set this value, cast your data pointer to an
     * > unsigned integer before assigning it to the `Ptr` field, e.g.
     * > `EventDataDescriptor.Ptr = (UINT_PTR)dataPointer;`, or use the
     * > [EventDataDescCreate](/windows/win32/api/evntprov/nf-evntprov-eventdatadesccreate)
     * > function.
     * @type {Integer}
     */
    Ptr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the data in bytes.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }
}
