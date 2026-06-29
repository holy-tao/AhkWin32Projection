#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDebugDocumentContext.ahk" { IDebugDocumentContext }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IRemoteDebugCriticalErrorEvent110 extends IUnknown {
    /**
     * The interface identifier for IRemoteDebugCriticalErrorEvent110
     * @type {Guid}
     */
    static IID := Guid("{2f69c611-6b14-47e8-9260-4bb7c52f504b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRemoteDebugCriticalErrorEvent110 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetErrorInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRemoteDebugCriticalErrorEvent110.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Obtains the error information pointer set by the previous call to SetErrorInfo in the current logical thread.
     * @remarks
     * This function returns a pointer to the most recently set <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ierrorinfo">IErrorInfo</a> pointer in the current logical thread. It transfers ownership of the error object to the caller, and clears the error state for the thread.
     * 
     * Making a COM call that goes through a proxy-stub will clear any existing error object for the calling thread. A called object should not make any such calls after calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-seterrorinfo">SetErrorInfo</a> and before returning. The caller should not make any such calls after the call returns and before calling <b>GetErrorInfo</b>. As a rule of thumb, an interface method should return as soon as possible after calling <b>SetErrorInfo</b>, and the caller should call <b>GetErrorInfo</b> as soon as possible after the call returns.
     * @param {Pointer<BSTR>} pbstrSource 
     * @param {Pointer<Integer>} pMessageId 
     * @param {Pointer<BSTR>} pbstrMessage 
     * @param {Pointer<IDebugDocumentContext>} ppLocation 
     * @returns {HRESULT} This function can return one of these values.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was no error object to return.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-geterrorinfo
     */
    GetErrorInfo(pbstrSource, pMessageId, pbstrMessage, ppLocation) {
        pMessageIdMarshal := pMessageId is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, BSTR.Ptr, pbstrSource, pMessageIdMarshal, pMessageId, BSTR.Ptr, pbstrMessage, IDebugDocumentContext.Ptr, ppLocation, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRemoteDebugCriticalErrorEvent110.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetErrorInfo := CallbackCreate(GetMethod(implObj, "GetErrorInfo"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetErrorInfo)
    }
}
