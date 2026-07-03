#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDVIDEOPORTNOTIFY.ahk" { DDVIDEOPORTNOTIFY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct IDirectDrawVideoPortNotify extends IUnknown {
    /**
     * The interface identifier for IDirectDrawVideoPortNotify
     * @type {Guid}
     */
    static IID := Guid("{a655fb94-0589-4e57-b333-567a89468c88}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectDrawVideoPortNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AcquireNotification : IntPtr
        ReleaseNotification : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectDrawVideoPortNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<HANDLE>} param0 
     * @param {Pointer<DDVIDEOPORTNOTIFY>} param1 
     * @returns {HRESULT} 
     */
    AcquireNotification(param0, param1) {
        result := ComCall(3, this, HANDLE.Ptr, param0, DDVIDEOPORTNOTIFY.Ptr, param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @returns {HRESULT} 
     */
    ReleaseNotification(param0) {
        result := ComCall(4, this, HANDLE, param0, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectDrawVideoPortNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AcquireNotification := CallbackCreate(GetMethod(implObj, "AcquireNotification"), flags, 3)
        this.vtbl.ReleaseNotification := CallbackCreate(GetMethod(implObj, "ReleaseNotification"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AcquireNotification)
        CallbackFree(this.vtbl.ReleaseNotification)
    }
}
