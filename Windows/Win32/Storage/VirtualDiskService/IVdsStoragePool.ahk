#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVdsProvider.ahk
#Include .\VDS_STORAGE_POOL_PROP.ahk
#Include .\VDS_POOL_ATTRIBUTES.ahk
#Include .\IEnumVdsObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVdsStoragePool interface (vdshwprv.h) provides methods to query information and enumerate related objects for a storage pool.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdsstoragepool
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsStoragePool extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsStoragePool
     * @type {Guid}
     */
    static IID => Guid("{932ca8cf-0eb3-4ba8-9620-22665d7f8450}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProvider", "GetProperties", "GetAttributes", "QueryDriveExtents", "QueryAllocatedLuns", "QueryAllocatedStoragePools"]

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
        result := ComCall(4, this, "ptr", pStoragePoolProp, "HRESULT")
        return pStoragePoolProp
    }

    /**
     * The IVdsStoragePool::GetAttributes (vdshwprv.h) method returns the attributes of a storage pool.
     * @returns {VDS_POOL_ATTRIBUTES} The address of a caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_pool_attributes">VDS_POOL_ATTRIBUTES</a> structure that receives the storage pool attributes.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsstoragepool-getattributes
     */
    GetAttributes() {
        pStoragePoolAttributes := VDS_POOL_ATTRIBUTES()
        result := ComCall(5, this, "ptr", pStoragePoolAttributes, "HRESULT")
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
}
