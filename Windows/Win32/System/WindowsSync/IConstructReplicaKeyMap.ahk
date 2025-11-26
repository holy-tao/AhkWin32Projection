#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Adds entries to an IReplicaKeyMap object.
 * @remarks
 * 
 * An <b>IConstructReplicaKeyMap</b> object can be obtained by passing <b>IID_IConstructReplicaKeyMap</b> to the <b>QueryInterface</b> method of an <b>IReplicaKeyMap</b> object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-iconstructreplicakeymap
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IConstructReplicaKeyMap extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConstructReplicaKeyMap
     * @type {Guid}
     */
    static IID => Guid("{ded10970-ec85-4115-b52c-4405845642a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindOrAddReplica"]

    /**
     * Adds entries to or finds entries in an IReplicaKeyMap object.
     * @param {Pointer<Integer>} pbReplicaId The ID of the replica to add or find.
     * @param {Pointer<Integer>} pdwReplicaKey The key of the replica in the map. If an entry for <i>pbReplicaId</i> does not exist in the map, an entry is created and a new key is assigned to it.
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
     * <dt><b>SYNC_E_ID_FORMAT_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbReplicaId</i> is not of the format that the provider specified.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iconstructreplicakeymap-findoraddreplica
     */
    FindOrAddReplica(pbReplicaId, pdwReplicaKey) {
        pbReplicaIdMarshal := pbReplicaId is VarRef ? "char*" : "ptr"
        pdwReplicaKeyMarshal := pdwReplicaKey is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbReplicaIdMarshal, pbReplicaId, pdwReplicaKeyMarshal, pdwReplicaKey, "HRESULT")
        return result
    }
}
