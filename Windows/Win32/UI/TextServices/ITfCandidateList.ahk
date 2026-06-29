#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TfCandidateResult.ahk" { TfCandidateResult }
#Import ".\IEnumTfCandidates.ahk" { IEnumTfCandidates }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITfCandidateString.ahk" { ITfCandidateString }

/**
 * The ITfCandidateList interface is implemented by a text service and is used by the TSF manager or a client (application or other text service) to obtain and manipulate candidate string objects.
 * @remarks
 * When a text service must interpret text before it is inserted into a context, there might be more than one possible interpretation of the text. Speech input is an example of this. If the spoken word is "there", other possible interpretations might be "their" or "they're". The text service will insert the most appropriate text, but there is still some chance of error involved. Text reconversion is the process of allowing the user to select alternate text for the inserted text. The alternate text objects are known as candidates.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itfcandidatelist
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfCandidateList extends IUnknown {
    /**
     * The interface identifier for ITfCandidateList
     * @type {Guid}
     */
    static IID := Guid("{a3ad50fb-9bdb-49e3-a843-6c76520fbf5d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfCandidateList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumCandidates  : IntPtr
        GetCandidate    : IntPtr
        GetCandidateNum : IntPtr
        SetResult       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfCandidateList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfCandidateList::EnumCandidates method
     * @returns {IEnumTfCandidates} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nn-ctffunc-ienumtfcandidates">IEnumTfCandidates</a> interface pointer that receives the enumerator object. The caller must release this interface when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfcandidatelist-enumcandidates
     */
    EnumCandidates() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfCandidates(ppEnum)
    }

    /**
     * ITfCandidateList::GetCandidate method
     * @param {Integer} nIndex Specifies the zero-based index of the candidate string to obtain.
     * @returns {ITfCandidateString} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nn-ctffunc-itfcandidatestring">ITfCandidateString</a> interface pointer that receives the candidate string object. The caller must release this interface when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfcandidatelist-getcandidate
     */
    GetCandidate(nIndex) {
        result := ComCall(4, this, "uint", nIndex, "ptr*", &ppCand := 0, "HRESULT")
        return ITfCandidateString(ppCand)
    }

    /**
     * ITfCandidateList::GetCandidateNum method
     * @returns {Integer} Pointer to a <b>ULONG</b> value that receives the number of candidate string objects in the candidate list.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfcandidatelist-getcandidatenum
     */
    GetCandidateNum() {
        result := ComCall(5, this, "uint*", &pnCnt := 0, "HRESULT")
        return pnCnt
    }

    /**
     * ITfCandidateList::SetResult method
     * @remarks
     * A typical reconversion operation would include the following operations.
     * 
     * <ol>
     * <li>A list of candidates is obtained and displayed to the user in a dialog box.</li>
     * <li>When the user selects a candidate, but before the dialog box is dismissed, <b>ITfCandidateList::SetResult</b> is called with the index of the newly selected candidate and CAND_SELECTED.</li>
     * <li>If a different candidate is selected, <b>ITfCandidateList::SetResult</b> is called agian with the index of the newly selected candidate and CAND_SELECTED.</li>
     * <li>If the user chooses to accept the new candidate, <b>ITfCandidateList::SetResult</b> is called with the index of the currently selected candidate and CAND_FINALIZED.</li>
     * <li>If the user cancels the dialog, <b>ITfCandidateList::SetResult</b> is called with an index of zero and CAND_CANCELED.</li>
     * </ol>
     * @param {Integer} nIndex Specifies the zero-based index of the candidate string to set the result for. This parameter is ignored if <i>imcr</i> contains CAND_CANCELED.
     * @param {TfCandidateResult} imcr Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/ctffunc/ne-ctffunc-tfcandidateresult">TfCandidateResult</a> values that specifies the result of the reconversion operation.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfcandidatelist-setresult
     */
    SetResult(nIndex, imcr) {
        result := ComCall(6, this, "uint", nIndex, TfCandidateResult, imcr, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfCandidateList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumCandidates := CallbackCreate(GetMethod(implObj, "EnumCandidates"), flags, 2)
        this.vtbl.GetCandidate := CallbackCreate(GetMethod(implObj, "GetCandidate"), flags, 3)
        this.vtbl.GetCandidateNum := CallbackCreate(GetMethod(implObj, "GetCandidateNum"), flags, 2)
        this.vtbl.SetResult := CallbackCreate(GetMethod(implObj, "SetResult"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumCandidates)
        CallbackFree(this.vtbl.GetCandidate)
        CallbackFree(this.vtbl.GetCandidateNum)
        CallbackFree(this.vtbl.SetResult)
    }
}
