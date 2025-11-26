#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumSyncChangeUnits.ahk
#Include .\ISyncKnowledge.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a change to an item.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncchange
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChange extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncChange
     * @type {Guid}
     */
    static IID => Guid("{a1952beb-0f6b-4711-b136-01da85b968a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOwnerReplicaId", "GetRootItemId", "GetChangeVersion", "GetCreationVersion", "GetFlags", "GetWorkEstimate", "GetChangeUnits", "GetMadeWithKnowledge", "GetLearnedKnowledge", "SetWorkEstimate"]

    /**
     * Gets the ID of the replica that originated this change.
     * @param {Pointer<Integer>} pbReplicaId Returns the ID of the replica that originated this change.
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
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbReplicaId</i> is too small. In this case, the required number of bytes is returned in <i>pcbIdSize</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchange-getownerreplicaid
     */
    GetOwnerReplicaId(pbReplicaId, pcbIdSize) {
        pbReplicaIdMarshal := pbReplicaId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbReplicaIdMarshal, pbReplicaId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    /**
     * Gets the ID of the changed item.
     * @param {Pointer<Integer>} pbRootItemId Returns the ID of the item.
     * @param {Pointer<Integer>} pcbIdSize Specifies the number of bytes in <i>pbRootItemId</i>. Returns the number of bytes required to retrieve the ID when <i>pbRootItemId</i> is too small, or returns the number of bytes written.
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
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbRootItemId</i> is too small. In this case, the required number of bytes is returned in <i>pcbIdSize</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchange-getrootitemid
     */
    GetRootItemId(pbRootItemId, pcbIdSize) {
        pbRootItemIdMarshal := pbRootItemId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pbRootItemIdMarshal, pbRootItemId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    /**
     * Gets the version that is associated with this change.
     * @param {Pointer<Integer>} pbCurrentReplicaId The ID of the replica that owns this change. The ID format must match the format that is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/winsync/ns-winsync-id_parameters">ID_PARAMETERS</a> property of the provider.
     * @param {Pointer<SYNC_VERSION>} pVersion Returns the change version of the item.
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
     * <td width="60%">
     * <i> pbCurrentReplicaId</i> is not the correct replica ID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_ITEM_HAS_NO_VERSION_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item has been forgotten.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_ID_FORMAT_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i> pbCurrentReplicaId</i> is not in the format that is specified by the ID format schema of the provider.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_ITEM_HAS_CHANGE_UNITS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item has change units.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchange-getchangeversion
     */
    GetChangeVersion(pbCurrentReplicaId, pVersion) {
        pbCurrentReplicaIdMarshal := pbCurrentReplicaId is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pbCurrentReplicaIdMarshal, pbCurrentReplicaId, "ptr", pVersion, "HRESULT")
        return result
    }

    /**
     * Gets the creation version of the changed item.
     * @param {Pointer<Integer>} pbCurrentReplicaId The ID of the replica that owns this change. The ID format must match the format that is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/winsync/ns-winsync-id_parameters">ID_PARAMETERS</a> property of the provider.
     * @param {Pointer<SYNC_VERSION>} pVersion Returns the creation version of the item.
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
     * <td width="60%">
     * <i> pbCurrentReplicaId</i> is not the correct replica ID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_ID_FORMAT_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i> pbCurrentReplicaId</i> is not in the format that is specified by the ID format schema of the provider.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchange-getcreationversion
     */
    GetCreationVersion(pbCurrentReplicaId, pVersion) {
        pbCurrentReplicaIdMarshal := pbCurrentReplicaId is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pbCurrentReplicaIdMarshal, pbCurrentReplicaId, "ptr", pVersion, "HRESULT")
        return result
    }

    /**
     * Gets flags that are associated with this change.
     * @param {Pointer<Integer>} pdwFlags Returns the flags that are associated with this change. This will be a combination of <b>SYNC_CHANGE_FLAG</b> values (See Remarks).
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchange-getflags
     */
    GetFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * Gets the work estimate for this change.
     * @param {Pointer<Integer>} pdwWork The work estimate for this change. The default value is zero.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchange-getworkestimate
     */
    GetWorkEstimate(pdwWork) {
        pdwWorkMarshal := pdwWork is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwWorkMarshal, pdwWork, "HRESULT")
        return result
    }

    /**
     * Gets an object that can enumerate change units that are contained in this change.
     * @returns {IEnumSyncChangeUnits} Returns a change unit enumerator. Returns <b>NULL</b> when this change does not contain change units.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchange-getchangeunits
     */
    GetChangeUnits() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSyncChangeUnits(ppEnum)
    }

    /**
     * Gets the made-with knowledge for this change.
     * @returns {ISyncKnowledge} Returns the made-with knowledge for this change. The made-with knowledge for a change is typically the knowledge that the replica had when this change was made. This knowledge is only meaningful when the <b>ISyncChange</b> object represents a change from the source provider.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchange-getmadewithknowledge
     */
    GetMadeWithKnowledge() {
        result := ComCall(10, this, "ptr*", &ppMadeWithKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppMadeWithKnowledge)
    }

    /**
     * Gets the knowledge that a replica will learn when this change is applied to its item store.
     * @returns {ISyncKnowledge} Returns the knowledge that a replica will learn when this change is applied to its item store. This knowledge is valid only when the current knowledge of the replica contains the prerequisite knowledge of the change batch that contains this change. This knowledge is only meaningful when the <b>ISyncChange</b> object represents a change from the source provider.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchange-getlearnedknowledge
     */
    GetLearnedKnowledge() {
        result := ComCall(11, this, "ptr*", &ppLearnedKnowledge := 0, "HRESULT")
        return ISyncKnowledge(ppLearnedKnowledge)
    }

    /**
     * Sets the work estimate for this change.
     * @param {Integer} dwWork The work estimate for this change.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchange-setworkestimate
     */
    SetWorkEstimate(dwWork) {
        result := ComCall(12, this, "uint", dwWork, "HRESULT")
        return result
    }
}
