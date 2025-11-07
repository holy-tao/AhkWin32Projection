#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCallInfo.ahk
#Include .\ITTerminal.ahk
#Include .\ITStream.ahk
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
     * @returns {ITCallInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pCallMediaEvent := 0, "HRESULT")
        return pCallMediaEvent
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_error
     */
    get_Error() {
        result := ComCall(9, this, "int*", &phrError := 0, "HRESULT")
        return phrError
    }

    /**
     * 
     * @returns {ITTerminal} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_terminal
     */
    get_Terminal() {
        result := ComCall(10, this, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }

    /**
     * 
     * @returns {ITStream} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_stream
     */
    get_Stream() {
        result := ComCall(11, this, "ptr*", &ppStream := 0, "HRESULT")
        return ITStream(ppStream)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallmediaevent-get_cause
     */
    get_Cause() {
        result := ComCall(12, this, "int*", &pCause := 0, "HRESULT")
        return pCause
    }
}
