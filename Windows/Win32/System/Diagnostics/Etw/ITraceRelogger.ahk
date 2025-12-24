#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ITraceEvent.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Provides access to the relogging functionality, allowing you to manipulate and relog events from an ETW trace stream.
 * @remarks
 * 
 * This interface is not supported on Windows 7 for the IA64 architecture.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//relogger/nn-relogger-itracerelogger
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ITraceRelogger extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITraceRelogger
     * @type {Guid}
     */
    static IID => Guid("{f754ad43-3bcc-4286-8009-9c5da214e84e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddLogfileTraceStream", "AddRealtimeTraceStream", "RegisterCallback", "Inject", "CreateEventInstance", "ProcessTrace", "SetOutputFilename", "SetCompressionMode", "Cancel"]

    /**
     * Adds a new logfile-based ETW trace stream to the relogger.
     * @param {BSTR} LogfileName Type: <b>BSTR</b>
     * 
     * The file that contains the events to be relogged.
     * @param {Pointer<Void>} UserContext Type: <b>void*</b>
     * 
     * The user context under which to relog these events.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itracerelogger-addlogfiletracestream
     */
    AddLogfileTraceStream(LogfileName, UserContext) {
        LogfileName := LogfileName is String ? BSTR.Alloc(LogfileName).Value : LogfileName

        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", LogfileName, UserContextMarshal, UserContext, "uint*", &TraceStreamId := 0, "HRESULT")
        return TraceStreamId
    }

    /**
     * Adds a new real-time ETW trace stream to the relogger.
     * @param {BSTR} LoggerName Type: <b>BSTR</b>
     * 
     * The real-time logger generating the events to relog
     * @param {Pointer<Void>} UserContext Type: <b>void*</b>
     * 
     * The user context under which to relog these events.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itracerelogger-addrealtimetracestream
     */
    AddRealtimeTraceStream(LoggerName, UserContext) {
        LoggerName := LoggerName is String ? BSTR.Alloc(LoggerName).Value : LoggerName

        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", LoggerName, UserContextMarshal, UserContext, "uint*", &TraceStreamId := 0, "HRESULT")
        return TraceStreamId
    }

    /**
     * Registers an implementation of IEventCallback with the relogger in order to signal trace activity (starting, stopping, and logging new events).
     * @param {ITraceEventCallback} Callback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/relogger/nn-relogger-itraceeventcallback">IEventCallback</a>*</b>
     * 
     * The trace activity information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itracerelogger-registercallback
     */
    RegisterCallback(Callback) {
        result := ComCall(5, this, "ptr", Callback, "HRESULT")
        return result
    }

    /**
     * Injects a non-system-generated event into the event stream being written to the output trace logfile.
     * @param {ITraceEvent} Event Type: <b>IEvent*</b>
     * 
     * The event to be injected into the stream.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itracerelogger-inject
     */
    Inject(Event) {
        result := ComCall(6, this, "ptr", Event, "HRESULT")
        return result
    }

    /**
     * Generates a new event.
     * @param {Integer} TraceStreamId 
     * @param {Integer} Flags Type: <b>ULONG</b>
     * 
     * Indicates whether the event is classic or crimson.
     * @returns {ITraceEvent} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/relogger/nn-relogger-itraceevent">ITraceEvent</a>**</b>
     * 
     * The newly generated event.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itracerelogger-createeventinstance
     */
    CreateEventInstance(TraceStreamId, Flags) {
        result := ComCall(7, this, "uint", TraceStreamId, "uint", Flags, "ptr*", &Event := 0, "HRESULT")
        return ITraceEvent(Event)
    }

    /**
     * Delivers events from the associated trace streams to the consumer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itracerelogger-processtrace
     */
    ProcessTrace() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Indicates the file to which ETW should write the new, relogged trace.
     * @param {BSTR} LogfileName Type: <b>BSTR</b>
     * 
     * The new filename.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itracerelogger-setoutputfilename
     */
    SetOutputFilename(LogfileName) {
        LogfileName := LogfileName is String ? BSTR.Alloc(LogfileName).Value : LogfileName

        result := ComCall(9, this, "ptr", LogfileName, "HRESULT")
        return result
    }

    /**
     * Enables or disables compression on the relogged trace.
     * @param {BOOLEAN} CompressionMode Type: <b>BOOLEAN</b>
     * 
     * True if compression is enabled; otherwise, false.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itracerelogger-setcompressionmode
     */
    SetCompressionMode(CompressionMode) {
        result := ComCall(10, this, "char", CompressionMode, "HRESULT")
        return result
    }

    /**
     * Terminates the relogging process.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itracerelogger-cancel
     */
    Cancel() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
