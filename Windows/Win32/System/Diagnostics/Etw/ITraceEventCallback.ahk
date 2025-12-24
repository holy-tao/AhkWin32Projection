#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/relogger/nn-relogger-itraceeventcallback
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ITraceEventCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITraceEventCallback
     * @type {Guid}
     */
    static IID => Guid("{3ed25501-593f-43e9-8f38-3ab46f5a4a52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnBeginProcessTrace", "OnFinalizeProcessTrace", "OnEvent"]

    /**
     * Indicates that a trace is about to begin so that relogging can be started.
     * @param {ITraceEvent} HeaderEvent Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/relogger/nn-relogger-itraceevent">ITraceEvent</a>*</b>
     * 
     * Supplies a pointer to the header event.
     * @param {ITraceRelogger} Relogger Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/relogger/nn-relogger-itracerelogger">ITraceRelogger</a>*</b>
     * 
     * Supplies a pointer to the <b>ITraceRelogger</b> interface, which exposes
     *         APIs for actual event injection, synthesizing new events, and cloning
     *         existing events.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itraceeventcallback-onbeginprocesstrace
     */
    OnBeginProcessTrace(HeaderEvent, Relogger) {
        result := ComCall(3, this, "ptr", HeaderEvent, "ptr", Relogger, "HRESULT")
        return result
    }

    /**
     * Indicates that a trace is about to end so that relogging can be finalized.
     * @param {ITraceRelogger} Relogger Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/relogger/nn-relogger-itracerelogger">ITraceRelogger</a>*</b>
     * 
     * The trace relogger that was used to register this callback and relog this trace.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itraceeventcallback-onfinalizeprocesstrace
     */
    OnFinalizeProcessTrace(Relogger) {
        result := ComCall(4, this, "ptr", Relogger, "HRESULT")
        return result
    }

    /**
     * Indicates that an event has been received on the trace streams associated with a relogger.
     * @param {ITraceEvent} Event Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/relogger/nn-relogger-itraceevent">ITraceEvent</a>*</b>
     * 
     * The event being logged.
     * @param {ITraceRelogger} Relogger Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/relogger/nn-relogger-itracerelogger">ITraceRelogger</a>*</b>
     * 
     * The trace relogger that was used to register this callback and relog this trace.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//relogger/nf-relogger-itraceeventcallback-onevent
     */
    OnEvent(Event, Relogger) {
        result := ComCall(5, this, "ptr", Event, "ptr", Relogger, "HRESULT")
        return result
    }
}
