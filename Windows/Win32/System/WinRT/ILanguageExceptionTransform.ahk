#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRestrictedErrorInfo.ahk" { IRestrictedErrorInfo }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows language projections to make available to the system any and all context from an exception that gets thrown from the context of a catch handler that catches a different exception.
 * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nn-restrictederrorinfo-ilanguageexceptiontransform
 * @namespace Windows.Win32.System.WinRT
 */
export default struct ILanguageExceptionTransform extends IUnknown {
    /**
     * The interface identifier for ILanguageExceptionTransform
     * @type {Guid}
     */
    static IID := Guid("{feb5a271-a6cd-45ce-880a-696706badc65}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILanguageExceptionTransform interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTransformedRestrictedErrorInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILanguageExceptionTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the transformed restricted error info.
     * @remarks
     * <b>GetTransformedRestrictedErrorInfo</b> is generally implemented by a language projection in order to expose to the system any and all context from an exception. Specifically, to expose the information from an exception that was thrown from the context of a catch handler that catches a different exception. The thrown exception is considered to be a “transformation” of the caught exception, which is also considered an inner exception by some projections. This allows a developer to obtain insight into why the original exception, before the transform, occurred.  
     * 
     * 
     * When implemented, the system uses the <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> retrieved from a call to <b>GetTransformedRestrictedErrorInfo</b> to create another linked list of <b>IRestrictedErrorInfo</b> objects. These objects are exposed in as stowed exceptions in the crash dumps in sequence with the stowed exceptions for the propagations captured in <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionerrorinfo2-capturepropagationcontext">CapturePropagationContext</a>. As with the other exceptions, you can traverse and access these objects in the transformation list using <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionerrorinfo2-getpreviouslanguageexceptionerrorinfo">GetPreviousLanguageExceptionErrorInfo</a>.
     * @returns {IRestrictedErrorInfo} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo">IRestrictedErrorInfo</a> object that contains the restricted error info.
     * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptiontransform-gettransformedrestrictederrorinfo
     */
    GetTransformedRestrictedErrorInfo() {
        result := ComCall(3, this, "ptr*", &restrictedErrorInfo := 0, "HRESULT")
        return IRestrictedErrorInfo(restrictedErrorInfo)
    }

    Query(iid) {
        if (ILanguageExceptionTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTransformedRestrictedErrorInfo := CallbackCreate(GetMethod(implObj, "GetTransformedRestrictedErrorInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTransformedRestrictedErrorInfo)
    }
}
