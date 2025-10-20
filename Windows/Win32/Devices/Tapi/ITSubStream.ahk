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
     * 
     * @returns {HRESULT} 
     */
    StartSubStream() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PauseSubStream() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopSubStream() {
        result := ComCall(9, this, "int")
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
        result := ComCall(10, this, "ptr", pTerminal, "int")
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
        result := ComCall(11, this, "ptr", pTerminal, "int")
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
        result := ComCall(12, this, "ptr", ppEnumTerminal, "int")
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
        result := ComCall(13, this, "ptr", pTerminals, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITStream>} ppITStream 
     * @returns {HRESULT} 
     */
    get_Stream(ppITStream) {
        result := ComCall(14, this, "ptr", ppITStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
