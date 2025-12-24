#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncChange.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a change to a change unit that is contained in an item.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncchangeunit
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeUnit extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncChangeUnit
     * @type {Guid}
     */
    static IID => Guid("{60edd8ca-7341-4bb7-95ce-fab6394b51cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemChange", "GetChangeUnitId", "GetChangeUnitVersion"]

    /**
     * Gets the item change that contains this change unit change.
     * @returns {ISyncChange} Returns the item change that contains this change unit change.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangeunit-getitemchange
     */
    GetItemChange() {
        result := ComCall(3, this, "ptr*", &ppSyncChange := 0, "HRESULT")
        return ISyncChange(ppSyncChange)
    }

    /**
     * Retrieves the ID for this change unit.
     * @param {Pointer<Integer>} pbChangeUnitId Returns the ID of the change unit.
     * @param {Pointer<Integer>} pcbIdSize Specifies the number of bytes in <i>pbChangeUnitId</i>. Returns the number of bytes required to retrieve the ID if <i>pbChangeUnitId</i> is too small, or returns the number of bytes written.
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
     * <i>pbChangeUnitId</i> is too small. In this case, the required number of bytes is returned in <i>pcbIdSize</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangeunit-getchangeunitid
     */
    GetChangeUnitId(pbChangeUnitId, pcbIdSize) {
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pbChangeUnitIdMarshal, pbChangeUnitId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    /**
     * Gets the version for the change unit change.
     * @param {Pointer<Integer>} pbCurrentReplicaId The ID of the replica that originated the change to retrieve.
     * @param {Pointer<SYNC_VERSION>} pVersion Returns the version of the change.
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
     * <i>pbCurrentReplicaId</i> is not the correct replica ID.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangeunit-getchangeunitversion
     */
    GetChangeUnitVersion(pbCurrentReplicaId, pVersion) {
        pbCurrentReplicaIdMarshal := pbCurrentReplicaId is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pbCurrentReplicaIdMarshal, pbCurrentReplicaId, "ptr", pVersion, "HRESULT")
        return result
    }
}
