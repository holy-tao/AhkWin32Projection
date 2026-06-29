#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostMemory3.ahk" { IDebugHostMemory3 }
#Import ".\Location.ahk" { Location }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostMemory4 extends IDebugHostMemory3 {
    /**
     * The interface identifier for IDebugHostMemory4
     * @type {Guid}
     */
    static IID := Guid("{fe6b3658-da4b-44e3-8a58-6201322280e6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostMemory4 interfaces
    */
    struct Vtbl extends IDebugHostMemory3.Vtbl {
        GetPhysicalAddressLocation : IntPtr
        IsPhysicalAddressLocation  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostMemory4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} physAddr 
     * @returns {Location} 
     */
    GetPhysicalAddressLocation(physAddr) {
        pPhysicalAddressLocation := Location()
        result := ComCall(10, this, "uint", physAddr, Location.Ptr, pPhysicalAddressLocation, "HRESULT")
        return pPhysicalAddressLocation
    }

    /**
     * 
     * @param {Pointer<Location>} pLocation 
     * @returns {Boolean} 
     */
    IsPhysicalAddressLocation(pLocation) {
        result := ComCall(11, this, Location.Ptr, pLocation, Int32)
        return result
    }

    Query(iid) {
        if (IDebugHostMemory4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPhysicalAddressLocation := CallbackCreate(GetMethod(implObj, "GetPhysicalAddressLocation"), flags, 3)
        this.vtbl.IsPhysicalAddressLocation := CallbackCreate(GetMethod(implObj, "IsPhysicalAddressLocation"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPhysicalAddressLocation)
        CallbackFree(this.vtbl.IsPhysicalAddressLocation)
    }
}
