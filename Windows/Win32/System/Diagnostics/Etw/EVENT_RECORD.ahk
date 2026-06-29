#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EVENT_DESCRIPTOR.ahk" { EVENT_DESCRIPTOR }
#Import ".\EVENT_HEADER.ahk" { EVENT_HEADER }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\EVENT_HEADER_EXTENDED_DATA_ITEM.ahk" { EVENT_HEADER_EXTENDED_DATA_ITEM }
#Import ".\ETW_BUFFER_CONTEXT.ahk" { ETW_BUFFER_CONTEXT }

/**
 * The EVENT_RECORD structure (evntcons.h) defines the layout of an event that ETW delivers.
 * @remarks
 * The <b>EVENT_RECORD</b> structure is passed to the consumer's implementation of the <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> callback .
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_record
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_RECORD {
    #StructPack 8

    /**
     * Information about the event such as the time stamp for when it was written. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_header">EVENT_HEADER</a> structure.
     */
    EventHeader : EVENT_HEADER

    /**
     * Defines information such as the session that logged the event. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/relogger/ns-relogger-etw_buffer_context">ETW_BUFFER_CONTEXT</a> structure.
     */
    BufferContext : ETW_BUFFER_CONTEXT

    /**
     * The number of extended data structures in the <b>ExtendedData</b> member.
     */
    ExtendedDataCount : UInt16

    /**
     * The size, in bytes, of the data in the <b>UserData</b> member.
     */
    UserDataLength : UInt16

    /**
     * One or more extended data items that ETW collects.  The extended data includes some items, such as the security identifier (SID) of the user that logged the event, only if the controller sets the <i>EnableProperty</i> parameter passed to the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex-func">EnableTraceEx</a> or <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function. The extended data includes other items, such as the related activity identifier and decoding information for trace logging, regardless whether the controller sets the <i>EnableProperty</i> parameter passed to  <b>EnableTraceEx</b> or <b>EnableTraceEx2</b>.  For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_header_extended_data_item">EVENT_HEADER_EXTENDED_DATA_ITEM</a> structure .
     */
    ExtendedData : EVENT_HEADER_EXTENDED_DATA_ITEM.Ptr

    /**
     * Event specific data. To parse this data, see <a href="https://docs.microsoft.com/windows/desktop/ETW/retrieving-event-data-using-tdh">Retrieving Event Data Using TDH</a>. If the <b>Flags</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_header">EVENT_HEADER</a> contains  <b>EVENT_HEADER_FLAG_STRING_ONLY</b>, the data is a null-terminated Unicode string that you do not need TDH to parse.
     */
    UserData : IntPtr

    /**
     * Th context specified in the <b>Context</b> member of the <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-logfile">EVENT_TRACE_LOGFILE</a> structure that is passed to the <a href="https://docs.microsoft.com/windows/desktop/ETW/opentrace">OpenTrace</a> function.
     */
    UserContext : IntPtr

}
