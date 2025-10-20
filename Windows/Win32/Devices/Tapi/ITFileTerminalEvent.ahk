#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITFileTerminalEvent interface contains methods that retrieve the description of file terminal events that have occurred.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itfileterminalevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITFileTerminalEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITFileTerminalEvent
     * @type {Guid}
     */
    static IID => Guid("{e4a7fbac-8c17-4427-9f55-9f589ac8af00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Terminal", "get_Track", "get_Call", "get_State", "get_Cause", "get_Error"]

    /**
     * 
     * @param {Pointer<ITTerminal>} ppTerminal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_terminal
     */
    get_Terminal(ppTerminal) {
        result := ComCall(7, this, "ptr*", ppTerminal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITFileTrack>} ppTrackTerminal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_track
     */
    get_Track(ppTrackTerminal) {
        result := ComCall(8, this, "ptr*", ppTrackTerminal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITCallInfo>} ppCall 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_call
     */
    get_Call(ppCall) {
        result := ComCall(9, this, "ptr*", ppCall, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_state
     */
    get_State(pState) {
        result := ComCall(10, this, "int*", pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCause 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_cause
     */
    get_Cause(pCause) {
        result := ComCall(11, this, "int*", pCause, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phrErrorCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfileterminalevent-get_error
     */
    get_Error(phrErrorCode) {
        result := ComCall(12, this, "ptr", phrErrorCode, "HRESULT")
        return result
    }
}
