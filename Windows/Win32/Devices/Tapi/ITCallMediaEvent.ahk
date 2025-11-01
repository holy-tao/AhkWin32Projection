#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITCallMediaEvent interface contains methods that retrieve the description of media events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcallmediaevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCallMediaEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITCallMediaEvent
     * @type {Guid}
     */
    static IID => Guid("{ff36b87f-ec3a-11d0-8ee4-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Call", "get_Event", "get_Error", "get_Terminal", "get_Stream", "get_Cause"]

    /**
     * 
     * @param {Pointer<ITCallInfo>} ppCallInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_call
     */
    get_Call(ppCallInfo) {
        result := ComCall(7, this, "ptr*", ppCallInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCallMediaEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_event
     */
    get_Event(pCallMediaEvent) {
        pCallMediaEventMarshal := pCallMediaEvent is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pCallMediaEventMarshal, pCallMediaEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phrError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_error
     */
    get_Error(phrError) {
        result := ComCall(9, this, "ptr", phrError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITTerminal>} ppTerminal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_terminal
     */
    get_Terminal(ppTerminal) {
        result := ComCall(10, this, "ptr*", ppTerminal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITStream>} ppStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_stream
     */
    get_Stream(ppStream) {
        result := ComCall(11, this, "ptr*", ppStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCause 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_cause
     */
    get_Cause(pCause) {
        pCauseMarshal := pCause is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pCauseMarshal, pCause, "HRESULT")
        return result
    }
}
