#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IEnumUnknown.ahk" { IEnumUnknown }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IBidiRequest.ahk" { IBidiRequest }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IBidiRequestContainer extends IUnknown {
    /**
     * The interface identifier for IBidiRequestContainer
     * @type {Guid}
     */
    static IID := Guid("{d752f6c0-94a8-4275-a77d-8f1d1a1121ae}")

    /**
     * The class identifier for BidiRequestContainer
     * @type {Guid}
     */
    static CLSID := Guid("{fc5b8a24-db05-4a01-8388-22edf6c2bbba}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBidiRequestContainer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddRequest      : IntPtr
        GetEnumObject   : IntPtr
        GetRequestCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBidiRequestContainer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IBidiRequest} pRequest 
     * @returns {HRESULT} 
     */
    AddRequest(pRequest) {
        result := ComCall(3, this, "ptr", pRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumUnknown} 
     */
    GetEnumObject() {
        result := ComCall(4, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumUnknown(ppenum)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetRequestCount() {
        result := ComCall(5, this, "uint*", &puCount := 0, "HRESULT")
        return puCount
    }

    Query(iid) {
        if (IBidiRequestContainer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddRequest := CallbackCreate(GetMethod(implObj, "AddRequest"), flags, 2)
        this.vtbl.GetEnumObject := CallbackCreate(GetMethod(implObj, "GetEnumObject"), flags, 2)
        this.vtbl.GetRequestCount := CallbackCreate(GetMethod(implObj, "GetRequestCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddRequest)
        CallbackFree(this.vtbl.GetEnumObject)
        CallbackFree(this.vtbl.GetRequestCount)
    }
}
