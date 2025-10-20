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
     * 
     * @param {Pointer<VDS_PACK_PROP>} pPackProp 
     * @returns {HRESULT} 
     */
    GetProperties(pPackProp) {
        result := ComCall(3, this, "ptr", pPackProp, "int")
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
    QueryVolumes(ppEnum) {
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
    QueryDisks(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    CreateVolume(type, pInputDiskArray, lNumberOfDisks, ulStripeSize, ppAsync) {
        result := ComCall(7, this, "int", type, "ptr", pInputDiskArray, "int", lNumberOfDisks, "uint", ulStripeSize, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} DiskId 
     * @param {Integer} PartitionStyle 
     * @param {BOOL} bAsHotSpare 
     * @returns {HRESULT} 
     */
    AddDisk(DiskId, PartitionStyle, bAsHotSpare) {
        result := ComCall(8, this, "ptr", DiskId, "int", PartitionStyle, "int", bAsHotSpare, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pDiskArray 
     * @param {Integer} lNumberOfDisks 
     * @param {Pointer<Guid>} TargetPack 
     * @param {BOOL} bForce 
     * @param {BOOL} bQueryOnly 
     * @param {Pointer<HRESULT>} pResults 
     * @param {Pointer<BOOL>} pbRebootNeeded 
     * @returns {HRESULT} 
     */
    MigrateDisks(pDiskArray, lNumberOfDisks, TargetPack, bForce, bQueryOnly, pResults, pbRebootNeeded) {
        result := ComCall(9, this, "ptr", pDiskArray, "int", lNumberOfDisks, "ptr", TargetPack, "int", bForce, "int", bQueryOnly, "ptr", pResults, "ptr", pbRebootNeeded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} OldDiskId 
     * @param {Pointer<Guid>} NewDiskId 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    ReplaceDisk(OldDiskId, NewDiskId, ppAsync) {
        result := ComCall(10, this, "ptr", OldDiskId, "ptr", NewDiskId, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} DiskId 
     * @returns {HRESULT} 
     */
    RemoveMissingDisk(DiskId) {
        result := ComCall(11, this, "ptr", DiskId, "int")
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
}
