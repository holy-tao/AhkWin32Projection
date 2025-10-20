#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to create LUNs in a storage pool and enumerate the storage pools managed by a hardware provider.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdshwproviderstoragepools
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsHwProviderStoragePools extends IUnknown{
    /**
     * The interface identifier for IVdsHwProviderStoragePools
     * @type {Guid}
     */
    static IID => Guid("{d5b5937a-f188-4c79-b86c-11c920ad11b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Integer} ullRemainingFreeSpace 
     * @param {Pointer<VDS_POOL_ATTRIBUTES>} pPoolAttributes 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryStoragePools(ulFlags, ullRemainingFreeSpace, pPoolAttributes, ppEnum) {
        result := ComCall(3, this, "uint", ulFlags, "uint", ullRemainingFreeSpace, "ptr", pPoolAttributes, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Integer} ullSizeInBytes 
     * @param {Pointer<Guid>} StoragePoolId 
     * @param {PWSTR} pwszUnmaskingList 
     * @param {Pointer<VDS_HINTS2>} pHints2 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    CreateLunInStoragePool(type, ullSizeInBytes, StoragePoolId, pwszUnmaskingList, pHints2, ppAsync) {
        pwszUnmaskingList := pwszUnmaskingList is String ? StrPtr(pwszUnmaskingList) : pwszUnmaskingList

        result := ComCall(4, this, "int", type, "uint", ullSizeInBytes, "ptr", StoragePoolId, "ptr", pwszUnmaskingList, "ptr", pHints2, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<Guid>} StoragePoolId 
     * @param {Pointer<VDS_HINTS2>} pHints2 
     * @param {Pointer<UInt64>} pullMaxLunSize 
     * @returns {HRESULT} 
     */
    QueryMaxLunCreateSizeInStoragePool(type, StoragePoolId, pHints2, pullMaxLunSize) {
        result := ComCall(5, this, "int", type, "ptr", StoragePoolId, "ptr", pHints2, "uint*", pullMaxLunSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
