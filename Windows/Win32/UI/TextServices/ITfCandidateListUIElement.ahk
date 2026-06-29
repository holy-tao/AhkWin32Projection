#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfUIElement.ahk" { ITfUIElement }
#Import ".\ITfDocumentMgr.ahk" { ITfDocumentMgr }

/**
 * The ITfCandidateListUIElement interface is implemented by a text service that has the candidate list UI.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcandidatelistuielement
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfCandidateListUIElement extends ITfUIElement {
    /**
     * The interface identifier for ITfCandidateListUIElement
     * @type {Guid}
     */
    static IID := Guid("{ea1ea138-19df-11d7-a6d2-00065b84435c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfCandidateListUIElement interfaces
    */
    struct Vtbl extends ITfUIElement.Vtbl {
        GetUpdatedFlags : IntPtr
        GetDocumentMgr  : IntPtr
        GetCount        : IntPtr
        GetSelection    : IntPtr
        GetString       : IntPtr
        GetPageIndex    : IntPtr
        SetPageIndex    : IntPtr
        GetCurrentPage  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfCandidateListUIElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getupdatedflags
     */
    GetUpdatedFlags() {
        result := ComCall(7, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * The ITfCandidateListUIElement::GetDocumentMgr method returns the target document manager of this UI.
     * @returns {ITfDocumentMgr} [out] A pointer to receive <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfdocumentmgr">ITfDocumentMgr</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getdocumentmgr
     */
    GetDocumentMgr() {
        result := ComCall(8, this, "ptr*", &ppdim := 0, "HRESULT")
        return ITfDocumentMgr(ppdim)
    }

    /**
     * The ITfCandidateListUIElement::GetCount method returns the count of the candidate strings.
     * @returns {Integer} [out] A pointer to receive a count of the candidate strings.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getcount
     */
    GetCount() {
        result := ComCall(9, this, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }

    /**
     * The ITfCandidateListUIElement::GetSelection method returns the current selection of the candidate list.
     * @returns {Integer} [out] A pointer to receive an index of the current selected candidate string.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getselection
     */
    GetSelection() {
        result := ComCall(10, this, "uint*", &puIndex := 0, "HRESULT")
        return puIndex
    }

    /**
     * The ITfCandidateListUIElement::GetString method returns the string of the index.
     * @param {Integer} uIndex [in] An index of the string to obtain.
     * @returns {BSTR} [out] A pointer to BSTR for the candidate string of the index.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getstring
     */
    GetString(uIndex) {
        _pstr := BSTR.Owned()
        result := ComCall(11, this, "uint", uIndex, BSTR.Ptr, _pstr, "HRESULT")
        return _pstr
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getpageindex
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-setpageindex
     */
    SetPageIndex(pIndex, uPageCnt) {
        pIndexMarshal := pIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pIndexMarshal, pIndex, "uint", uPageCnt, "HRESULT")
        return result
    }

    /**
     * The ITfCandidateListUIElement::GetCurrentPage method returns the current page.
     * @returns {Integer} [in] A pointer to receive the current page index.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielement-getcurrentpage
     */
    GetCurrentPage() {
        result := ComCall(14, this, "uint*", &puPage := 0, "HRESULT")
        return puPage
    }

    Query(iid) {
        if (ITfCandidateListUIElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetUpdatedFlags := CallbackCreate(GetMethod(implObj, "GetUpdatedFlags"), flags, 2)
        this.vtbl.GetDocumentMgr := CallbackCreate(GetMethod(implObj, "GetDocumentMgr"), flags, 2)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetSelection := CallbackCreate(GetMethod(implObj, "GetSelection"), flags, 2)
        this.vtbl.GetString := CallbackCreate(GetMethod(implObj, "GetString"), flags, 3)
        this.vtbl.GetPageIndex := CallbackCreate(GetMethod(implObj, "GetPageIndex"), flags, 4)
        this.vtbl.SetPageIndex := CallbackCreate(GetMethod(implObj, "SetPageIndex"), flags, 3)
        this.vtbl.GetCurrentPage := CallbackCreate(GetMethod(implObj, "GetCurrentPage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetUpdatedFlags)
        CallbackFree(this.vtbl.GetDocumentMgr)
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetSelection)
        CallbackFree(this.vtbl.GetString)
        CallbackFree(this.vtbl.GetPageIndex)
        CallbackFree(this.vtbl.SetPageIndex)
        CallbackFree(this.vtbl.GetCurrentPage)
    }
}
