#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISideShowCapabilities.ahk" { ISideShowCapabilities }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.SideShow
 */
export default struct ISideShowCapabilitiesCollection extends IUnknown {
    /**
     * The interface identifier for ISideShowCapabilitiesCollection
     * @type {Guid}
     */
    static IID := Guid("{50305597-5e0d-4ff7-b3af-33d0d9bd52dd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISideShowCapabilitiesCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount : IntPtr
        GetAt    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISideShowCapabilitiesCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &out_pdwCount := 0, "HRESULT")
        return out_pdwCount
    }

    /**
     * 
     * @param {Integer} in_dwIndex 
     * @returns {ISideShowCapabilities} 
     */
    GetAt(in_dwIndex) {
        result := ComCall(4, this, "uint", in_dwIndex, "ptr*", &out_ppCapabilities := 0, "HRESULT")
        return ISideShowCapabilities(out_ppCapabilities)
    }

    Query(iid) {
        if (ISideShowCapabilitiesCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetAt := CallbackCreate(GetMethod(implObj, "GetAt"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetAt)
    }
}
