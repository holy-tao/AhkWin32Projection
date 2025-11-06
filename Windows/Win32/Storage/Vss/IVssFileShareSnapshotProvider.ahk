#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VSS_SNAPSHOT_PROP.ahk
#Include .\IVssEnumObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//vsprov/nn-vsprov-ivssfilesharesnapshotprovider
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssFileShareSnapshotProvider extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetContext", "GetSnapshotProperties", "Query", "DeleteSnapshots", "BeginPrepareSnapshot", "IsPathSupported", "IsPathSnapshotted", "SetSnapshotProperty"]

    /**
     * 
     * @param {Integer} lContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssfilesharesnapshotprovider-setcontext
     */
    SetContext(lContext) {
        result := ComCall(3, this, "int", lContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} SnapshotId 
     * @returns {VSS_SNAPSHOT_PROP} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssfilesharesnapshotprovider-getsnapshotproperties
     */
    GetSnapshotProperties(SnapshotId) {
        pProp := VSS_SNAPSHOT_PROP()
        result := ComCall(4, this, "ptr", SnapshotId, "ptr", pProp, "HRESULT")
        return pProp
    }

    /**
     * 
     * @param {Guid} QueriedObjectId 
     * @param {Integer} eQueriedObjectType 
     * @param {Integer} eReturnedObjectsType 
     * @returns {IVssEnumObject} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssfilesharesnapshotprovider-query
     */
    Query(QueriedObjectId, eQueriedObjectType, eReturnedObjectsType) {
        result := ComCall(5, this, "ptr", QueriedObjectId, "int", eQueriedObjectType, "int", eReturnedObjectsType, "ptr*", &ppEnum := 0, "HRESULT")
        return IVssEnumObject(ppEnum)
    }

    /**
     * 
     * @param {Guid} SourceObjectId 
     * @param {Integer} eSourceObjectType 
     * @param {BOOL} bForceDelete 
     * @param {Pointer<Integer>} plDeletedSnapshots 
     * @param {Pointer<Guid>} pNondeletedSnapshotID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssfilesharesnapshotprovider-deletesnapshots
     */
    DeleteSnapshots(SourceObjectId, eSourceObjectType, bForceDelete, plDeletedSnapshots, pNondeletedSnapshotID) {
        plDeletedSnapshotsMarshal := plDeletedSnapshots is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", SourceObjectId, "int", eSourceObjectType, "int", bForceDelete, plDeletedSnapshotsMarshal, plDeletedSnapshots, "ptr", pNondeletedSnapshotID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} SnapshotSetId 
     * @param {Guid} SnapshotId 
     * @param {Pointer<Integer>} pwszSharePath 
     * @param {Integer} lNewContext 
     * @param {Guid} ProviderId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssfilesharesnapshotprovider-beginpreparesnapshot
     */
    BeginPrepareSnapshot(SnapshotSetId, SnapshotId, pwszSharePath, lNewContext, ProviderId) {
        pwszSharePathMarshal := pwszSharePath is VarRef ? "ushort*" : "ptr"

        result := ComCall(7, this, "ptr", SnapshotSetId, "ptr", SnapshotId, pwszSharePathMarshal, pwszSharePath, "int", lNewContext, "ptr", ProviderId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwszSharePath 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssfilesharesnapshotprovider-ispathsupported
     */
    IsPathSupported(pwszSharePath) {
        pwszSharePathMarshal := pwszSharePath is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, pwszSharePathMarshal, pwszSharePath, "int*", &pbSupportedByThisProvider := 0, "HRESULT")
        return pbSupportedByThisProvider
    }

    /**
     * 
     * @param {Pointer<Integer>} pwszSharePath 
     * @param {Pointer<BOOL>} pbSnapshotsPresent 
     * @param {Pointer<Integer>} plSnapshotCompatibility 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssfilesharesnapshotprovider-ispathsnapshotted
     */
    IsPathSnapshotted(pwszSharePath, pbSnapshotsPresent, plSnapshotCompatibility) {
        pwszSharePathMarshal := pwszSharePath is VarRef ? "ushort*" : "ptr"
        pbSnapshotsPresentMarshal := pbSnapshotsPresent is VarRef ? "int*" : "ptr"
        plSnapshotCompatibilityMarshal := plSnapshotCompatibility is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pwszSharePathMarshal, pwszSharePath, pbSnapshotsPresentMarshal, pbSnapshotsPresent, plSnapshotCompatibilityMarshal, plSnapshotCompatibility, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} SnapshotId 
     * @param {Integer} eSnapshotPropertyId 
     * @param {VARIANT} vProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssfilesharesnapshotprovider-setsnapshotproperty
     */
    SetSnapshotProperty(SnapshotId, eSnapshotPropertyId, vProperty) {
        result := ComCall(10, this, "ptr", SnapshotId, "int", eSnapshotPropertyId, "ptr", vProperty, "HRESULT")
        return result
    }
}
