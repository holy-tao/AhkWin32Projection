#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCProfile.ahk" { IRTCProfile }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCProfileEvent extends IDispatch {
    /**
     * The interface identifier for IRTCProfileEvent
     * @type {Guid}
     */
    static IID := Guid("{d6d5ab3b-770e-43e8-800a-79b062395fca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCProfileEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Profile    : IntPtr
        get_Cookie     : IntPtr
        get_StatusCode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCProfileEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRTCProfile} 
     */
    Profile {
        get => this.get_Profile()
    }

    /**
     * @type {Pointer} 
     */
    Cookie {
        get => this.get_Cookie()
    }

    /**
     * @type {Integer} 
     */
    StatusCode {
        get => this.get_StatusCode()
    }

    /**
     * 
     * @returns {IRTCProfile} 
     */
    get_Profile() {
        result := ComCall(7, this, "ptr*", &ppProfile := 0, "HRESULT")
        return IRTCProfile(ppProfile)
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_Cookie() {
        result := ComCall(8, this, "ptr*", &plCookie := 0, "HRESULT")
        return plCookie
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        result := ComCall(9, this, "int*", &plStatusCode := 0, "HRESULT")
        return plStatusCode
    }

    Query(iid) {
        if (IRTCProfileEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Profile := CallbackCreate(GetMethod(implObj, "get_Profile"), flags, 2)
        this.vtbl.get_Cookie := CallbackCreate(GetMethod(implObj, "get_Cookie"), flags, 2)
        this.vtbl.get_StatusCode := CallbackCreate(GetMethod(implObj, "get_StatusCode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Profile)
        CallbackFree(this.vtbl.get_Cookie)
        CallbackFree(this.vtbl.get_StatusCode)
    }
}
