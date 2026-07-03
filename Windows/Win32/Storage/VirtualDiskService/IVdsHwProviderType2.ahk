#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VDS_HWPROVIDER_TYPE.ahk" { VDS_HWPROVIDER_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVdsHwProviderType2 interface (vdshwprv.h) is not implemented. Use IVdsHwProviderType interface (vds.h) instead.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdshwprovidertype2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsHwProviderType2 extends IUnknown {
    /**
     * The interface identifier for IVdsHwProviderType2
     * @type {Guid}
     */
    static IID := Guid("{8190236f-c4d0-4e81-8011-d69512fcc984}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsHwProviderType2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProviderType2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsHwProviderType2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsHwProviderType2::GetProviderType2 (vdshwprv.h) method retrieves the type of the hardware provider.
     * @remarks
     * If the provider object supports the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdshwprovidertype2">IVdsHwProviderType2</a> interface, the server must call the <b>GetProviderType2</b> method on the provider object to retrieve the provider type and then return an HRESULT indicating failure or success.
     * @returns {VDS_HWPROVIDER_TYPE} A pointer to a caller-allocated variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hwprovider_type">VDS_HWPROVIDER_TYPE</a> enumeration value that specifies the hardware provider type. This parameter is required and cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdshwprovidertype2-getprovidertype2
     */
    GetProviderType2() {
        result := ComCall(3, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    Query(iid) {
        if (IVdsHwProviderType2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProviderType2 := CallbackCreate(GetMethod(implObj, "GetProviderType2"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProviderType2)
    }
}
