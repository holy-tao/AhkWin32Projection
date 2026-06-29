#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IManagedPooledObj.ahk" { IManagedPooledObj }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IObjectControl.ahk" { IObjectControl }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Describes the stub for a managed object.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-imanagedobjectinfo
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IManagedObjectInfo extends IUnknown {
    /**
     * The interface identifier for IManagedObjectInfo
     * @type {Guid}
     */
    static IID := Guid("{1427c51a-4584-49d8-90a0-c50d8086cbe9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IManagedObjectInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIUnknown        : IntPtr
        GetIObjectControl  : IntPtr
        SetInPool          : IntPtr
        SetWrapperStrength : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IManagedObjectInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the IUnknown interface that is associated with the managed object.
     * @returns {IUnknown} A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imanagedobjectinfo-getiunknown
     */
    GetIUnknown() {
        result := ComCall(3, this, "ptr*", &pUnk := 0, "HRESULT")
        return IUnknown(pUnk)
    }

    /**
     * Retrieves the IObjectControl interface that is associated with the managed object.
     * @returns {IObjectControl} A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontrol">IObjectControl</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imanagedobjectinfo-getiobjectcontrol
     */
    GetIObjectControl() {
        result := ComCall(4, this, "ptr*", &pCtrl := 0, "HRESULT")
        return IObjectControl(pCtrl)
    }

    /**
     * Sets whether the managed object belongs to the COM+ object pool.
     * @param {BOOL} bInPool Indicates whether the managed object belongs to the COM+ object pool.
     * @param {IManagedPooledObj} pPooledObj A reference to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-imanagedpooledobj">IManagedPooledObj</a> that describes how this managed object is used in the COM+ object pool.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imanagedobjectinfo-setinpool
     */
    SetInPool(bInPool, pPooledObj) {
        result := ComCall(5, this, BOOL, bInPool, "ptr", pPooledObj, "HRESULT")
        return result
    }

    /**
     * Sets whether the managed object holds a strong or a weak reference to the COM+ context.
     * @param {BOOL} bStrong Indicates whether the managed object holds a strong or a weak reference to the COM+ context. A strong reference keeps the object alive and prevents it from being destroyed during garbage collection.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imanagedobjectinfo-setwrapperstrength
     */
    SetWrapperStrength(bStrong) {
        result := ComCall(6, this, BOOL, bStrong, "HRESULT")
        return result
    }

    Query(iid) {
        if (IManagedObjectInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIUnknown := CallbackCreate(GetMethod(implObj, "GetIUnknown"), flags, 2)
        this.vtbl.GetIObjectControl := CallbackCreate(GetMethod(implObj, "GetIObjectControl"), flags, 2)
        this.vtbl.SetInPool := CallbackCreate(GetMethod(implObj, "SetInPool"), flags, 3)
        this.vtbl.SetWrapperStrength := CallbackCreate(GetMethod(implObj, "SetWrapperStrength"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIUnknown)
        CallbackFree(this.vtbl.GetIObjectControl)
        CallbackFree(this.vtbl.SetInPool)
        CallbackFree(this.vtbl.SetWrapperStrength)
    }
}
