#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\EMemoryAvailable.ahk" { EMemoryAvailable }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRMemoryNotificationCallback extends IUnknown {
    /**
     * The interface identifier for ICLRMemoryNotificationCallback
     * @type {Guid}
     */
    static IID := Guid("{47eb8e57-0846-4546-af76-6f42fcfc2649}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRMemoryNotificationCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnMemoryNotification : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRMemoryNotificationCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {EMemoryAvailable} _eMemoryAvailable 
     * @returns {HRESULT} 
     */
    OnMemoryNotification(_eMemoryAvailable) {
        result := ComCall(3, this, EMemoryAvailable, _eMemoryAvailable, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRMemoryNotificationCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnMemoryNotification := CallbackCreate(GetMethod(implObj, "OnMemoryNotification"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnMemoryNotification)
    }
}
