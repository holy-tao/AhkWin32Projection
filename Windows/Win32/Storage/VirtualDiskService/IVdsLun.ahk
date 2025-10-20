#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing query and configuration operations on a logical unit number (LUN).
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdslun
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsLun extends IUnknown{
    /**
     * The interface identifier for IVdsLun
     * @type {Guid}
     */
    static IID => Guid("{3540a9c7-e60f-4111-a840-8bba6c2c83d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<VDS_LUN_PROP>} pLunProp 
     * @returns {HRESULT} 
     */
    GetProperties(pLunProp) {
        result := ComCall(3, this, "ptr", pLunProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVdsSubSystem>} ppSubSystem 
     * @returns {HRESULT} 
     */
    GetSubSystem(ppSubSystem) {
        result := ComCall(4, this, "ptr", ppSubSystem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_LUN_INFORMATION>} pLunInfo 
     * @returns {HRESULT} 
     */
    GetIdentificationData(pLunInfo) {
        result := ComCall(5, this, "ptr", pLunInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryActiveControllers(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullNumberOfBytesToAdd 
     * @param {Pointer<Guid>} pDriveIdArray 
     * @param {Integer} lNumberOfDrives 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    Extend(ullNumberOfBytesToAdd, pDriveIdArray, lNumberOfDrives, ppAsync) {
        result := ComCall(7, this, "uint", ullNumberOfBytesToAdd, "ptr", pDriveIdArray, "int", lNumberOfDrives, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullNumberOfBytesToRemove 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    Shrink(ullNumberOfBytesToRemove, ppAsync) {
        result := ComCall(8, this, "uint", ullNumberOfBytesToRemove, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryPlexes(ppEnum) {
        result := ComCall(9, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} lunId 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    AddPlex(lunId, ppAsync) {
        result := ComCall(10, this, "ptr", lunId, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} plexId 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    RemovePlex(plexId, ppAsync) {
        result := ComCall(11, this, "ptr", plexId, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    Recover(ppAsync) {
        result := ComCall(12, this, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszUnmaskingList 
     * @returns {HRESULT} 
     */
    SetMask(pwszUnmaskingList) {
        pwszUnmaskingList := pwszUnmaskingList is String ? StrPtr(pwszUnmaskingList) : pwszUnmaskingList

        result := ComCall(13, this, "ptr", pwszUnmaskingList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pActiveControllerIdArray 
     * @param {Integer} lNumberOfActiveControllers 
     * @param {Pointer<Guid>} pInactiveControllerIdArray 
     * @param {Integer} lNumberOfInactiveControllers 
     * @returns {HRESULT} 
     */
    AssociateControllers(pActiveControllerIdArray, lNumberOfActiveControllers, pInactiveControllerIdArray, lNumberOfInactiveControllers) {
        result := ComCall(15, this, "ptr", pActiveControllerIdArray, "int", lNumberOfActiveControllers, "ptr", pInactiveControllerIdArray, "int", lNumberOfInactiveControllers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_HINTS>} pHints 
     * @returns {HRESULT} 
     */
    QueryHints(pHints) {
        result := ComCall(16, this, "ptr", pHints, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_HINTS>} pHints 
     * @returns {HRESULT} 
     */
    ApplyHints(pHints) {
        result := ComCall(17, this, "ptr", pHints, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} status 
     * @returns {HRESULT} 
     */
    SetStatus(status) {
        result := ComCall(18, this, "int", status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pDriveIdArray 
     * @param {Integer} lNumberOfDrives 
     * @param {Pointer<UInt64>} pullMaxBytesToBeAdded 
     * @returns {HRESULT} 
     */
    QueryMaxLunExtendSize(pDriveIdArray, lNumberOfDrives, pullMaxBytesToBeAdded) {
        result := ComCall(19, this, "ptr", pDriveIdArray, "int", lNumberOfDrives, "uint*", pullMaxBytesToBeAdded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
