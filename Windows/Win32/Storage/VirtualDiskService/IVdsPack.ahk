#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to query and perform management operations on a pack containing disks and volumes.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdspack
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsPack extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsPack
     * @type {Guid}
     */
    static IID => Guid("{3b69d7f5-9d94-4648-91ca-79939ba263bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetProvider", "QueryVolumes", "QueryDisks", "CreateVolume", "AddDisk", "MigrateDisks", "ReplaceDisk", "RemoveMissingDisk", "Recover"]

    /**
     * 
     * @param {Pointer<VDS_PACK_PROP>} pPackProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdspack-getproperties
     */
    GetProperties(pPackProp) {
        result := ComCall(3, this, "ptr", pPackProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsProvider>} ppProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdspack-getprovider
     */
    GetProvider(ppProvider) {
        result := ComCall(4, this, "ptr*", ppProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdspack-queryvolumes
     */
    QueryVolumes(ppEnum) {
        result := ComCall(5, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdspack-querydisks
     */
    QueryDisks(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<VDS_INPUT_DISK>} pInputDiskArray 
     * @param {Integer} lNumberOfDisks 
     * @param {Integer} ulStripeSize 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdspack-createvolume
     */
    CreateVolume(type, pInputDiskArray, lNumberOfDisks, ulStripeSize, ppAsync) {
        result := ComCall(7, this, "int", type, "ptr", pInputDiskArray, "int", lNumberOfDisks, "uint", ulStripeSize, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} DiskId 
     * @param {Integer} PartitionStyle 
     * @param {BOOL} bAsHotSpare 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdspack-adddisk
     */
    AddDisk(DiskId, PartitionStyle, bAsHotSpare) {
        result := ComCall(8, this, "ptr", DiskId, "int", PartitionStyle, "int", bAsHotSpare, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pDiskArray 
     * @param {Integer} lNumberOfDisks 
     * @param {Guid} TargetPack 
     * @param {BOOL} bForce 
     * @param {BOOL} bQueryOnly 
     * @param {Pointer<HRESULT>} pResults 
     * @param {Pointer<BOOL>} pbRebootNeeded 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdspack-migratedisks
     */
    MigrateDisks(pDiskArray, lNumberOfDisks, TargetPack, bForce, bQueryOnly, pResults, pbRebootNeeded) {
        result := ComCall(9, this, "ptr", pDiskArray, "int", lNumberOfDisks, "ptr", TargetPack, "int", bForce, "int", bQueryOnly, "ptr", pResults, "ptr", pbRebootNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} OldDiskId 
     * @param {Guid} NewDiskId 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdspack-replacedisk
     */
    ReplaceDisk(OldDiskId, NewDiskId, ppAsync) {
        result := ComCall(10, this, "ptr", OldDiskId, "ptr", NewDiskId, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} DiskId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdspack-removemissingdisk
     */
    RemoveMissingDisk(DiskId) {
        result := ComCall(11, this, "ptr", DiskId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdspack-recover
     */
    Recover(ppAsync) {
        result := ComCall(12, this, "ptr*", ppAsync, "HRESULT")
        return result
    }
}
