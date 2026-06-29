#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISWbemObject.ahk" { ISWbemObject }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISWbemSecurity.ahk" { ISWbemSecurity }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemEventSource extends IDispatch {
    /**
     * The interface identifier for ISWbemEventSource
     * @type {Guid}
     */
    static IID := Guid("{27d54d92-0ebe-11d2-8b22-00600806d9b6}")

    /**
     * The class identifier for SWbemEventSource
     * @type {Guid}
     */
    static CLSID := Guid("{04b83d58-21ae-11d2-8b33-00600806d9b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemEventSource interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        NextEvent     : IntPtr
        get_Security_ : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemEventSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISWbemSecurity} 
     */
    Security_ {
        get => this.get_Security_()
    }

    /**
     * 
     * @param {Integer} iTimeoutMs 
     * @returns {ISWbemObject} 
     */
    NextEvent(iTimeoutMs) {
        result := ComCall(7, this, "int", iTimeoutMs, "ptr*", &objWbemObject := 0, "HRESULT")
        return ISWbemObject(objWbemObject)
    }

    /**
     * 
     * @returns {ISWbemSecurity} 
     */
    get_Security_() {
        result := ComCall(8, this, "ptr*", &objWbemSecurity := 0, "HRESULT")
        return ISWbemSecurity(objWbemSecurity)
    }

    Query(iid) {
        if (ISWbemEventSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NextEvent := CallbackCreate(GetMethod(implObj, "NextEvent"), flags, 3)
        this.vtbl.get_Security_ := CallbackCreate(GetMethod(implObj, "get_Security_"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NextEvent)
        CallbackFree(this.vtbl.get_Security_)
    }
}
