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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUpdatedFlags", "GetDocumentMgr", "GetCount", "GetSelection", "GetString", "GetPageIndex", "SetPageIndex", "GetCurrentPage"]

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getupdatedflags
     */
    GetUpdatedFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITfDocumentMgr>} ppdim 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getdocumentmgr
     */
    GetDocumentMgr(ppdim) {
        result := ComCall(8, this, "ptr*", ppdim, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getcount
     */
    GetCount(puCount) {
        puCountMarshal := puCount is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, puCountMarshal, puCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getselection
     */
    GetSelection(puIndex) {
        puIndexMarshal := puIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, puIndexMarshal, puIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<BSTR>} pstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getstring
     */
    GetString(uIndex, pstr) {
        result := ComCall(11, this, "uint", uIndex, "ptr", pstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pIndex 
     * @param {Integer} uSize 
     * @param {Pointer<Integer>} puPageCnt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getpageindex
     */
    GetPageIndex(pIndex, uSize, puPageCnt) {
        pIndexMarshal := pIndex is VarRef ? "uint*" : "ptr"
        puPageCntMarshal := puPageCnt is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pIndexMarshal, pIndex, "uint", uSize, puPageCntMarshal, puPageCnt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pIndex 
     * @param {Integer} uPageCnt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-setpageindex
     */
    SetPageIndex(pIndex, uPageCnt) {
        pIndexMarshal := pIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pIndexMarshal, pIndex, "uint", uPageCnt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getcurrentpage
     */
    GetCurrentPage(puPage) {
        puPageMarshal := puPage is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, puPageMarshal, puPage, "HRESULT")
        return result
    }
}
