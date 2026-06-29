#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MEDIA_ACTIVITY_NOTIFY_TYPE.ahk" { MEDIA_ACTIVITY_NOTIFY_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IMediaActivityNotifySite extends IUnknown {
    /**
     * The interface identifier for IMediaActivityNotifySite
     * @type {Guid}
     */
    static IID := Guid("{8165cfef-179d-46c2-bc71-3fa726dc1f8d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMediaActivityNotifySite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnMediaActivityStarted : IntPtr
        OnMediaActivityStopped : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMediaActivityNotifySite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {MEDIA_ACTIVITY_NOTIFY_TYPE} mediaActivityType 
     * @returns {HRESULT} 
     */
    OnMediaActivityStarted(mediaActivityType) {
        result := ComCall(3, this, MEDIA_ACTIVITY_NOTIFY_TYPE, mediaActivityType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {MEDIA_ACTIVITY_NOTIFY_TYPE} mediaActivityType 
     * @returns {HRESULT} 
     */
    OnMediaActivityStopped(mediaActivityType) {
        result := ComCall(4, this, MEDIA_ACTIVITY_NOTIFY_TYPE, mediaActivityType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMediaActivityNotifySite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnMediaActivityStarted := CallbackCreate(GetMethod(implObj, "OnMediaActivityStarted"), flags, 2)
        this.vtbl.OnMediaActivityStopped := CallbackCreate(GetMethod(implObj, "OnMediaActivityStopped"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnMediaActivityStarted)
        CallbackFree(this.vtbl.OnMediaActivityStopped)
    }
}
