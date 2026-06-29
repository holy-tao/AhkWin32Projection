#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCBuddy.ahk" { IRTCBuddy }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCBuddyEvent extends IDispatch {
    /**
     * The interface identifier for IRTCBuddyEvent
     * @type {Guid}
     */
    static IID := Guid("{f36d755d-17e6-404e-954f-0fc07574c78d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCBuddyEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Buddy : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCBuddyEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRTCBuddy} 
     */
    Buddy {
        get => this.get_Buddy()
    }

    /**
     * 
     * @returns {IRTCBuddy} 
     */
    get_Buddy() {
        result := ComCall(7, this, "ptr*", &ppBuddy := 0, "HRESULT")
        return IRTCBuddy(ppBuddy)
    }

    Query(iid) {
        if (IRTCBuddyEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Buddy := CallbackCreate(GetMethod(implObj, "get_Buddy"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Buddy)
    }
}
