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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetProvider", "QueryControllers", "QueryLuns", "QueryDrives", "GetDrive", "Reenumerate", "SetControllerStatus", "CreateLun", "ReplaceDrive", "SetStatus", "QueryMaxLunCreateSize"]

    /**
     * 
     * @param {Pointer<VDS_SUB_SYSTEM_PROP>} pSubSystemProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystem-getproperties
     */
    GetProperties(pSubSystemProp) {
        result := ComCall(3, this, "ptr", pSubSystemProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsProvider>} ppProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystem-getprovider
     */
    GetProvider(ppProvider) {
        result := ComCall(4, this, "ptr*", ppProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystem-querycontrollers
     */
    QueryControllers(ppEnum) {
        result := ComCall(5, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystem-queryluns
     */
    QueryLuns(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystem-querydrives
     */
    QueryDrives(ppEnum) {
        result := ComCall(7, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} sBusNumber 
     * @param {Integer} sSlotNumber 
     * @param {Pointer<IVdsDrive>} ppDrive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystem-getdrive
     */
    GetDrive(sBusNumber, sSlotNumber, ppDrive) {
        result := ComCall(8, this, "short", sBusNumber, "short", sSlotNumber, "ptr*", ppDrive, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystem-reenumerate
     */
    Reenumerate() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pOnlineControllerIdArray 
     * @param {Integer} lNumberOfOnlineControllers 
     * @param {Pointer<Guid>} pOfflineControllerIdArray 
     * @param {Integer} lNumberOfOfflineControllers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystem-setcontrollerstatus
     */
    SetControllerStatus(pOnlineControllerIdArray, lNumberOfOnlineControllers, pOfflineControllerIdArray, lNumberOfOfflineControllers) {
        result := ComCall(10, this, "ptr", pOnlineControllerIdArray, "int", lNumberOfOnlineControllers, "ptr", pOfflineControllerIdArray, "int", lNumberOfOfflineControllers, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystem-createlun
     */
    CreateLun(type, ullSizeInBytes, pDriveIdArray, lNumberOfDrives, pwszUnmaskingList, pHints, ppAsync) {
        pwszUnmaskingList := pwszUnmaskingList is String ? StrPtr(pwszUnmaskingList) : pwszUnmaskingList

        result := ComCall(11, this, "int", type, "uint", ullSizeInBytes, "ptr", pDriveIdArray, "int", lNumberOfDrives, "ptr", pwszUnmaskingList, "ptr", pHints, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} DriveToBeReplaced 
     * @param {Guid} ReplacementDrive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystem-replacedrive
     */
    ReplaceDrive(DriveToBeReplaced, ReplacementDrive) {
        result := ComCall(12, this, "ptr", DriveToBeReplaced, "ptr", ReplacementDrive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystem-setstatus
     */
    SetStatus(status) {
        result := ComCall(13, this, "int", status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<Guid>} pDriveIdArray 
     * @param {Integer} lNumberOfDrives 
     * @param {Pointer<VDS_HINTS>} pHints 
     * @param {Pointer<Integer>} pullMaxLunSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystem-querymaxluncreatesize
     */
    QueryMaxLunCreateSize(type, pDriveIdArray, lNumberOfDrives, pHints, pullMaxLunSize) {
        pullMaxLunSizeMarshal := pullMaxLunSize is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "int", type, "ptr", pDriveIdArray, "int", lNumberOfDrives, "ptr", pHints, pullMaxLunSizeMarshal, pullMaxLunSize, "HRESULT")
        return result
    }
}
