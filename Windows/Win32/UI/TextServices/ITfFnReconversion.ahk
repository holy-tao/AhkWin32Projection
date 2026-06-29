#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfRange.ahk" { ITfRange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfCandidateList.ahk" { ITfCandidateList }
#Import ".\ITfFunction.ahk" { ITfFunction }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The ITfFnReconversion interface is implemented by a text service and is used by the TSF manager or a client to support reconversion of text provided by the text service.
 * @remarks
 * When a text service must interpret text before it is inserted into a context, there might be more than one possible interpretation of the text. Speech input is an example of this. If the spoken word is "there", other possible interpretations might be "their" or "they're". The text service will insert the most appropriate text, but there is still some chance of error involved. Text reconversion is the process of allowing the user to select alternate text for the inserted text.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itffnreconversion
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfFnReconversion extends ITfFunction {
    /**
     * The interface identifier for ITfFnReconversion
     * @type {Guid}
     */
    static IID := Guid("{4cea93c0-0a58-11d3-8df0-00105a2799b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfFnReconversion interfaces
    */
    struct Vtbl extends ITfFunction.Vtbl {
        QueryRange      : IntPtr
        GetReconversion : IntPtr
        Reconvert       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfFnReconversion.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ITfFnReconversion::QueryRange method obtains the range of text that the reconversion applies to.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that covers all or part of the text to be reconverted.
     * @param {Pointer<ITfRange>} ppNewRange [in, out] Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> pointer that receives a range object that covers all of text that can be reconverted. If none of the text covered by <i>pRange</i> can be reconverted, this parameters receives NULL. In this case, the method will return S_OK, so the caller must verify that this parameter is not NULL before using the pointer.
     * 
     * When this method is implemented by a text service, this parameter is optional and can be NULL. In this case, the range is not required.
     * 
     * When the TSF manager implementation of this method is called, this parameter is not optional and cannot be NULL.
     * @returns {BOOL} Pointer to a <b>BOOL</b> value that receives zero if none of the text covered by <i>pRange</i> can be reconverted or nonzero otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnreconversion-queryrange
     */
    QueryRange(pRange, ppNewRange) {
        result := ComCall(4, this, "ptr", pRange, ITfRange.Ptr, ppNewRange, BOOL.Ptr, &pfConvertable := 0, "HRESULT")
        return pfConvertable
    }

    /**
     * ITfFnReconversion::GetReconversion method
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that covers the text to be reconverted. This range object is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nf-ctffunc-itffnreconversion-queryrange">ITfFnReconversion::QueryRange</a>.
     * @returns {ITfCandidateList} Pointer to an <b>ITfCandidateList</b> pointer that receives the candidate list object.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnreconversion-getreconversion
     */
    GetReconversion(pRange) {
        result := ComCall(5, this, "ptr", pRange, "ptr*", &ppCandList := 0, "HRESULT")
        return ITfCandidateList(ppCandList)
    }

    /**
     * ITfFnReconversion::Reconvert method
     * @remarks
     * If this method causes some type of user interface to be displayed, such as a dialog box, this method must not wait for the UI to be dismissed before returning.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that covers the text to be reconverted. To obtain this range object call <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nf-ctffunc-itffnreconversion-queryrange">ITfFnReconversion::QueryRange</a>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failure occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnreconversion-reconvert
     */
    Reconvert(pRange) {
        result := ComCall(6, this, "ptr", pRange, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfFnReconversion.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryRange := CallbackCreate(GetMethod(implObj, "QueryRange"), flags, 4)
        this.vtbl.GetReconversion := CallbackCreate(GetMethod(implObj, "GetReconversion"), flags, 3)
        this.vtbl.Reconvert := CallbackCreate(GetMethod(implObj, "Reconvert"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryRange)
        CallbackFree(this.vtbl.GetReconversion)
        CallbackFree(this.vtbl.Reconvert)
    }
}
