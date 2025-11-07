#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfDocumentMgr.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getupdatedflags
     */
    GetUpdatedFlags() {
        result := ComCall(7, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * 
     * @returns {ITfDocumentMgr} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getdocumentmgr
     */
    GetDocumentMgr() {
        result := ComCall(8, this, "ptr*", &ppdim := 0, "HRESULT")
        return ITfDocumentMgr(ppdim)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getcount
     */
    GetCount() {
        result := ComCall(9, this, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getselection
     */
    GetSelection() {
        result := ComCall(10, this, "uint*", &puIndex := 0, "HRESULT")
        return puIndex
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getstring
     */
    GetString(uIndex) {
        pstr := BSTR()
        result := ComCall(11, this, "uint", uIndex, "ptr", pstr, "HRESULT")
        return pstr
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getcurrentpage
     */
    GetCurrentPage() {
        result := ComCall(14, this, "uint*", &puPage := 0, "HRESULT")
        return puPage
    }
}
