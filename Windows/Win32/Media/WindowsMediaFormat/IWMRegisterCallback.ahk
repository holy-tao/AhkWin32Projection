#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMStatusCallback.ahk" { IWMStatusCallback }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMRegisterCallback interface enables the application to get status messages from a sink object.By default, the writer object does not send the application any status messages from the sink object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmregistercallback
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMRegisterCallback extends IUnknown {
    /**
     * The interface identifier for IWMRegisterCallback
     * @type {Guid}
     */
    static IID := Guid("{cf4b1f99-4de2-4e49-a363-252740d99bc1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMRegisterCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Advise   : IntPtr
        Unadvise : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMRegisterCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Advise method registers the application to receive status messages from the sink object.
     * @remarks
     * The sink object sends status messages to the application by calling the application's <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> method.
     * 
     * When the application has finished using the sink object, use the <b>Unadvise</b> method to break the connection with the sink object.
     * @param {IWMStatusCallback} pCallback Pointer to the application's <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstatuscallback">IWMStatusCallback</a> interface. The application must implement this interface.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This is passed to the application in calls to <b>OnStatus</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistercallback-advise
     */
    Advise(pCallback, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pCallback, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * The Unadvise method unregisters the application's IWMStatusCallback callback interface. Call this method when the application has finished using the sink object. It notifies the object to stop sending status events to the application.
     * @param {IWMStatusCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstatuscallback">IWMStatusCallback</a> interface of an object.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistercallback-unadvise
     */
    Unadvise(pCallback, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", pCallback, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMRegisterCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Advise := CallbackCreate(GetMethod(implObj, "Advise"), flags, 3)
        this.vtbl.Unadvise := CallbackCreate(GetMethod(implObj, "Unadvise"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Advise)
        CallbackFree(this.vtbl.Unadvise)
    }
}
