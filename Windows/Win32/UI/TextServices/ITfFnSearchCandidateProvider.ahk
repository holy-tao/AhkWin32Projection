#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfCandidateList.ahk" { ITfCandidateList }
#Import ".\ITfFunction.ahk" { ITfFunction }

/**
 * Enables an integrated search experience in an Input Method Editor (IME).
 * @remarks
 * Implement the <b>ITfFnSearchCandidateProvider</b> interface in your Input Method Editor (IME) to enable an integrated search experience. Implementing this interface enables searches with meaningful results to begin before IME input has been completed, by providing a set of possible IME conversion candidates for a given input string.  Apps can use this interface to obtain IME conversions for a string, so the <b>ITfFnSearchCandidateProvider</b> interface, along with <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nn-ctffunc-itffngetlinguisticalternates">ITfFnGetLinguisticAlternates</a>, provides a TSF-based replacement for the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immgetconversionlista">ImmGetConversionList</a> function.  Typically IMEs implement either <b>ITfFnGetLinguisticAlternates</b> or <b>ITfFnSearchCandidateProvider</b> (or neither).
 * 
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr-getfunctionprovider">GetFunctionProvider</a> with the CLSID of a text service to get an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itffunctionprovider">ITfFunctionProvider</a> instance.  Use the following call to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itffunctionprovider-getfunction">ITfFunctionProvider::GetFunction</a> method to get the <b>ITfFnSearchCandidateProvider</b> interface pointer.
 * 
 * <c>ITfFunctionProvider::GetFunction(GUID_NULL, IID_ITfFnSearchCandidateProvider, &amp;pSearchCandidate)</c>
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itffnsearchcandidateprovider
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfFnSearchCandidateProvider extends ITfFunction {
    /**
     * The interface identifier for ITfFnSearchCandidateProvider
     * @type {Guid}
     */
    static IID := Guid("{87a2ad8f-f27b-4920-8501-67602280175d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfFnSearchCandidateProvider interfaces
    */
    struct Vtbl extends ITfFunction.Vtbl {
        GetSearchCandidates : IntPtr
        SetResult           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfFnSearchCandidateProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a list of conversion candidates for a given string without generating any IME-related messages or events.
     * @param {BSTR} bstrQuery A string that specifies the reading string that the text service attempts to convert.
     * @param {BSTR} bstrApplicationId App-specified string that enables a text service to optionally provide different candidates to different apps or contexts based on input history. You can pass an empty <b>BSTR</b>, L””, for a generic context.
     * @returns {ITfCandidateList} An <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nn-ctffunc-itfcandidatelist">ITfCandidateList</a> that receives the requested candidate data.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnsearchcandidateprovider-getsearchcandidates
     */
    GetSearchCandidates(bstrQuery, bstrApplicationId) {
        bstrQuery := bstrQuery is String ? BSTR.Alloc(bstrQuery).Value : bstrQuery
        bstrApplicationId := bstrApplicationId is String ? BSTR.Alloc(bstrApplicationId).Value : bstrApplicationId

        result := ComCall(4, this, BSTR, bstrQuery, BSTR, bstrApplicationId, "ptr*", &pplist := 0, "HRESULT")
        return ITfCandidateList(pplist)
    }

    /**
     * Provides a text Service or IME with history data when a candidate is chosen by the user.
     * @remarks
     * Implementing and calling the <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nf-ctffunc-itfcandidatelist-setresult">SetResult</a> method is optional.
     * 
     * A text service or IME can return <b>E_PENDING</b> if no corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nf-ctffunc-itffnsearchcandidateprovider-getsearchcandidates">GetSearchCandidates</a> has been made yet for the value of <i>bstrQuery</i>.
     * @param {BSTR} bstrQuery The reading string for the text service or IME to convert.
     * @param {BSTR} bstrApplicationID App-specified string that enables a text service or IME to optionally provide different candidates to different apps or contexts based on input history. You can pass an empty <b>BSTR</b>, L””, for a generic context.
     * @param {BSTR} bstrResult A string that represents the candidate string chosen by the user.  It should be one of the candidate string values returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nf-ctffunc-itffnsearchcandidateprovider-getsearchcandidates">GetSearchCandidates</a> method.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnsearchcandidateprovider-setresult
     */
    SetResult(bstrQuery, bstrApplicationID, bstrResult) {
        bstrQuery := bstrQuery is String ? BSTR.Alloc(bstrQuery).Value : bstrQuery
        bstrApplicationID := bstrApplicationID is String ? BSTR.Alloc(bstrApplicationID).Value : bstrApplicationID
        bstrResult := bstrResult is String ? BSTR.Alloc(bstrResult).Value : bstrResult

        result := ComCall(5, this, BSTR, bstrQuery, BSTR, bstrApplicationID, BSTR, bstrResult, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfFnSearchCandidateProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSearchCandidates := CallbackCreate(GetMethod(implObj, "GetSearchCandidates"), flags, 4)
        this.vtbl.SetResult := CallbackCreate(GetMethod(implObj, "SetResult"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSearchCandidates)
        CallbackFree(this.vtbl.SetResult)
    }
}
