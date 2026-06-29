#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfFunctionProvider interface is implemented by an application or text service to provide various function objects.
 * @remarks
 * A function provider is registered by calling <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsourcesingle-advisesinglesink">ITFSourceSingle::AdviseSingleSink</a> with IID_ITfFunctionProvider when the text service is activated. The text service should unregister its function provider with <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsourcesingle-unadvisesinglesink">ITFSourceSingle::UnadviseSingleSink</a> when it is deactivated.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itffunctionprovider
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfFunctionProvider extends IUnknown {
    /**
     * The interface identifier for ITfFunctionProvider
     * @type {Guid}
     */
    static IID := Guid("{101d6610-0990-11d3-8df0-00105a2799b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfFunctionProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetType        : IntPtr
        GetDescription : IntPtr
        GetFunction    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfFunctionProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfFunctionProvider::GetType method
     * @returns {Guid} Pointer to a GUID value that receives the type identifier of the function provider.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itffunctionprovider-gettype
     */
    GetType() {
        pguid := Guid()
        result := ComCall(3, this, Guid.Ptr, pguid, "HRESULT")
        return pguid
    }

    /**
     * ITfFunctionProvider::GetDescription method
     * @returns {BSTR} Pointer to a BSTR that receives the description string. This value must be allocated using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The caller must this memory using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itffunctionprovider-getdescription
     */
    GetDescription() {
        pbstrDesc := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pbstrDesc, "HRESULT")
        return pbstrDesc
    }

    /**
     * ITfFunctionProvider::GetFunction method
     * @param {Pointer<Guid>} rguid Contains a GUID value that identifies the function group that the requested function belongs to. This value can be GUID_NULL.
     * @param {Pointer<Guid>} riid Contains an interface identifier that identifies the requested function within the group specified by <i>rguid</i>. This value can be specified by the application, text service, or one of the IID_ITfFn* values.
     * @returns {IUnknown} Pointer to an <b>IUnknown</b> interface pointer that receives the requested function interface.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itffunctionprovider-getfunction
     */
    GetFunction(rguid, riid) {
        result := ComCall(5, this, Guid.Ptr, rguid, Guid.Ptr, riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    Query(iid) {
        if (ITfFunctionProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
        this.vtbl.GetFunction := CallbackCreate(GetMethod(implObj, "GetFunction"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.GetFunction)
    }
}
