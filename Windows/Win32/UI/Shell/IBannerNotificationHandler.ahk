#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\BANNER_NOTIFICATION.ahk" { BANNER_NOTIFICATION }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IBannerNotificationHandler extends IUnknown {
    /**
     * The interface identifier for IBannerNotificationHandler
     * @type {Guid}
     */
    static IID := Guid("{8d7b2ba7-db05-46a8-823c-d2b6de08ee91}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBannerNotificationHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnBannerEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBannerNotificationHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<BANNER_NOTIFICATION>} _notification 
     * @returns {HRESULT} 
     */
    OnBannerEvent(_notification) {
        result := ComCall(3, this, BANNER_NOTIFICATION.Ptr, _notification, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBannerNotificationHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnBannerEvent := CallbackCreate(GetMethod(implObj, "OnBannerEvent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnBannerEvent)
    }
}
