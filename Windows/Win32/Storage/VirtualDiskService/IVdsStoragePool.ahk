#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVdsProvider.ahk
#Include .\VDS_STORAGE_POOL_PROP.ahk
#Include .\VDS_POOL_ATTRIBUTES.ahk
#Include .\IEnumVdsObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to query information and enumerate related objects for a storage pool.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsstoragepool
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
     * 
     * @returns {IVdsProvider} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsstoragepool-getprovider
     */
    GetProvider() {
        result := ComCall(3, this, "ptr*", &ppProvider := 0, "HRESULT")
        return IVdsProvider(ppProvider)
    }

    /**
     * 
     * @returns {VDS_STORAGE_POOL_PROP} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsstoragepool-getproperties
     */
    GetProperties() {
        pStoragePoolProp := VDS_STORAGE_POOL_PROP()
        result := ComCall(4, this, "ptr", pStoragePoolProp, "HRESULT")
        return pStoragePoolProp
    }

    /**
     * 
     * @returns {VDS_POOL_ATTRIBUTES} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsstoragepool-getattributes
     */
    GetAttributes() {
        pStoragePoolAttributes := VDS_POOL_ATTRIBUTES()
        result := ComCall(5, this, "ptr", pStoragePoolAttributes, "HRESULT")
        return pStoragePoolAttributes
    }

    /**
     * 
     * @param {Pointer<Pointer<VDS_STORAGE_POOL_DRIVE_EXTENT>>} ppExtentArray 
     * @param {Pointer<Integer>} plNumberOfExtents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsstoragepool-querydriveextents
     */
    QueryDriveExtents(ppExtentArray, plNumberOfExtents) {
        ppExtentArrayMarshal := ppExtentArray is VarRef ? "ptr*" : "ptr"
        plNumberOfExtentsMarshal := plNumberOfExtents is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, ppExtentArrayMarshal, ppExtentArray, plNumberOfExtentsMarshal, plNumberOfExtents, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumVdsObject} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsstoragepool-queryallocatedluns
     */
    QueryAllocatedLuns() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * 
     * @returns {IEnumVdsObject} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsstoragepool-queryallocatedstoragepools
     */
    QueryAllocatedStoragePools() {
        result := ComCall(8, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }
}
