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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetSubSystem", "GetIdentificationData", "QueryActiveControllers", "Extend", "Shrink", "QueryPlexes", "AddPlex", "RemovePlex", "Recover", "SetMask", "Delete", "AssociateControllers", "QueryHints", "ApplyHints", "SetStatus", "QueryMaxLunExtendSize"]

    /**
     * 
     * @param {Pointer<VDS_LUN_PROP>} pLunProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-getproperties
     */
    GetProperties(pLunProp) {
        result := ComCall(3, this, "ptr", pLunProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsSubSystem>} ppSubSystem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-getsubsystem
     */
    GetSubSystem(ppSubSystem) {
        result := ComCall(4, this, "ptr*", ppSubSystem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_LUN_INFORMATION>} pLunInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-getidentificationdata
     */
    GetIdentificationData(pLunInfo) {
        result := ComCall(5, this, "ptr", pLunInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-queryactivecontrollers
     */
    QueryActiveControllers(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullNumberOfBytesToAdd 
     * @param {Pointer<Guid>} pDriveIdArray 
     * @param {Integer} lNumberOfDrives 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-extend
     */
    Extend(ullNumberOfBytesToAdd, pDriveIdArray, lNumberOfDrives, ppAsync) {
        result := ComCall(7, this, "uint", ullNumberOfBytesToAdd, "ptr", pDriveIdArray, "int", lNumberOfDrives, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullNumberOfBytesToRemove 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-shrink
     */
    Shrink(ullNumberOfBytesToRemove, ppAsync) {
        result := ComCall(8, this, "uint", ullNumberOfBytesToRemove, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-queryplexes
     */
    QueryPlexes(ppEnum) {
        result := ComCall(9, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} lunId 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-addplex
     */
    AddPlex(lunId, ppAsync) {
        result := ComCall(10, this, "ptr", lunId, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} plexId 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-removeplex
     */
    RemovePlex(plexId, ppAsync) {
        result := ComCall(11, this, "ptr", plexId, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-recover
     */
    Recover(ppAsync) {
        result := ComCall(12, this, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszUnmaskingList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-setmask
     */
    SetMask(pwszUnmaskingList) {
        pwszUnmaskingList := pwszUnmaskingList is String ? StrPtr(pwszUnmaskingList) : pwszUnmaskingList

        result := ComCall(13, this, "ptr", pwszUnmaskingList, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-delete
     */
    Delete() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pActiveControllerIdArray 
     * @param {Integer} lNumberOfActiveControllers 
     * @param {Pointer<Guid>} pInactiveControllerIdArray 
     * @param {Integer} lNumberOfInactiveControllers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-associatecontrollers
     */
    AssociateControllers(pActiveControllerIdArray, lNumberOfActiveControllers, pInactiveControllerIdArray, lNumberOfInactiveControllers) {
        result := ComCall(15, this, "ptr", pActiveControllerIdArray, "int", lNumberOfActiveControllers, "ptr", pInactiveControllerIdArray, "int", lNumberOfInactiveControllers, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_HINTS>} pHints 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-queryhints
     */
    QueryHints(pHints) {
        result := ComCall(16, this, "ptr", pHints, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_HINTS>} pHints 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-applyhints
     */
    ApplyHints(pHints) {
        result := ComCall(17, this, "ptr", pHints, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-setstatus
     */
    SetStatus(status) {
        result := ComCall(18, this, "int", status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pDriveIdArray 
     * @param {Integer} lNumberOfDrives 
     * @param {Pointer<Integer>} pullMaxBytesToBeAdded 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-querymaxlunextendsize
     */
    QueryMaxLunExtendSize(pDriveIdArray, lNumberOfDrives, pullMaxBytesToBeAdded) {
        result := ComCall(19, this, "ptr", pDriveIdArray, "int", lNumberOfDrives, "uint*", pullMaxBytesToBeAdded, "HRESULT")
        return result
    }
}
