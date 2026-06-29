#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_STORAGE_POOL_DRIVE_EXTENT.ahk" { VDS_STORAGE_POOL_DRIVE_EXTENT }
#Import ".\VDS_STORAGE_POOL_PROP.ahk" { VDS_STORAGE_POOL_PROP }
#Import ".\IVdsProvider.ahk" { IVdsProvider }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VDS_POOL_ATTRIBUTES.ahk" { VDS_POOL_ATTRIBUTES }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IEnumVdsObject.ahk" { IEnumVdsObject }

/**
 * The IVdsStoragePool interface (vdshwprv.h) provides methods to query information and enumerate related objects for a storage pool.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdsstoragepool
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsStoragePool extends IUnknown {
    /**
     * The interface identifier for IVdsStoragePool
     * @type {Guid}
     */
    static IID := Guid("{932ca8cf-0eb3-4ba8-9620-22665d7f8450}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsStoragePool interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProvider                : IntPtr
        GetProperties              : IntPtr
        GetAttributes              : IntPtr
        QueryDriveExtents          : IntPtr
        QueryAllocatedLuns         : IntPtr
        QueryAllocatedStoragePools : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsStoragePool.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsStoragePool::GetProvider (vdshwprv.h) method returns the hardware provider that manages the storage pool.
     * @returns {IVdsProvider} The address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsprovider">IVdsProvider</a> interface pointer. Callers must release the interface when it is no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsstoragepool-getprovider
     */
    GetProvider() {
        result := ComCall(3, this, "ptr*", &ppProvider := 0, "HRESULT")
        return IVdsProvider(ppProvider)
    }

    /**
     * The IVdsStoragePool::GetProperties (vdshwprv.h) method returns the properties of a storage pool.
     * @returns {VDS_STORAGE_POOL_PROP} The address of a caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_storage_pool_prop">VDS_STORAGE_POOL_PROP</a> structure that receives the storage pool property information.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsstoragepool-getproperties
     */
    GetProperties() {
        pStoragePoolProp := VDS_STORAGE_POOL_PROP()
        result := ComCall(4, this, VDS_STORAGE_POOL_PROP.Ptr, pStoragePoolProp, "HRESULT")
        return pStoragePoolProp
    }

    /**
     * The IVdsStoragePool::GetAttributes (vdshwprv.h) method returns the attributes of a storage pool.
     * @returns {VDS_POOL_ATTRIBUTES} The address of a caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_pool_attributes">VDS_POOL_ATTRIBUTES</a> structure that receives the storage pool attributes.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsstoragepool-getattributes
     */
    GetAttributes() {
        pStoragePoolAttributes := VDS_POOL_ATTRIBUTES()
        result := ComCall(5, this, VDS_POOL_ATTRIBUTES.Ptr, pStoragePoolAttributes, "HRESULT")
        return pStoragePoolAttributes
    }

    /**
     * The IVdsStoragePool::QueryDriveExtents (vdshwprv.h) method returns an array of the drive extents that are used by a storage pool.
     * @param {Pointer<Pointer<VDS_STORAGE_POOL_DRIVE_EXTENT>>} ppExtentArray A pointer to the array of <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_storage_pool_drive_extent">VDS_STORAGE_POOL_DRIVE_EXTENT</a> structures passed in by the caller. These structures describe the drive extents used by the storage pool. Callers must free this array by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Integer>} plNumberOfExtents A pointer to the number of extents returned in the <i>ppExtentArray</i> array.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsstoragepool-querydriveextents
     */
    QueryDriveExtents(ppExtentArray, plNumberOfExtents) {
        ppExtentArrayMarshal := ppExtentArray is VarRef ? "ptr*" : "ptr"
        plNumberOfExtentsMarshal := plNumberOfExtents is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, ppExtentArrayMarshal, ppExtentArray, plNumberOfExtentsMarshal, plNumberOfExtents, "HRESULT")
        return result
    }

    /**
     * The IVdsStoragePool::QueryAllocatedLuns (vdshwprv.h) method returns an object that enumerates the allocated LUNs for a storage pool.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface 
     *       pointer that can be used to enumerate the allocated LUNs. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the LUN  objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsstoragepool-queryallocatedluns
     */
    QueryAllocatedLuns() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * The IVdsStoragePool::QueryAllocatedStoragePools method returns an object that enumerates the allocated storage pools that are managed by the provider.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface 
     *       pointer that can be used to enumerate the allocated storage pools. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the storage pool  objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsstoragepool-queryallocatedstoragepools
     */
    QueryAllocatedStoragePools() {
        result := ComCall(8, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    Query(iid) {
        if (IVdsStoragePool.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProvider := CallbackCreate(GetMethod(implObj, "GetProvider"), flags, 2)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 2)
        this.vtbl.GetAttributes := CallbackCreate(GetMethod(implObj, "GetAttributes"), flags, 2)
        this.vtbl.QueryDriveExtents := CallbackCreate(GetMethod(implObj, "QueryDriveExtents"), flags, 3)
        this.vtbl.QueryAllocatedLuns := CallbackCreate(GetMethod(implObj, "QueryAllocatedLuns"), flags, 2)
        this.vtbl.QueryAllocatedStoragePools := CallbackCreate(GetMethod(implObj, "QueryAllocatedStoragePools"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProvider)
        CallbackFree(this.vtbl.GetProperties)
        CallbackFree(this.vtbl.GetAttributes)
        CallbackFree(this.vtbl.QueryDriveExtents)
        CallbackFree(this.vtbl.QueryAllocatedLuns)
        CallbackFree(this.vtbl.QueryAllocatedStoragePools)
    }
}
