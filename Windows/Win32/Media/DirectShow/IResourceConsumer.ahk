#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IResourceConsumer interface provides a callback mechanism for objects using the IResourceManager interface.An object must implement IResourceConsumer if it uses the IResourceManager interface to request resources from the filter graph manager.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iresourceconsumer
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IResourceConsumer extends IUnknown {
    /**
     * The interface identifier for IResourceConsumer
     * @type {Guid}
     */
    static IID := Guid("{56a868ad-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IResourceConsumer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AcquireResource : IntPtr
        ReleaseResource : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IResourceConsumer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The AcquireResource method notifies the resource consumer that a resource might be acquired.
     * @param {Integer} idResource Resource identifier of the resource to be acquired.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
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
     * Consumer has successfully acquired the resource.
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
     * Consumer has not acquired the resource but will use <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iresourcemanager-notifyacquire">IResourceManager::NotifyAcquire</a> when it does.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_S_RESOURCE_NOT_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Consumer no longer needs the resource.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The method may return some other error code, if the consumer fails to acquire the resource.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iresourceconsumer-acquireresource
     */
    AcquireResource(idResource) {
        result := ComCall(3, this, "int", idResource, "HRESULT")
        return result
    }

    /**
     * The ReleaseResource method requests the resource consumer to release the specified resource.
     * @param {Integer} idResource Resource identifier to be released.
     * @returns {HRESULT} Returns S_OK if the consumer has released it and requires it again when it becomes available, or S_FALSE if the consumer has not released it but will use <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iresourcemanager-notifyrelease">IResourceManager::NotifyRelease</a> when it does.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iresourceconsumer-releaseresource
     */
    ReleaseResource(idResource) {
        result := ComCall(4, this, "int", idResource, "HRESULT")
        return result
    }

    Query(iid) {
        if (IResourceConsumer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AcquireResource := CallbackCreate(GetMethod(implObj, "AcquireResource"), flags, 2)
        this.vtbl.ReleaseResource := CallbackCreate(GetMethod(implObj, "ReleaseResource"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AcquireResource)
        CallbackFree(this.vtbl.ReleaseResource)
    }
}
