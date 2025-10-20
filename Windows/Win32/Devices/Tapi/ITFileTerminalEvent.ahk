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
     * 
     * @param {Pointer<ITTerminal>} ppTerminal 
     * @returns {HRESULT} 
     */
    get_Terminal(ppTerminal) {
        result := ComCall(7, this, "ptr", ppTerminal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITFileTrack>} ppTrackTerminal 
     * @returns {HRESULT} 
     */
    get_Track(ppTrackTerminal) {
        result := ComCall(8, this, "ptr", ppTrackTerminal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITCallInfo>} ppCall 
     * @returns {HRESULT} 
     */
    get_Call(ppCall) {
        result := ComCall(9, this, "ptr", ppCall, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pState 
     * @returns {HRESULT} 
     */
    get_State(pState) {
        result := ComCall(10, this, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCause 
     * @returns {HRESULT} 
     */
    get_Cause(pCause) {
        result := ComCall(11, this, "int*", pCause, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phrErrorCode 
     * @returns {HRESULT} 
     */
    get_Error(phrErrorCode) {
        result := ComCall(12, this, "ptr", phrErrorCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
