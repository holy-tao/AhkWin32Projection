#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IZoneIdentifier extends IUnknown {
    /**
     * The interface identifier for IZoneIdentifier
     * @type {Guid}
     */
    static IID := Guid("{cd45f185-1b21-48e2-967b-ead743a8914e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IZoneIdentifier interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetId  : IntPtr
        SetId  : IntPtr
        Remove : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IZoneIdentifier.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetId() {
        result := ComCall(3, this, "uint*", &pdwZone := 0, "HRESULT")
        return pdwZone
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @returns {HRESULT} 
     */
    SetId(dwZone) {
        result := ComCall(4, this, "uint", dwZone, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Remove() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IZoneIdentifier.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetId := CallbackCreate(GetMethod(implObj, "GetId"), flags, 2)
        this.vtbl.SetId := CallbackCreate(GetMethod(implObj, "SetId"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetId)
        CallbackFree(this.vtbl.SetId)
        CallbackFree(this.vtbl.Remove)
    }
}
