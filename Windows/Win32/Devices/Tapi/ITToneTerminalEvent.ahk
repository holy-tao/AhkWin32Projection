#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITToneTerminalEvent interface contains methods that retrieve the description of tone terminal events that have occurred.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ittoneterminalevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITToneTerminalEvent extends IDispatch{
    /**
     * The interface identifier for ITToneTerminalEvent
     * @type {Guid}
     */
    static IID => Guid("{e6f56009-611f-4945-bbd2-2d0ce5612056}")

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
     * @param {Pointer<ITCallInfo>} ppCall 
     * @returns {HRESULT} 
     */
    get_Call(ppCall) {
        result := ComCall(8, this, "ptr", ppCall, "int")
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
        result := ComCall(9, this, "ptr", phrErrorCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
