#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a mapping between replica keys and replica IDs.
 * @remarks
 * Because replica IDs repeatedly occur in the metadata for a replica and are suggested to be 16-byte GUIDs, Windows Sync represents replica IDs by using a map between replica IDs to 4-byte replica keys. Windows Sync then uses replica keys where references to particular replicas are required.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-ireplicakeymap
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IReplicaKeyMap extends IUnknown {
    /**
     * The interface identifier for IReplicaKeyMap
     * @type {Guid}
     */
    static IID := Guid("{2209f4fc-fd10-4ff0-84a8-f0a1982e440e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IReplicaKeyMap interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LookupReplicaKey : IntPtr
        LookupReplicaId  : IntPtr
        Serialize        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IReplicaKeyMap.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ireplicakeymap-lookupreplicakey
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ireplicakeymap-lookupreplicaid
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ireplicakeymap-serialize
     */
    Serialize(pbReplicaKeyMap, pcbReplicaKeyMap) {
        pbReplicaKeyMapMarshal := pbReplicaKeyMap is VarRef ? "char*" : "ptr"
        pcbReplicaKeyMapMarshal := pcbReplicaKeyMap is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pbReplicaKeyMapMarshal, pbReplicaKeyMap, pcbReplicaKeyMapMarshal, pcbReplicaKeyMap, "HRESULT")
        return result
    }

    Query(iid) {
        if (IReplicaKeyMap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LookupReplicaKey := CallbackCreate(GetMethod(implObj, "LookupReplicaKey"), flags, 3)
        this.vtbl.LookupReplicaId := CallbackCreate(GetMethod(implObj, "LookupReplicaId"), flags, 4)
        this.vtbl.Serialize := CallbackCreate(GetMethod(implObj, "Serialize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LookupReplicaKey)
        CallbackFree(this.vtbl.LookupReplicaId)
        CallbackFree(this.vtbl.Serialize)
    }
}
