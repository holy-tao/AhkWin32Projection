#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_LUN_INFORMATION.ahk" { VDS_LUN_INFORMATION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method that enables VDS to determine whether the hardware provider manages a specified LUN.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdshwproviderprivate
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsHwProviderPrivate extends IUnknown {
    /**
     * The interface identifier for IVdsHwProviderPrivate
     * @type {Guid}
     */
    static IID := Guid("{98f17bf3-9f33-4f12-8714-8b4075092c2e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsHwProviderPrivate interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryIfCreatedLun : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsHwProviderPrivate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables VDS to determine whether the hardware provider manages the specified LUN.
     * @remarks
     * Only VDS calls this method.
     * @param {PWSTR} pwszDevicePath A pointer to the path to the LUN on the local computer; a zero-terminated, human-readable string.
     * @param {Pointer<VDS_LUN_INFORMATION>} pVdsLunInformation A pointer to the identification data of the specified LUN. See the <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structure.
     * @returns {Guid} A pointer to the returned LUN GUID. If the provider does not manage the LUN, set this parameter to GUID_NULL.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdshwproviderprivate-queryifcreatedlun
     */
    QueryIfCreatedLun(pwszDevicePath, pVdsLunInformation) {
        pwszDevicePath := pwszDevicePath is String ? StrPtr(pwszDevicePath) : pwszDevicePath

        pLunId := Guid()
        result := ComCall(3, this, "ptr", pwszDevicePath, VDS_LUN_INFORMATION.Ptr, pVdsLunInformation, Guid.Ptr, pLunId, "HRESULT")
        return pLunId
    }

    Query(iid) {
        if (IVdsHwProviderPrivate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryIfCreatedLun := CallbackCreate(GetMethod(implObj, "QueryIfCreatedLun"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryIfCreatedLun)
    }
}
