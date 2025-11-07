#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\EVENT_DESCRIPTOR.ahk
#Include .\EVENT_HEADER.ahk
#Include .\ETW_BUFFER_CONTEXT.ahk

/**
 * Defines the layout of an event that ETW delivers.
 * @remarks
 * 
 * The <b>EVENT_RECORD</b> structure is passed to the consumer's implementation of the <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> callback .
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//evntcons/ns-evntcons-event_record
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_RECORD extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Information about the event such as the time stamp for when it was written. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_header">EVENT_HEADER</a> structure.
     * @type {EVENT_HEADER}
     */
    EventHeader{
        get {
            if(!this.HasProp("__EventHeader"))
                this.__EventHeader := EVENT_HEADER(0, this)
            return this.__EventHeader
        }
    }

    /**
     * Defines information such as the session that logged the event. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/relogger/ns-relogger-etw_buffer_context">ETW_BUFFER_CONTEXT</a> structure.
     * @type {ETW_BUFFER_CONTEXT}
     */
    BufferContext{
        get {
            if(!this.HasProp("__BufferContext"))
                this.__BufferContext := ETW_BUFFER_CONTEXT(64, this)
            return this.__BufferContext
        }
    }

    /**
     * The number of extended data structures in the <b>ExtendedData</b> member.
     * @type {Integer}
     */
    ExtendedDataCount {
        get => NumGet(this, 68, "ushort")
        set => NumPut("ushort", value, this, 68)
    }

    /**
     * The size, in bytes, of the data in the <b>UserData</b> member.
     * @type {Integer}
     */
    UserDataLength {
        get => NumGet(this, 70, "ushort")
        set => NumPut("ushort", value, this, 70)
    }

    /**
     * One or more extended data items that ETW collects.  The extended data includes some items, such as the security identifier (SID) of the user that logged the event, only if the controller sets the <i>EnableProperty</i> parameter passed to the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex-func">EnableTraceEx</a> or <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function. The extended data includes other items, such as the related activity identifier and decoding information for trace logging, regardless whether the controller sets the <i>EnableProperty</i> parameter passed to  <b>EnableTraceEx</b> or <b>EnableTraceEx2</b>.  For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_header_extended_data_item">EVENT_HEADER_EXTENDED_DATA_ITEM</a> structure .
     * @type {Pointer<EVENT_HEADER_EXTENDED_DATA_ITEM>}
     */
    ExtendedData {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Event specific data. To parse this data, see <a href="https://docs.microsoft.com/windows/desktop/ETW/retrieving-event-data-using-tdh">Retrieving Event Data Using TDH</a>. If the <b>Flags</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_header">EVENT_HEADER</a> contains  <b>EVENT_HEADER_FLAG_STRING_ONLY</b>, the data is a null-terminated Unicode string that you do not need TDH to parse.
     * @type {Pointer<Void>}
     */
    UserData {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Th context specified in the <b>Context</b> member of the <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-logfile">EVENT_TRACE_LOGFILE</a> structure that is passed to the <a href="https://docs.microsoft.com/windows/desktop/ETW/opentrace">OpenTrace</a> function.
     * @type {Pointer<Void>}
     */
    UserContext {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
