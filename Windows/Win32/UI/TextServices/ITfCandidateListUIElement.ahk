#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfUIElement.ahk

/**
 * The ITfCandidateListUIElement interface is implemented by a text service that has the candidate list UI.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcandidatelistuielement
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfCandidateListUIElement extends ITfUIElement{
    /**
     * The interface identifier for ITfCandidateListUIElement
     * @type {Guid}
     */
    static IID => Guid("{ea1ea138-19df-11d7-a6d2-00065b84435c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetUpdatedFlags(pdwFlags) {
        result := ComCall(7, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfDocumentMgr>} ppdim 
     * @returns {HRESULT} 
     */
    GetDocumentMgr(ppdim) {
        result := ComCall(8, this, "ptr", ppdim, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puCount 
     * @returns {HRESULT} 
     */
    GetCount(puCount) {
        result := ComCall(9, this, "uint*", puCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puIndex 
     * @returns {HRESULT} 
     */
    GetSelection(puIndex) {
        result := ComCall(10, this, "uint*", puIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<BSTR>} pstr 
     * @returns {HRESULT} 
     */
    GetString(uIndex, pstr) {
        result := ComCall(11, this, "uint", uIndex, "ptr", pstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pIndex 
     * @param {Integer} uSize 
     * @param {Pointer<UInt32>} puPageCnt 
     * @returns {HRESULT} 
     */
    GetPageIndex(pIndex, uSize, puPageCnt) {
        result := ComCall(12, this, "uint*", pIndex, "uint", uSize, "uint*", puPageCnt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pIndex 
     * @param {Integer} uPageCnt 
     * @returns {HRESULT} 
     */
    SetPageIndex(pIndex, uPageCnt) {
        result := ComCall(13, this, "uint*", pIndex, "uint", uPageCnt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puPage 
     * @returns {HRESULT} 
     */
    GetCurrentPage(puPage) {
        result := ComCall(14, this, "uint*", puPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
