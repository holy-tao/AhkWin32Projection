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
        result := ComCall(7, this, "uint*", pdwFlags, "HRESULT")
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
        result := ComCall(9, this, "uint*", puCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getselection
     */
    GetSelection(puIndex) {
        result := ComCall(10, this, "uint*", puIndex, "HRESULT")
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
        result := ComCall(12, this, "uint*", pIndex, "uint", uSize, "uint*", puPageCnt, "HRESULT")
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
        result := ComCall(13, this, "uint*", pIndex, "uint", uPageCnt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getcurrentpage
     */
    GetCurrentPage(puPage) {
        result := ComCall(14, this, "uint*", puPage, "HRESULT")
        return result
    }
}
