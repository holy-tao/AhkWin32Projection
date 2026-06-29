#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumRemoteDebugApplications.ahk" { IEnumRemoteDebugApplications }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRemoteDebugApplication.ahk" { IRemoteDebugApplication }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IMachineDebugManagerCookie extends IUnknown {
    /**
     * The interface identifier for IMachineDebugManagerCookie
     * @type {Guid}
     */
    static IID := Guid("{51973c2d-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMachineDebugManagerCookie interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddApplication    : IntPtr
        RemoveApplication : IntPtr
        EnumApplications  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMachineDebugManagerCookie.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IRemoteDebugApplication} pda 
     * @param {Integer} dwDebugAppCookie 
     * @returns {Integer} 
     */
    AddApplication(pda, dwDebugAppCookie) {
        result := ComCall(3, this, "ptr", pda, "uint", dwDebugAppCookie, "uint*", &pdwAppCookie := 0, "HRESULT")
        return pdwAppCookie
    }

    /**
     * 
     * @param {Integer} dwDebugAppCookie 
     * @param {Integer} dwAppCookie 
     * @returns {HRESULT} 
     */
    RemoveApplication(dwDebugAppCookie, dwAppCookie) {
        result := ComCall(4, this, "uint", dwDebugAppCookie, "uint", dwAppCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumRemoteDebugApplications} 
     */
    EnumApplications() {
        result := ComCall(5, this, "ptr*", &ppeda := 0, "HRESULT")
        return IEnumRemoteDebugApplications(ppeda)
    }

    Query(iid) {
        if (IMachineDebugManagerCookie.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddApplication := CallbackCreate(GetMethod(implObj, "AddApplication"), flags, 4)
        this.vtbl.RemoveApplication := CallbackCreate(GetMethod(implObj, "RemoveApplication"), flags, 3)
        this.vtbl.EnumApplications := CallbackCreate(GetMethod(implObj, "EnumApplications"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddApplication)
        CallbackFree(this.vtbl.RemoveApplication)
        CallbackFree(this.vtbl.EnumApplications)
    }
}
