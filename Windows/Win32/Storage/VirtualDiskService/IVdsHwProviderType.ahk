#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VDS_HWPROVIDER_TYPE.ahk" { VDS_HWPROVIDER_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVdsHwProviderType interface (vdshwprv.h) provides a method to retrieve the type of hardware provider.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdshwprovidertype
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsHwProviderType extends IUnknown {
    /**
     * The interface identifier for IVdsHwProviderType
     * @type {Guid}
     */
    static IID := Guid("{3e0f5166-542d-4fc6-947a-012174240b7e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsHwProviderType interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProviderType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsHwProviderType.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsHwProviderType::GetProviderType (vdshwprv.h) method retrieves the type of the hardware provider.
     * @returns {VDS_HWPROVIDER_TYPE} A pointer to a caller-allocated variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hwprovider_type">VDS_HWPROVIDER_TYPE</a> enumeration value that specifies the hardware provider type. This parameter is required and cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdshwprovidertype-getprovidertype
     */
    GetProviderType() {
        result := ComCall(3, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    Query(iid) {
        if (IVdsHwProviderType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProviderType := CallbackCreate(GetMethod(implObj, "GetProviderType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProviderType)
    }
}
