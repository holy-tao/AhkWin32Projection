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
     * 
     * @param {ITraceEvent} HeaderEvent 
     * @param {ITraceRelogger} Relogger 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceeventcallback-onbeginprocesstrace
     */
    OnBeginProcessTrace(HeaderEvent, Relogger) {
        result := ComCall(3, this, "ptr", HeaderEvent, "ptr", Relogger, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITraceRelogger} Relogger 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceeventcallback-onfinalizeprocesstrace
     */
    OnFinalizeProcessTrace(Relogger) {
        result := ComCall(4, this, "ptr", Relogger, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITraceEvent} Event 
     * @param {ITraceRelogger} Relogger 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/relogger/nf-relogger-itraceeventcallback-onevent
     */
    OnEvent(Event, Relogger) {
        result := ComCall(5, this, "ptr", Event, "ptr", Relogger, "HRESULT")
        return result
    }
}
