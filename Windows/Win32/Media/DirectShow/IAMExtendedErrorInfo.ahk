#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IAMExtendedErrorInfo interface is used to obtain error information. Note  This interface is not implemented by any default components in DirectShow. .
 * @remarks
 * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
 * 
 * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
 * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nn-qnetwork-iamextendederrorinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMExtendedErrorInfo extends IDispatch {
    /**
     * The interface identifier for IAMExtendedErrorInfo
     * @type {Guid}
     */
    static IID := Guid("{fa2aa8f6-8b62-11d0-a520-000000000000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMExtendedErrorInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_HasError         : IntPtr
        get_ErrorDescription : IntPtr
        get_ErrorCode        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMExtendedErrorInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    HasError {
        get => this.get_HasError()
    }

    /**
     */
    ErrorDescription {
        get => this.get_ErrorDescription()
    }

    /**
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * The get_HasError method queries whether an error occurred.
     * @remarks
     * If <i>pHasError</i> is true, you can call the <b>get_ErrorCode</b> and <b>get_ErrorDescription</b> methods to determine the nature of the error.
     * @param {Pointer<VARIANT_BOOL>} pHasError 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendederrorinfo-get_haserror
     */
    get_HasError(pHasError) {
        pHasErrorMarshal := pHasError is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, pHasErrorMarshal, pHasError, "HRESULT")
        return result
    }

    /**
     * The get_ErrorDescription method retrieves the extended error description.
     * @remarks
     * The caller must release the returned <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @param {Pointer<BSTR>} pbstrErrorDescription Pointer to a variable that receives the error description.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendederrorinfo-get_errordescription
     */
    get_ErrorDescription(pbstrErrorDescription) {
        result := ComCall(8, this, BSTR.Ptr, pbstrErrorDescription, "HRESULT")
        return result
    }

    /**
     * The get_ErrorCode method retrieves the current error code.
     * @param {Pointer<Integer>} pErrorCode Pointer to a variable that receives the error code.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendederrorinfo-get_errorcode
     */
    get_ErrorCode(pErrorCode) {
        pErrorCodeMarshal := pErrorCode is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pErrorCodeMarshal, pErrorCode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMExtendedErrorInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_HasError := CallbackCreate(GetMethod(implObj, "get_HasError"), flags, 2)
        this.vtbl.get_ErrorDescription := CallbackCreate(GetMethod(implObj, "get_ErrorDescription"), flags, 2)
        this.vtbl.get_ErrorCode := CallbackCreate(GetMethod(implObj, "get_ErrorCode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_HasError)
        CallbackFree(this.vtbl.get_ErrorDescription)
        CallbackFree(this.vtbl.get_ErrorCode)
    }
}
