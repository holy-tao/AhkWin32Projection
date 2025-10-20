#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPError interface provides methods for accessing a collection of IWMPErrorItem pointers.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmperror
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPError extends IDispatch{
    /**
     * The interface identifier for IWMPError
     * @type {Guid}
     */
    static IID => Guid("{a12dcf7d-14ab-4c1b-a8cd-63909f06025b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @returns {HRESULT} 
     */
    clearErrorQueue() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plNumErrors 
     * @returns {HRESULT} 
     */
    get_errorCount(plNumErrors) {
        result := ComCall(8, this, "int*", plNumErrors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IWMPErrorItem>} ppErrorItem 
     * @returns {HRESULT} 
     */
    get_item(dwIndex, ppErrorItem) {
        result := ComCall(9, this, "int", dwIndex, "ptr", ppErrorItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    webHelp() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
