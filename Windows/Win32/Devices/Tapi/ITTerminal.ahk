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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_State", "get_TerminalType", "get_TerminalClass", "get_MediaType", "get_Direction"]

    /**
     * 
     * @param {Pointer<BSTR>} ppName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_name
     */
    get_Name(ppName) {
        result := ComCall(7, this, "ptr", ppName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTerminalState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_state
     */
    get_State(pTerminalState) {
        result := ComCall(8, this, "int*", pTerminalState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_terminaltype
     */
    get_TerminalType(pType) {
        result := ComCall(9, this, "int*", pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppTerminalClass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_terminalclass
     */
    get_TerminalClass(ppTerminalClass) {
        result := ComCall(10, this, "ptr", ppTerminalClass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_mediatype
     */
    get_MediaType(plMediaType) {
        result := ComCall(11, this, "int*", plMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDirection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_direction
     */
    get_Direction(pDirection) {
        result := ComCall(12, this, "int*", pDirection, "HRESULT")
        return result
    }
}
