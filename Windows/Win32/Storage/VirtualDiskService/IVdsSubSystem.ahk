#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing query and configuration operations on a subsystem.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdssubsystem
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsSubSystem extends IUnknown{
    /**
     * The interface identifier for IVdsSubSystem
     * @type {Guid}
     */
    static IID => Guid("{6fcee2d3-6d90-4f91-80e2-a5c7caaca9d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<VDS_SUB_SYSTEM_PROP>} pSubSystemProp 
     * @returns {HRESULT} 
     */
    GetProperties(pSubSystemProp) {
        result := ComCall(3, this, "ptr", pSubSystemProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVdsProvider>} ppProvider 
     * @returns {HRESULT} 
     */
    GetProvider(ppProvider) {
        result := ComCall(4, this, "ptr", ppProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryControllers(ppEnum) {
        result := ComCall(5, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryLuns(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryDrives(ppEnum) {
        result := ComCall(7, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} sBusNumber 
     * @param {Integer} sSlotNumber 
     * @param {Pointer<IVdsDrive>} ppDrive 
     * @returns {HRESULT} 
     */
    GetDrive(sBusNumber, sSlotNumber, ppDrive) {
        result := ComCall(8, this, "short", sBusNumber, "short", sSlotNumber, "ptr", ppDrive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reenumerate() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pOnlineControllerIdArray 
     * @param {Integer} lNumberOfOnlineControllers 
     * @param {Pointer<Guid>} pOfflineControllerIdArray 
     * @param {Integer} lNumberOfOfflineControllers 
     * @returns {HRESULT} 
     */
    SetControllerStatus(pOnlineControllerIdArray, lNumberOfOnlineControllers, pOfflineControllerIdArray, lNumberOfOfflineControllers) {
        result := ComCall(10, this, "ptr", pOnlineControllerIdArray, "int", lNumberOfOnlineControllers, "ptr", pOfflineControllerIdArray, "int", lNumberOfOfflineControllers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Integer} ullSizeInBytes 
     * @param {Pointer<Guid>} pDriveIdArray 
     * @param {Integer} lNumberOfDrives 
     * @param {PWSTR} pwszUnmaskingList 
     * @param {Pointer<VDS_HINTS>} pHints 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    CreateLun(type, ullSizeInBytes, pDriveIdArray, lNumberOfDrives, pwszUnmaskingList, pHints, ppAsync) {
        pwszUnmaskingList := pwszUnmaskingList is String ? StrPtr(pwszUnmaskingList) : pwszUnmaskingList

        result := ComCall(11, this, "int", type, "uint", ullSizeInBytes, "ptr", pDriveIdArray, "int", lNumberOfDrives, "ptr", pwszUnmaskingList, "ptr", pHints, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} DriveToBeReplaced 
     * @param {Pointer<Guid>} ReplacementDrive 
     * @returns {HRESULT} 
     */
    ReplaceDrive(DriveToBeReplaced, ReplacementDrive) {
        result := ComCall(12, this, "ptr", DriveToBeReplaced, "ptr", ReplacementDrive, "int")
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
        result := ComCall(13, this, "int", status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<Guid>} pDriveIdArray 
     * @param {Integer} lNumberOfDrives 
     * @param {Pointer<VDS_HINTS>} pHints 
     * @param {Pointer<UInt64>} pullMaxLunSize 
     * @returns {HRESULT} 
     */
    QueryMaxLunCreateSize(type, pDriveIdArray, lNumberOfDrives, pHints, pullMaxLunSize) {
        result := ComCall(14, this, "int", type, "ptr", pDriveIdArray, "int", lNumberOfDrives, "ptr", pHints, "uint*", pullMaxLunSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
