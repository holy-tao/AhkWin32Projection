#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\VDS_ADVANCEDDISK_PROP.ahk" { VDS_ADVANCEDDISK_PROP }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsAdvancedDisk3 extends IUnknown {
    /**
     * The interface identifier for IVdsAdvancedDisk3
     * @type {Guid}
     */
    static IID := Guid("{3858c0d5-0f35-4bf5-9714-69874963bc36}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsAdvancedDisk3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperties : IntPtr
        GetUniqueId   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsAdvancedDisk3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {VDS_ADVANCEDDISK_PROP} 
     */
    GetProperties() {
        pAdvDiskProp := VDS_ADVANCEDDISK_PROP()
        result := ComCall(3, this, VDS_ADVANCEDDISK_PROP.Ptr, pAdvDiskProp, "HRESULT")
        return pAdvDiskProp
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetUniqueId() {
        result := ComCall(4, this, PWSTR.Ptr, &ppwszId := 0, "HRESULT")
        return ppwszId
    }

    Query(iid) {
        if (IVdsAdvancedDisk3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 2)
        this.vtbl.GetUniqueId := CallbackCreate(GetMethod(implObj, "GetUniqueId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperties)
        CallbackFree(this.vtbl.GetUniqueId)
    }
}
