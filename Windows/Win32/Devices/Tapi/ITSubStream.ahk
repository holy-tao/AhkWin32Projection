#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * An ITSubStream is a component of an ITStream, and gives an application finer control over the media streaming.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itsubstream
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITSubStream extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITSubStream
     * @type {Guid}
     */
    static IID => Guid("{ee3bd608-3868-11d2-a045-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartSubStream", "PauseSubStream", "StopSubStream", "SelectTerminal", "UnselectTerminal", "EnumerateTerminals", "get_Terminals", "get_Stream"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstream-startsubstream
     */
    StartSubStream() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstream-pausesubstream
     */
    PauseSubStream() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstream-stopsubstream
     */
    StopSubStream() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITTerminal} pTerminal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstream-selectterminal
     */
    SelectTerminal(pTerminal) {
        result := ComCall(10, this, "ptr", pTerminal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITTerminal} pTerminal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstream-unselectterminal
     */
    UnselectTerminal(pTerminal) {
        result := ComCall(11, this, "ptr", pTerminal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTerminal>} ppEnumTerminal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstream-enumerateterminals
     */
    EnumerateTerminals(ppEnumTerminal) {
        result := ComCall(12, this, "ptr*", ppEnumTerminal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pTerminals 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstream-get_terminals
     */
    get_Terminals(pTerminals) {
        result := ComCall(13, this, "ptr", pTerminals, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITStream>} ppITStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstream-get_stream
     */
    get_Stream(ppITStream) {
        result := ComCall(14, this, "ptr*", ppITStream, "HRESULT")
        return result
    }
}
