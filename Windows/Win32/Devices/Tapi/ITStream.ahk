#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITStream interfaces expose methods that allow an application to retrieve information on a stream; to start, pause, or stop the stream; to select or unselect terminals on a stream; and to obtain a list of terminals selected on the stream.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itstream
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITStream extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITStream
     * @type {Guid}
     */
    static IID => Guid("{ee3bd605-3868-11d2-a045-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaType", "get_Direction", "get_Name", "StartStream", "PauseStream", "StopStream", "SelectTerminal", "UnselectTerminal", "EnumerateTerminals", "get_Terminals"]

    /**
     * 
     * @param {Pointer<Integer>} plMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstream-get_mediatype
     */
    get_MediaType(plMediaType) {
        result := ComCall(7, this, "int*", plMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTD 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstream-get_direction
     */
    get_Direction(pTD) {
        result := ComCall(8, this, "int*", pTD, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstream-get_name
     */
    get_Name(ppName) {
        result := ComCall(9, this, "ptr", ppName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstream-startstream
     */
    StartStream() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstream-pausestream
     */
    PauseStream() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstream-stopstream
     */
    StopStream() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITTerminal} pTerminal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstream-selectterminal
     */
    SelectTerminal(pTerminal) {
        result := ComCall(13, this, "ptr", pTerminal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITTerminal} pTerminal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstream-unselectterminal
     */
    UnselectTerminal(pTerminal) {
        result := ComCall(14, this, "ptr", pTerminal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTerminal>} ppEnumTerminal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstream-enumerateterminals
     */
    EnumerateTerminals(ppEnumTerminal) {
        result := ComCall(15, this, "ptr*", ppEnumTerminal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pTerminals 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstream-get_terminals
     */
    get_Terminals(pTerminals) {
        result := ComCall(16, this, "ptr", pTerminals, "HRESULT")
        return result
    }
}
