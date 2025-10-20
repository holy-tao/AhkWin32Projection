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
     * 
     * @param {Pointer<Int32>} plMediaType 
     * @returns {HRESULT} 
     */
    get_MediaType(plMediaType) {
        result := ComCall(7, this, "int*", plMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTD 
     * @returns {HRESULT} 
     */
    get_Direction(pTD) {
        result := ComCall(8, this, "int*", pTD, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppName 
     * @returns {HRESULT} 
     */
    get_Name(ppName) {
        result := ComCall(9, this, "ptr", ppName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartStream() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PauseStream() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopStream() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITTerminal>} pTerminal 
     * @returns {HRESULT} 
     */
    SelectTerminal(pTerminal) {
        result := ComCall(13, this, "ptr", pTerminal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITTerminal>} pTerminal 
     * @returns {HRESULT} 
     */
    UnselectTerminal(pTerminal) {
        result := ComCall(14, this, "ptr", pTerminal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTerminal>} ppEnumTerminal 
     * @returns {HRESULT} 
     */
    EnumerateTerminals(ppEnumTerminal) {
        result := ComCall(15, this, "ptr", ppEnumTerminal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pTerminals 
     * @returns {HRESULT} 
     */
    get_Terminals(pTerminals) {
        result := ComCall(16, this, "ptr", pTerminals, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
