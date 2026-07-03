#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMOpenProgress interface reports the progress of a file-open operation and enables the application to cancel the operation.Filters that open files over a network can expose this interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamopenprogress
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMOpenProgress extends IUnknown {
    /**
     * The interface identifier for IAMOpenProgress
     * @type {Guid}
     */
    static IID := Guid("{8e1c39a1-de53-11cf-aa63-0080c744528d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMOpenProgress interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryProgress  : IntPtr
        AbortOperation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMOpenProgress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The QueryProgress method retrieves the progress of the file-open operation.
     * @param {Pointer<Integer>} pllTotal Pointer to a variable that receives the length of the entire file, in bytes.
     * @param {Pointer<Integer>} pllCurrent Pointer to a variable that receives the length of the downloaded portion of the file, in bytes.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_S_ESTIMATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The returned values are estimates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamopenprogress-queryprogress
     */
    QueryProgress(pllTotal, pllCurrent) {
        pllTotalMarshal := pllTotal is VarRef ? "int64*" : "ptr"
        pllCurrentMarshal := pllCurrent is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, pllTotalMarshal, pllTotal, pllCurrentMarshal, pllCurrent, "HRESULT")
        return result
    }

    /**
     * The AbortOperation method cancels the file-open operation.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamopenprogress-abortoperation
     */
    AbortOperation() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMOpenProgress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryProgress := CallbackCreate(GetMethod(implObj, "QueryProgress"), flags, 3)
        this.vtbl.AbortOperation := CallbackCreate(GetMethod(implObj, "AbortOperation"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryProgress)
        CallbackFree(this.vtbl.AbortOperation)
    }
}
