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
     * The ITfCandidateListUIElement::GetUpdatedFlags method returns the flag that tells which part of this element was updated.
     * @returns {Integer} [out] a pointer to receive the flags that is a combination of the following bits:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_CLUIE_DOCUMENTMGR"></a><a id="tf_cluie_documentmgr"></a><dl>
     * <dt><b>TF_CLUIE_DOCUMENTMGR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target document manager was changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_CLUIE_COUNT"></a><a id="tf_cluie_count"></a><dl>
     * <dt><b>TF_CLUIE_COUNT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The count of the candidate string was changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_CLUIE_SELECTION"></a><a id="tf_cluie_selection"></a><dl>
     * <dt><b>TF_CLUIE_SELECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The selection of the candidate was changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_CLUIE_STRING"></a><a id="tf_cluie_string"></a><dl>
     * <dt><b>TF_CLUIE_STRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some strings in the list were changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_CLUIE_PAGEINDEX"></a><a id="tf_cluie_pageindex"></a><dl>
     * <dt><b>TF_CLUIE_PAGEINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current page index or some page index was changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_CLUIE_CURRENTPAGE"></a><a id="tf_cluie_currentpage"></a><dl>
     * <dt><b>TF_CLUIE_CURRENTPAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The page was changed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcandidatelistuielement-getupdatedflags
     */
    GetUpdatedFlags() {
        result := ComCall(7, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * The ITfCandidateListUIElement::GetDocumentMgr method returns the target document manager of this UI.
     * @returns {ITfDocumentMgr} [out] A pointer to receive <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfdocumentmgr">ITfDocumentMgr</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcandidatelistuielement-getdocumentmgr
     */
    GetDocumentMgr() {
        result := ComCall(8, this, "ptr*", &ppdim := 0, "HRESULT")
        return ITfDocumentMgr(ppdim)
    }

    /**
     * The ITfCandidateListUIElement::GetCount method returns the count of the candidate strings.
     * @returns {Integer} [out] A pointer to receive a count of the candidate strings.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcandidatelistuielement-getcount
     */
    GetCount() {
        result := ComCall(9, this, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }

    /**
     * The ITfCandidateListUIElement::GetSelection method returns the current selection of the candidate list.
     * @returns {Integer} [out] A pointer to receive an index of the current selected candidate string.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcandidatelistuielement-getselection
     */
    GetSelection() {
        result := ComCall(10, this, "uint*", &puIndex := 0, "HRESULT")
        return puIndex
    }

    /**
     * The ITfCandidateListUIElement::GetString method returns the string of the index.
     * @param {Integer} uIndex [in] An index of the string to obtain.
     * @returns {BSTR} [out] A pointer to BSTR for the candidate string of the index.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcandidatelistuielement-getstring
     */
    GetString(uIndex) {
        pstr := BSTR()
        result := ComCall(11, this, "uint", uIndex, "ptr", pstr, "HRESULT")
        return pstr
    }

    /**
     * The ITfCandidateListUIElement::GetPageIndex method returns the page index of the list.
     * @param {Pointer<Integer>} pIndex [out] A pointer that receives an array of the indexes that each page starts from. This can be <b>NULL</b>. The caller calls this method with <b>NULL</b> for this parameter first to get the number of pages in <i>puPageCnt</i> and allocates the buffer to receive indexes for all pages.
     * @param {Integer} uSize [in] A buffer size of <i>pIndex</i>.
     * @param {Pointer<Integer>} puPageCnt [out] A pointer to receive the page count.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcandidatelistuielement-getpageindex
     */
    GetPageIndex(pIndex, uSize, puPageCnt) {
        pIndexMarshal := pIndex is VarRef ? "uint*" : "ptr"
        puPageCntMarshal := puPageCnt is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pIndexMarshal, pIndex, "uint", uSize, puPageCntMarshal, puPageCnt, "HRESULT")
        return result
    }

    /**
     * The ITfCandidateListUIElement::SetPageIndex method sets the page index.
     * @param {Pointer<Integer>} pIndex [in] A pointer to an array of the indexes that each page starts from.
     * @param {Integer} uPageCnt [in] A page count. The size of the pIndex buffer.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcandidatelistuielement-setpageindex
     */
    SetPageIndex(pIndex, uPageCnt) {
        pIndexMarshal := pIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pIndexMarshal, pIndex, "uint", uPageCnt, "HRESULT")
        return result
    }

    /**
     * The ITfCandidateListUIElement::GetCurrentPage method returns the current page.
     * @returns {Integer} [in] A pointer to receive the current page index.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcandidatelistuielement-getcurrentpage
     */
    GetCurrentPage() {
        result := ComCall(14, this, "uint*", &puPage := 0, "HRESULT")
        return puPage
    }
}
