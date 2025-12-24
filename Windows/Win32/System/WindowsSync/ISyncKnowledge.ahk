#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IReplicaKeyMap.ahk
#Include .\ISyncKnowledge.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents knowledge that a replica has about its item store.
 * @remarks
 * 
 * Be aware that there is no single representation of knowledge. Equivalent knowledge might be represented in different forms and return different values from knowledge inspection methods, such as <b>GetScopeVector</b>, <b>GetRangeExceptions</b>, <b>GetSingleItemExceptions</b>, <b>GetChangeUnitExceptions</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncknowledge
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncKnowledge extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncKnowledge
     * @type {Guid}
     */
    static IID => Guid("{615bbb53-c945-4203-bf4b-2cb65919a0aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOwnerReplicaId", "Serialize", "SetLocalTickCount", "ContainsChange", "ContainsChangeUnit", "GetScopeVector", "GetReplicaKeyMap", "Clone", "ConvertVersion", "MapRemoteToLocal", "Union", "ProjectOntoItem", "ProjectOntoChangeUnit", "ProjectOntoRange", "ExcludeItem", "ExcludeChangeUnit", "ContainsKnowledge", "FindMinTickCountForReplica", "GetRangeExceptions", "GetSingleItemExceptions", "GetChangeUnitExceptions", "FindClockVectorForItem", "FindClockVectorForChangeUnit", "GetVersion"]

    /**
     * Gets the ID of the replica that owns this knowledge.
     * @param {Pointer<Integer>} pbReplicaId Returns the ID of the replica that owns this knowledge.
     * @param {Pointer<Integer>} pcbIdSize Specifies the number of bytes in <i>pbReplicaId</i>. Returns the number of bytes required to retrieve the ID when <i>pbReplicaId</i> is too small, or returns the number of bytes written.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbReplicaId</i> is too small. In this case, the required number of bytes is returned in <i>pcbIdSize</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-getownerreplicaid
     */
    GetOwnerReplicaId(pbReplicaId, pcbIdSize) {
        pbReplicaIdMarshal := pbReplicaId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbReplicaIdMarshal, pbReplicaId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    /**
     * Serializes the knowledge object data to a byte array.
     * @param {BOOL} fSerializeReplicaKeyMap <b>TRUE</b> to serialize the <b>IReplicaKeyMap</b> object that is contained in the knowledge; otherwise, <b>FALSE</b>.
     * @param {Pointer<Integer>} pbKnowledge The byte array that receives the serialized knowledge data.
     * @param {Pointer<Integer>} pcbKnowledge Specifies the number of bytes in <i>pbKnowledge</i>. Returns the number of bytes required to serialize the replica key map data when <i>pbKnowledge</i> is too small, or returns the number of bytes written.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbKnowledge</i> is too small. In this case, the required number of bytes is returned in <i>pbKnowledge</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-serialize
     */
    Serialize(fSerializeReplicaKeyMap, pbKnowledge, pcbKnowledge) {
        pbKnowledgeMarshal := pbKnowledge is VarRef ? "char*" : "ptr"
        pcbKnowledgeMarshal := pcbKnowledge is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "int", fSerializeReplicaKeyMap, pbKnowledgeMarshal, pbKnowledge, pcbKnowledgeMarshal, pcbKnowledge, "HRESULT")
        return result
    }

    /**
     * Sets the tick count for the replica that owns this knowledge.
     * @param {Integer} ullTickCount The current tick count for the replica that owns this knowledge.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-setlocaltickcount
     */
    SetLocalTickCount(ullTickCount) {
        result := ComCall(5, this, "uint", ullTickCount, "HRESULT")
        return result
    }

    /**
     * Indicates whether the specified item change is known by this knowledge.
     * @param {Pointer<Integer>} pbVersionOwnerReplicaId The ID of the replica that originated the change.
     * @param {Pointer<Integer>} pgidItemId The ID of the item that changed.
     * @param {Pointer<SYNC_VERSION>} pSyncVersion The version of the change.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified change is not contained in the knowledge.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-containschange
     */
    ContainsChange(pbVersionOwnerReplicaId, pgidItemId, pSyncVersion) {
        pbVersionOwnerReplicaIdMarshal := pbVersionOwnerReplicaId is VarRef ? "char*" : "ptr"
        pgidItemIdMarshal := pgidItemId is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pbVersionOwnerReplicaIdMarshal, pbVersionOwnerReplicaId, pgidItemIdMarshal, pgidItemId, "ptr", pSyncVersion, "HRESULT")
        return result
    }

    /**
     * Indicates whether the specified change unit change is known by this knowledge.
     * @param {Pointer<Integer>} pbVersionOwnerReplicaId The ID of the replica that originated the change unit change.
     * @param {Pointer<Integer>} pbItemId The ID of the item that contains the change unit to look up.
     * @param {Pointer<Integer>} pbChangeUnitId The ID of the change unit to look up.
     * @param {Pointer<SYNC_VERSION>} pSyncVersion The version of the change unit change to look up.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified change unit change is contained in the knowledge.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified change unit change is not contained in the knowledge.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-containschangeunit
     */
    ContainsChangeUnit(pbVersionOwnerReplicaId, pbItemId, pbChangeUnitId, pSyncVersion) {
        pbVersionOwnerReplicaIdMarshal := pbVersionOwnerReplicaId is VarRef ? "char*" : "ptr"
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, pbVersionOwnerReplicaIdMarshal, pbVersionOwnerReplicaId, pbItemIdMarshal, pbItemId, pbChangeUnitIdMarshal, pbChangeUnitId, "ptr", pSyncVersion, "HRESULT")
        return result
    }

    /**
     * Gets the clock vector that defines the changes that are contained in the knowledge.
     * @param {Pointer<Guid>} riid The IID of the object to retrieve. Must be <b>IID_IClockVector</b>.
     * @param {Pointer<Pointer<Void>>} ppUnk Returns an object that implements <i>riid</i> and that represents the clock vector that defines the changes that are contained in the knowledge.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-getscopevector
     */
    GetScopeVector(riid, ppUnk) {
        ppUnkMarshal := ppUnk is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", riid, ppUnkMarshal, ppUnk, "HRESULT")
        return result
    }

    /**
     * Gets the IReplicaKeyMap object that is associated with this knowledge.
     * @returns {IReplicaKeyMap} Returns the <b>IReplicaKeyMap</b> object that is associated with this knowledge.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-getreplicakeymap
     */
    GetReplicaKeyMap() {
        result := ComCall(9, this, "ptr*", &ppReplicaKeyMap := 0, "HRESULT")
        return IReplicaKeyMap(ppReplicaKeyMap)
    }

    /**
     * Creates a new instance of this object, and copies the data from this object to the new object.
     * @returns {ISyncKnowledge} Returns the newly created knowledge object.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-clone
     */
    Clone() {
        result := ComCall(10, this, "ptr*", &ppClonedKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppClonedKnowledge)
    }

    /**
     * Converts a version from another replica into one that is compatible with the replica that owns this knowledge.
     * @param {ISyncKnowledge} pKnowledgeIn A knowledge that is valid for <i>pbCurrentOwnerId</i> and that contains <i>pVersionIn</i>.
     * @param {Pointer<Integer>} pbCurrentOwnerId The ID of the replica that owns <i>pVersionIn</i>.
     * @param {Pointer<SYNC_VERSION>} pVersionIn The version to convert.
     * @param {Pointer<Integer>} pbNewOwnerId Returns the ID of the replica that owns the converted version.
     * @param {Pointer<Integer>} pcbIdSize Specifies the number of bytes in <i>pbNewOwnerId</i>. Returns the number of bytes required to retrieve the ID when <i>pbNewOwnerId</i> is too small, or returns the number of bytes written.
     * @param {Pointer<SYNC_VERSION>} pVersionOut Returns the version. This is converted to be valid for the replica that owns this knowledge.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbNewOwnerId</i> is too small. In this case, the required number of bytes is returned in <i>pcbIdSize</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-convertversion
     */
    ConvertVersion(pKnowledgeIn, pbCurrentOwnerId, pVersionIn, pbNewOwnerId, pcbIdSize, pVersionOut) {
        pbCurrentOwnerIdMarshal := pbCurrentOwnerId is VarRef ? "char*" : "ptr"
        pbNewOwnerIdMarshal := pbNewOwnerId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", pKnowledgeIn, pbCurrentOwnerIdMarshal, pbCurrentOwnerId, "ptr", pVersionIn, pbNewOwnerIdMarshal, pbNewOwnerId, pcbIdSizeMarshal, pcbIdSize, "ptr", pVersionOut, "HRESULT")
        return result
    }

    /**
     * Converts a knowledge object from another replica into one that is compatible with the replica that owns this knowledge.
     * @param {ISyncKnowledge} pRemoteKnowledge A knowledge object that is owned by another replica.
     * @returns {ISyncKnowledge} Returns the knowledge object, converted for use by the replica that owns this knowledge.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-mapremotetolocal
     */
    MapRemoteToLocal(pRemoteKnowledge) {
        result := ComCall(12, this, "ptr", pRemoteKnowledge, "ptr*", &ppMappedKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppMappedKnowledge)
    }

    /**
     * Combines the specified knowledge with the current knowledge.
     * @param {ISyncKnowledge} pKnowledge The knowledge to combine with the current knowledge.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-union
     */
    Union(pKnowledge) {
        result := ComCall(13, this, "ptr", pKnowledge, "HRESULT")
        return result
    }

    /**
     * Gets the knowledge for the specified item.
     * @param {Pointer<Integer>} pbItemId The ID of the item to look up.
     * @returns {ISyncKnowledge} Returns a knowledge object that contains only the item specified by <i>pbItemId</i>.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-projectontoitem
     */
    ProjectOntoItem(pbItemId) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"

        result := ComCall(14, this, pbItemIdMarshal, pbItemId, "ptr*", &ppKnowledgeOut := 0, "HRESULT")
        return ISyncKnowledge(ppKnowledgeOut)
    }

    /**
     * Gets the knowledge for the specified change unit.
     * @param {Pointer<Integer>} pbItemId The ID of the item that contains the change unit to look up.
     * @param {Pointer<Integer>} pbChangeUnitId The ID of the change unit to look up.
     * @returns {ISyncKnowledge} Returns a knowledge object that contains only the change unit specified by <i>pbChangeUnitId</i>.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-projectontochangeunit
     */
    ProjectOntoChangeUnit(pbItemId, pbChangeUnitId) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"

        result := ComCall(15, this, pbItemIdMarshal, pbItemId, pbChangeUnitIdMarshal, pbChangeUnitId, "ptr*", &ppKnowledgeOut := 0, "HRESULT")
        return ISyncKnowledge(ppKnowledgeOut)
    }

    /**
     * Gets the knowledge for the specified range of item IDs.
     * @param {Pointer<SYNC_RANGE>} psrngSyncRange The range of item IDs to look up.
     * @returns {ISyncKnowledge} Returns a knowledge object that contains only the range of item IDs specified by <i>psrngSyncRange</i>.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-projectontorange
     */
    ProjectOntoRange(psrngSyncRange) {
        result := ComCall(16, this, "ptr", psrngSyncRange, "ptr*", &ppKnowledgeOut := 0, "HRESULT")
        return ISyncKnowledge(ppKnowledgeOut)
    }

    /**
     * Removes knowledge about the specified item from the knowledge.
     * @param {Pointer<Integer>} pbItemId The ID of the item to remove from the knowledge.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-excludeitem
     */
    ExcludeItem(pbItemId) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"

        result := ComCall(17, this, pbItemIdMarshal, pbItemId, "HRESULT")
        return result
    }

    /**
     * Removes knowledge about the specified change unit from the knowledge.
     * @param {Pointer<Integer>} pbItemId The ID of the item that contains the change unit to exclude from the knowledge.
     * @param {Pointer<Integer>} pbChangeUnitId The ID of the change unit to exclude from the knowledge.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-excludechangeunit
     */
    ExcludeChangeUnit(pbItemId, pbChangeUnitId) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"

        result := ComCall(18, this, pbItemIdMarshal, pbItemId, pbChangeUnitIdMarshal, pbChangeUnitId, "HRESULT")
        return result
    }

    /**
     * Indicates whether the specified knowledge is known by this knowledge.
     * @param {ISyncKnowledge} pKnowledge The knowledge to look up.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pSyncKnowledge</i> is known.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pSyncKnowledge</i> is not known.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-containsknowledge
     */
    ContainsKnowledge(pKnowledge) {
        result := ComCall(19, this, "ptr", pKnowledge, "HRESULT")
        return result
    }

    /**
     * Finds the minimum tick count in the knowledge for the specified replica.
     * @param {Pointer<Integer>} pbReplicaId The ID of the replica to look up.
     * @param {Pointer<Integer>} pullReplicaTickCount Returns the minimum tick count in the knowledge for <i>pbReplicaId</i>.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-findmintickcountforreplica
     */
    FindMinTickCountForReplica(pbReplicaId, pullReplicaTickCount) {
        pbReplicaIdMarshal := pbReplicaId is VarRef ? "char*" : "ptr"
        pullReplicaTickCountMarshal := pullReplicaTickCount is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, pbReplicaIdMarshal, pbReplicaId, pullReplicaTickCountMarshal, pullReplicaTickCount, "HRESULT")
        return result
    }

    /**
     * Gets an object that can enumerate the IRangeException objects that are stored in the knowledge.
     * @param {Pointer<Guid>} riid The IID of the object to retrieve. Must be <b>IID_IEnumRangeExceptions</b>.
     * @param {Pointer<Pointer<Void>>} ppUnk Returns an object that implements <i>riid</i> and that can enumerate the list of <b>IRangeException</b> objects that is contained in the knowledge.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-getrangeexceptions
     */
    GetRangeExceptions(riid, ppUnk) {
        ppUnkMarshal := ppUnk is VarRef ? "ptr*" : "ptr"

        result := ComCall(21, this, "ptr", riid, ppUnkMarshal, ppUnk, "HRESULT")
        return result
    }

    /**
     * Gets an object that can enumerate the ISingleItemException objects that are stored in the knowledge.
     * @param {Pointer<Guid>} riid The IID of the object to retrieve. Must be <b>IID_IEnumSingleItemExceptions</b>.
     * @param {Pointer<Pointer<Void>>} ppUnk Returns an object that implements <i>riid</i> and that can enumerate the list of <b>ISingleItemException</b> objects that is contained in the knowledge.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-getsingleitemexceptions
     */
    GetSingleItemExceptions(riid, ppUnk) {
        ppUnkMarshal := ppUnk is VarRef ? "ptr*" : "ptr"

        result := ComCall(22, this, "ptr", riid, ppUnkMarshal, ppUnk, "HRESULT")
        return result
    }

    /**
     * Gets an object that can enumerate the IChangeUnitException objects that are stored in the knowledge.
     * @param {Pointer<Guid>} riid The IID of the object to retrieve. Must be <b>IID_IEnumChangeUnitExceptions</b>.
     * @param {Pointer<Pointer<Void>>} ppUnk Returns an object that implements <i>riid</i> and that can enumerate the list of <b>IChangeUnitException</b> objects that is contained in the knowledge.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-getchangeunitexceptions
     */
    GetChangeUnitExceptions(riid, ppUnk) {
        ppUnkMarshal := ppUnk is VarRef ? "ptr*" : "ptr"

        result := ComCall(23, this, "ptr", riid, ppUnkMarshal, ppUnk, "HRESULT")
        return result
    }

    /**
     * Gets the clock vector that is associated with the specified item ID.
     * @param {Pointer<Integer>} pbItemId The ID of the item that is associated with the clock vector to find.
     * @param {Pointer<Guid>} riid The IID of the object to retrieve. Must be <b>IID_IFeedClockVector</b> or <b>IID_IClockVector</b>.
     * @param {Pointer<Pointer<Void>>} ppUnk Returns an object that implements <i>riid</i> and that represents the clock vector associated with <i>pbItemId</i>.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-findclockvectorforitem
     */
    FindClockVectorForItem(pbItemId, riid, ppUnk) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        ppUnkMarshal := ppUnk is VarRef ? "ptr*" : "ptr"

        result := ComCall(24, this, pbItemIdMarshal, pbItemId, "ptr", riid, ppUnkMarshal, ppUnk, "HRESULT")
        return result
    }

    /**
     * Gets the clock vector that is associated with the specified change unit ID.
     * @param {Pointer<Integer>} pbItemId The ID of the item that contains the change unit that is associated with the clock vector to retrieve.
     * @param {Pointer<Integer>} pbChangeUnitId The ID of the change unit that is associated with the clock vector to retrieve.
     * @param {Pointer<Guid>} riid The IID of the object to retrieve. Must be <b>IID_IEnumClockVector</b>.
     * @param {Pointer<Pointer<Void>>} ppUnk Returns an object that implements <i>riid</i> and that can enumerate the list of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-iclockvector">IClockVector</a> objects that is associated with  <i>pbChangeUnitId</i>.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-findclockvectorforchangeunit
     */
    FindClockVectorForChangeUnit(pbItemId, pbChangeUnitId, riid, ppUnk) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"
        ppUnkMarshal := ppUnk is VarRef ? "ptr*" : "ptr"

        result := ComCall(25, this, pbItemIdMarshal, pbItemId, pbChangeUnitIdMarshal, pbChangeUnitId, "ptr", riid, ppUnkMarshal, ppUnk, "HRESULT")
        return result
    }

    /**
     * Gets the version of this knowledge structure.
     * @param {Pointer<Integer>} pdwVersion Returns the version of this knowledge structure. is one of the values in the <a href="https://docs.microsoft.com/windows/win32/api/winsync/ne-winsync-sync_serialization_version">SYNC_SERIALIZATION_VERSION</a> enumeration.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncknowledge-getversion
     */
    GetVersion(pdwVersion) {
        pdwVersionMarshal := pdwVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, pdwVersionMarshal, pdwVersion, "HRESULT")
        return result
    }
}
