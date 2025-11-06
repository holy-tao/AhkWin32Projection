#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_name
     */
    get_Name() {
        ppName := BSTR()
        result := ComCall(7, this, "ptr", ppName, "HRESULT")
        return ppName
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_state
     */
    get_State() {
        result := ComCall(8, this, "int*", &pTerminalState := 0, "HRESULT")
        return pTerminalState
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_terminaltype
     */
    get_TerminalType() {
        result := ComCall(9, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_terminalclass
     */
    get_TerminalClass() {
        ppTerminalClass := BSTR()
        result := ComCall(10, this, "ptr", ppTerminalClass, "HRESULT")
        return ppTerminalClass
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_mediatype
     */
    get_MediaType() {
        result := ComCall(11, this, "int*", &plMediaType := 0, "HRESULT")
        return plMediaType
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminal-get_direction
     */
    get_Direction() {
        result := ComCall(12, this, "int*", &pDirection := 0, "HRESULT")
        return pDirection
    }
}
