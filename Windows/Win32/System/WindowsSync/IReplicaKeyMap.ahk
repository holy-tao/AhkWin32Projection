#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a mapping between replica keys and replica IDs.
 * @remarks
 * 
 * Because replica IDs repeatedly occur in the metadata for a replica and are suggested to be 16-byte GUIDs, Windows Sync represents replica IDs by using a map between replica IDs to 4-byte replica keys. Windows Sync then uses replica keys where references to particular replicas are required.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ireplicakeymap
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IReplicaKeyMap extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReplicaKeyMap
     * @type {Guid}
     */
    static IID => Guid("{2209f4fc-fd10-4ff0-84a8-f0a1982e440e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LookupReplicaKey", "LookupReplicaId", "Serialize"]

    /**
     * Gets the replica key that corresponds to the specified replica ID.
     * @param {Pointer<Integer>} pbReplicaId The replica ID to look up.
     * @param {Pointer<Integer>} pdwReplicaKey Returns the replica key that corresponds to <i>pbReplicaId</i>.
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
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_ID_FORMAT_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When <i>pbReplicaId</i> is not in the format that is specified by the ID format schema of the provider.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_REPLICA_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When <i>pbReplicaId</i> is not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ireplicakeymap-lookupreplicakey
     */
    LookupReplicaKey(pbReplicaId, pdwReplicaKey) {
        pbReplicaIdMarshal := pbReplicaId is VarRef ? "char*" : "ptr"
        pdwReplicaKeyMarshal := pdwReplicaKey is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbReplicaIdMarshal, pbReplicaId, pdwReplicaKeyMarshal, pdwReplicaKey, "HRESULT")
        return result
    }

    /**
     * Gets the replica ID that corresponds to the specified replica key.
     * @param {Integer} dwReplicaKey The replica key to look up.
     * @param {Pointer<Integer>} pbReplicaId Returns the replica ID that corresponds to <i>dwReplicaKey</i>.
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
     * <dt><b>SYNC_E_REPLICA_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwReplicaKey</i> is not found.
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
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ireplicakeymap-lookupreplicaid
     */
    LookupReplicaId(dwReplicaKey, pbReplicaId, pcbIdSize) {
        pbReplicaIdMarshal := pbReplicaId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwReplicaKey, pbReplicaIdMarshal, pbReplicaId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    /**
     * Serializes the replica key map data to a byte array.
     * @param {Pointer<Integer>} pbReplicaKeyMap The byte array that receives the serialized data.
     * @param {Pointer<Integer>} pcbReplicaKeyMap Specifies the number of bytes in <i>pbReplicaKeyMap</i>. Returns the number of bytes required to serialize the replica key map data when <i>pbReplicaKeyMap</i> is too small, or returns the number of bytes written.
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
     * <td width="60%">
     * A replica ID or replica key stored in the map is not valid.
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
     * <i>pbReplicaKeyMap</i> is too small. In this case, the required number of bytes is returned in <i>pcbReplicaKeyMap</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ireplicakeymap-serialize
     */
    Serialize(pbReplicaKeyMap, pcbReplicaKeyMap) {
        pbReplicaKeyMapMarshal := pbReplicaKeyMap is VarRef ? "char*" : "ptr"
        pcbReplicaKeyMapMarshal := pcbReplicaKeyMap is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pbReplicaKeyMapMarshal, pbReplicaKeyMap, pcbReplicaKeyMapMarshal, pcbReplicaKeyMap, "HRESULT")
        return result
    }
}
