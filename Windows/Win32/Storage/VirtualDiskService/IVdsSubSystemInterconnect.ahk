#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVdsSubSystemInterconnect interface (vdshwprv.h) provides a method to query the interconnect types that are supported by a subsystem.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdssubsysteminterconnect
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsSubSystemInterconnect extends IUnknown {
    /**
     * The interface identifier for IVdsSubSystemInterconnect
     * @type {Guid}
     */
    static IID := Guid("{9e6fa560-c141-477b-83ba-0b6c38f7febf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsSubSystemInterconnect interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSupportedInterconnects : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsSubSystemInterconnect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsSubSystemInterconnect::GetSupportedInterconnects (vdshwprv.h) method returns the interconnect types that the subsystem supports.
     * @returns {Integer} A pointer to a caller-allocated <b>ULONG</b> value that receives a bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_interconnect_flag">VDS_INTERCONNECT_FLAG</a> flags, one for each interconnect type that the subsystem supports. This parameter is required and cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsysteminterconnect-getsupportedinterconnects
     */
    GetSupportedInterconnects() {
        result := ComCall(3, this, "uint*", &pulSupportedInterconnectsFlag := 0, "HRESULT")
        return pulSupportedInterconnectsFlag
    }

    Query(iid) {
        if (IVdsSubSystemInterconnect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSupportedInterconnects := CallbackCreate(GetMethod(implObj, "GetSupportedInterconnects"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSupportedInterconnects)
    }
}
