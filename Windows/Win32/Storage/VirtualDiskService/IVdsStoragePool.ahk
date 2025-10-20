#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to query information and enumerate related objects for a storage pool.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsstoragepool
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsStoragePool extends IUnknown{
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
     * 
     * @param {Pointer<IVdsProvider>} ppProvider 
     * @returns {HRESULT} 
     */
    GetProvider(ppProvider) {
        result := ComCall(3, this, "ptr", ppProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_STORAGE_POOL_PROP>} pStoragePoolProp 
     * @returns {HRESULT} 
     */
    GetProperties(pStoragePoolProp) {
        result := ComCall(4, this, "ptr", pStoragePoolProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_POOL_ATTRIBUTES>} pStoragePoolAttributes 
     * @returns {HRESULT} 
     */
    GetAttributes(pStoragePoolAttributes) {
        result := ComCall(5, this, "ptr", pStoragePoolAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_STORAGE_POOL_DRIVE_EXTENT>} ppExtentArray 
     * @param {Pointer<Int32>} plNumberOfExtents 
     * @returns {HRESULT} 
     */
    QueryDriveExtents(ppExtentArray, plNumberOfExtents) {
        result := ComCall(6, this, "ptr", ppExtentArray, "int*", plNumberOfExtents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryAllocatedLuns(ppEnum) {
        result := ComCall(7, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryAllocatedStoragePools(ppEnum) {
        result := ComCall(8, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
