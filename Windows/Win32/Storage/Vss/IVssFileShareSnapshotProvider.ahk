#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//vsprov/nn-vsprov-ivssfilesharesnapshotprovider
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssFileShareSnapshotProvider extends IUnknown{
    /**
     * The interface identifier for IVssFileShareSnapshotProvider
     * @type {Guid}
     */
    static IID => Guid("{c8636060-7c2e-11df-8c4a-0800200c9a66}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lContext 
     * @returns {HRESULT} 
     */
    SetContext(lContext) {
        result := ComCall(3, this, "int", lContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} SnapshotId 
     * @param {Pointer<VSS_SNAPSHOT_PROP>} pProp 
     * @returns {HRESULT} 
     */
    GetSnapshotProperties(SnapshotId, pProp) {
        result := ComCall(4, this, "ptr", SnapshotId, "ptr", pProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} QueriedObjectId 
     * @param {Integer} eQueriedObjectType 
     * @param {Integer} eReturnedObjectsType 
     * @param {Pointer<IVssEnumObject>} ppEnum 
     * @returns {HRESULT} 
     */
    Query(QueriedObjectId, eQueriedObjectType, eReturnedObjectsType, ppEnum) {
        result := ComCall(5, this, "ptr", QueriedObjectId, "int", eQueriedObjectType, "int", eReturnedObjectsType, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} SourceObjectId 
     * @param {Integer} eSourceObjectType 
     * @param {BOOL} bForceDelete 
     * @param {Pointer<Int32>} plDeletedSnapshots 
     * @param {Pointer<Guid>} pNondeletedSnapshotID 
     * @returns {HRESULT} 
     */
    DeleteSnapshots(SourceObjectId, eSourceObjectType, bForceDelete, plDeletedSnapshots, pNondeletedSnapshotID) {
        result := ComCall(6, this, "ptr", SourceObjectId, "int", eSourceObjectType, "int", bForceDelete, "int*", plDeletedSnapshots, "ptr", pNondeletedSnapshotID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} SnapshotSetId 
     * @param {Pointer<Guid>} SnapshotId 
     * @param {Pointer<UInt16>} pwszSharePath 
     * @param {Integer} lNewContext 
     * @param {Pointer<Guid>} ProviderId 
     * @returns {HRESULT} 
     */
    BeginPrepareSnapshot(SnapshotSetId, SnapshotId, pwszSharePath, lNewContext, ProviderId) {
        result := ComCall(7, this, "ptr", SnapshotSetId, "ptr", SnapshotId, "ushort*", pwszSharePath, "int", lNewContext, "ptr", ProviderId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwszSharePath 
     * @param {Pointer<BOOL>} pbSupportedByThisProvider 
     * @returns {HRESULT} 
     */
    IsPathSupported(pwszSharePath, pbSupportedByThisProvider) {
        result := ComCall(8, this, "ushort*", pwszSharePath, "ptr", pbSupportedByThisProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwszSharePath 
     * @param {Pointer<BOOL>} pbSnapshotsPresent 
     * @param {Pointer<Int32>} plSnapshotCompatibility 
     * @returns {HRESULT} 
     */
    IsPathSnapshotted(pwszSharePath, pbSnapshotsPresent, plSnapshotCompatibility) {
        result := ComCall(9, this, "ushort*", pwszSharePath, "ptr", pbSnapshotsPresent, "int*", plSnapshotCompatibility, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} SnapshotId 
     * @param {Integer} eSnapshotPropertyId 
     * @param {VARIANT} vProperty 
     * @returns {HRESULT} 
     */
    SetSnapshotProperty(SnapshotId, eSnapshotPropertyId, vProperty) {
        result := ComCall(10, this, "ptr", SnapshotId, "int", eSnapshotPropertyId, "ptr", vProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
