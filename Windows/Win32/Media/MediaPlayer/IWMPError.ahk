#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPErrorItem.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPError interface provides methods for accessing a collection of IWMPErrorItem pointers.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmperror
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPError extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["clearErrorQueue", "get_errorCount", "get_item", "webHelp"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmperror-clearerrorqueue
     */
    clearErrorQueue() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plNumErrors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmperror-get_errorcount
     */
    get_errorCount(plNumErrors) {
        plNumErrorsMarshal := plNumErrors is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plNumErrorsMarshal, plNumErrors, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {IWMPErrorItem} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmperror-get_item
     */
    get_item(dwIndex) {
        result := ComCall(9, this, "int", dwIndex, "ptr*", &ppErrorItem := 0, "HRESULT")
        return IWMPErrorItem(ppErrorItem)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmperror-webhelp
     */
    webHelp() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
