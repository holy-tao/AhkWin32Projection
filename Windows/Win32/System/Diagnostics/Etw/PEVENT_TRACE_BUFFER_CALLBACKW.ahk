#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * The PEVENT_TRACE_BUFFER_CALLBACKW (Unicode) (evntrace.h) function gets statistics about each buffer of events that ETW sends during a trace processing session.
 * @remarks
 * To specify the function that ETW calls to deliver the buffer statistics, set the
 * **BufferCallback** member of the
 * [EVENT_TRACE_LOGFILE](/windows/win32/api/evntrace/ns-evntrace-event_trace_logfilew)
 * structure that you pass to the
 * [OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracew) function.
 * @see https://learn.microsoft.com/windows/win32/api//content/evntrace/nc-evntrace-pevent_trace_buffer_callbackw
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 * @charset Unicode
 */
class PEVENT_TRACE_BUFFER_CALLBACKW extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<EVENT_TRACE_LOGFILEW>} Logfile 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Logfile) {
        result := ComCall(3, this, "ptr", Logfile, "uint")
        return result
    }
}
