#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VDS_VOLUME_PROP2.ahk" { VDS_VOLUME_PROP2 }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method for returning volume property information, including the volume GUIDs.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsvolume2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsVolume2 extends IUnknown {
    /**
     * The interface identifier for IVdsVolume2
     * @type {Guid}
     */
    static IID := Guid("{72ae6713-dcbb-4a03-b36b-371f6ac6b53d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsVolume2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperties2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsVolume2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns property information for the current volume. This method is identical to the IVdsVolume::GetProperties method, except that it returns a VDS_VOLUME_PROP2 structure instead of a VDS_VOLUME_PROP structure.
     * @remarks
     * This method retrieves the unique volume identifier for a volume. The structure that contains that identifier is <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop2">VDS_VOLUME_PROP2</a>, not <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop">VDS_VOLUME_PROP</a>.
     * 
     * Note that a unique volume identifier is not the same as a volume GUID path. To find the volume GUID paths for a volume, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumemf3-queryvolumeguidpathnames">IVdsVolumeMF3::QueryVolumeGuidPathnames</a> method.
     * @returns {VDS_VOLUME_PROP2} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop">VDS_VOLUME_PROP2</a> structure 
     *       allocated and passed in by the caller. VDS allocates memory for the <b>pwszName</b> member 
     *       string. Callers must free the string by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolume2-getproperties2
     */
    GetProperties2() {
        pVolumeProperties := VDS_VOLUME_PROP2()
        result := ComCall(3, this, VDS_VOLUME_PROP2.Ptr, pVolumeProperties, "HRESULT")
        return pVolumeProperties
    }

    Query(iid) {
        if (IVdsVolume2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperties2 := CallbackCreate(GetMethod(implObj, "GetProperties2"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperties2)
    }
}
