#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing query and configuration operations on a subsystem using the VDS_HINTS2 and VDS_SUB_SYSTEM_PROP2 structures.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdssubsystem2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsSubSystem2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsSubSystem2
     * @type {Guid}
     */
    static IID => Guid("{be666735-7800-4a77-9d9c-40f85b87e292}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties2", "GetDrive2", "CreateLun2", "QueryMaxLunCreateSize2"]

    /**
     * 
     * @param {Pointer<VDS_SUB_SYSTEM_PROP2>} pSubSystemProp2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystem2-getproperties2
     */
    GetProperties2(pSubSystemProp2) {
        result := ComCall(3, this, "ptr", pSubSystemProp2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} sBusNumber 
     * @param {Integer} sSlotNumber 
     * @param {Integer} ulEnclosureNumber 
     * @param {Pointer<IVdsDrive>} ppDrive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystem2-getdrive2
     */
    GetDrive2(sBusNumber, sSlotNumber, ulEnclosureNumber, ppDrive) {
        result := ComCall(4, this, "short", sBusNumber, "short", sSlotNumber, "uint", ulEnclosureNumber, "ptr*", ppDrive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Integer} ullSizeInBytes 
     * @param {Pointer<Guid>} pDriveIdArray 
     * @param {Integer} lNumberOfDrives 
     * @param {PWSTR} pwszUnmaskingList 
     * @param {Pointer<VDS_HINTS2>} pHints2 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystem2-createlun2
     */
    CreateLun2(type, ullSizeInBytes, pDriveIdArray, lNumberOfDrives, pwszUnmaskingList, pHints2, ppAsync) {
        pwszUnmaskingList := pwszUnmaskingList is String ? StrPtr(pwszUnmaskingList) : pwszUnmaskingList

        result := ComCall(5, this, "int", type, "uint", ullSizeInBytes, "ptr", pDriveIdArray, "int", lNumberOfDrives, "ptr", pwszUnmaskingList, "ptr", pHints2, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<Guid>} pDriveIdArray 
     * @param {Integer} lNumberOfDrives 
     * @param {Pointer<VDS_HINTS2>} pHints2 
     * @param {Pointer<Integer>} pullMaxLunSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdssubsystem2-querymaxluncreatesize2
     */
    QueryMaxLunCreateSize2(type, pDriveIdArray, lNumberOfDrives, pHints2, pullMaxLunSize) {
        pullMaxLunSizeMarshal := pullMaxLunSize is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "int", type, "ptr", pDriveIdArray, "int", lNumberOfDrives, "ptr", pHints2, pullMaxLunSizeMarshal, pullMaxLunSize, "HRESULT")
        return result
    }
}
