#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISideShowContentManager.ahk" { ISideShowContentManager }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISideShowNotificationManager.ahk" { ISideShowNotificationManager }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.SideShow
 */
export default struct ISideShowSession extends IUnknown {
    /**
     * The interface identifier for ISideShowSession
     * @type {Guid}
     */
    static IID := Guid("{e22331ee-9e7d-4922-9fc2-ab7aa41ce491}")

    /**
     * The class identifier for SideShowSession
     * @type {Guid}
     */
    static CLSID := Guid("{e20543b9-f785-4ea2-981e-c4ffa76bbc7c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISideShowSession interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterContent       : IntPtr
        RegisterNotifications : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISideShowSession.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} in_applicationId 
     * @param {Pointer<Guid>} in_endpointId 
     * @returns {ISideShowContentManager} 
     */
    RegisterContent(in_applicationId, in_endpointId) {
        result := ComCall(3, this, Guid.Ptr, in_applicationId, Guid.Ptr, in_endpointId, "ptr*", &out_ppIContent := 0, "HRESULT")
        return ISideShowContentManager(out_ppIContent)
    }

    /**
     * 
     * @param {Pointer<Guid>} in_applicationId 
     * @returns {ISideShowNotificationManager} 
     */
    RegisterNotifications(in_applicationId) {
        result := ComCall(4, this, Guid.Ptr, in_applicationId, "ptr*", &out_ppINotification := 0, "HRESULT")
        return ISideShowNotificationManager(out_ppINotification)
    }

    Query(iid) {
        if (ISideShowSession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterContent := CallbackCreate(GetMethod(implObj, "RegisterContent"), flags, 4)
        this.vtbl.RegisterNotifications := CallbackCreate(GetMethod(implObj, "RegisterNotifications"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterContent)
        CallbackFree(this.vtbl.RegisterNotifications)
    }
}
