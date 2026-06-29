#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IADsTimestamp interface provides methods for an ADSI client to access the Timestamp attribute.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadstimestamp
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsTimestamp extends IDispatch {
    /**
     * The interface identifier for IADsTimestamp
     * @type {Guid}
     */
    static IID := Guid("{b2f5a901-4080-11d1-a3ac-00c04fb950dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsTimestamp interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_WholeSeconds : IntPtr
        put_WholeSeconds : IntPtr
        get_EventID      : IntPtr
        put_EventID      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsTimestamp.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    WholeSeconds {
        get => this.get_WholeSeconds()
        set => this.put_WholeSeconds(value)
    }

    /**
     * @type {Integer} 
     */
    EventID {
        get => this.get_EventID()
        set => this.put_EventID(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WholeSeconds() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnWholeSeconds 
     * @returns {HRESULT} 
     */
    put_WholeSeconds(lnWholeSeconds) {
        result := ComCall(8, this, "int", lnWholeSeconds, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventID() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnEventID 
     * @returns {HRESULT} 
     */
    put_EventID(lnEventID) {
        result := ComCall(10, this, "int", lnEventID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsTimestamp.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_WholeSeconds := CallbackCreate(GetMethod(implObj, "get_WholeSeconds"), flags, 2)
        this.vtbl.put_WholeSeconds := CallbackCreate(GetMethod(implObj, "put_WholeSeconds"), flags, 2)
        this.vtbl.get_EventID := CallbackCreate(GetMethod(implObj, "get_EventID"), flags, 2)
        this.vtbl.put_EventID := CallbackCreate(GetMethod(implObj, "put_EventID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_WholeSeconds)
        CallbackFree(this.vtbl.put_WholeSeconds)
        CallbackFree(this.vtbl.get_EventID)
        CallbackFree(this.vtbl.put_EventID)
    }
}
