#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISideShowNotification.ahk" { ISideShowNotification }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.SideShow
 */
export default struct ISideShowNotificationManager extends IUnknown {
    /**
     * The interface identifier for ISideShowNotificationManager
     * @type {Guid}
     */
    static IID := Guid("{63cea909-f2b9-4302-b5e1-c68e6d9ab833}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISideShowNotificationManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Show      : IntPtr
        Revoke    : IntPtr
        RevokeAll : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISideShowNotificationManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ISideShowNotification} in_pINotification 
     * @returns {HRESULT} 
     */
    Show(in_pINotification) {
        result := ComCall(3, this, "ptr", in_pINotification, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} in_notificationId 
     * @returns {HRESULT} 
     */
    Revoke(in_notificationId) {
        result := ComCall(4, this, "uint", in_notificationId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RevokeAll() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISideShowNotificationManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Show := CallbackCreate(GetMethod(implObj, "Show"), flags, 2)
        this.vtbl.Revoke := CallbackCreate(GetMethod(implObj, "Revoke"), flags, 2)
        this.vtbl.RevokeAll := CallbackCreate(GetMethod(implObj, "RevokeAll"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Show)
        CallbackFree(this.vtbl.Revoke)
        CallbackFree(this.vtbl.RevokeAll)
    }
}
