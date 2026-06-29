#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\RTC_ACE_SCOPE.ahk" { RTC_ACE_SCOPE }
#Import ".\IRTCProfile2.ahk" { IRTCProfile2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCWatcher.ahk" { IRTCWatcher }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCWatcher2 extends IRTCWatcher {
    /**
     * The interface identifier for IRTCWatcher2
     * @type {Guid}
     */
    static IID := Guid("{d4d9967f-d011-4b1d-91e3-aba78f96393d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCWatcher2 interfaces
    */
    struct Vtbl extends IRTCWatcher.Vtbl {
        get_Profile : IntPtr
        get_Scope   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCWatcher2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRTCProfile2} 
     */
    Profile {
        get => this.get_Profile()
    }

    /**
     * @type {RTC_ACE_SCOPE} 
     */
    Scope {
        get => this.get_Scope()
    }

    /**
     * 
     * @returns {IRTCProfile2} 
     */
    get_Profile() {
        result := ComCall(13, this, "ptr*", &ppProfile := 0, "HRESULT")
        return IRTCProfile2(ppProfile)
    }

    /**
     * 
     * @returns {RTC_ACE_SCOPE} 
     */
    get_Scope() {
        result := ComCall(14, this, "int*", &penScope := 0, "HRESULT")
        return penScope
    }

    Query(iid) {
        if (IRTCWatcher2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Profile := CallbackCreate(GetMethod(implObj, "get_Profile"), flags, 2)
        this.vtbl.get_Scope := CallbackCreate(GetMethod(implObj, "get_Scope"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Profile)
        CallbackFree(this.vtbl.get_Scope)
    }
}
