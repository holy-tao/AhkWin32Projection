#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITTerminal interface is the base interface for a Terminal object.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itterminal
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITTerminal extends IDispatch{
    /**
     * The interface identifier for ITTerminal
     * @type {Guid}
     */
    static IID => Guid("{b1efc38a-9355-11d0-835c-00aa003ccabd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} ppName 
     * @returns {HRESULT} 
     */
    get_Name(ppName) {
        result := ComCall(7, this, "ptr", ppName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTerminalState 
     * @returns {HRESULT} 
     */
    get_State(pTerminalState) {
        result := ComCall(8, this, "int*", pTerminalState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    get_TerminalType(pType) {
        result := ComCall(9, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppTerminalClass 
     * @returns {HRESULT} 
     */
    get_TerminalClass(ppTerminalClass) {
        result := ComCall(10, this, "ptr", ppTerminalClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMediaType 
     * @returns {HRESULT} 
     */
    get_MediaType(plMediaType) {
        result := ComCall(11, this, "int*", plMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pDirection 
     * @returns {HRESULT} 
     */
    get_Direction(pDirection) {
        result := ComCall(12, this, "int*", pDirection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
