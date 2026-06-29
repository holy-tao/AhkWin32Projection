#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Adds entries to an IReplicaKeyMap object.
 * @remarks
 * An <b>IConstructReplicaKeyMap</b> object can be obtained by passing <b>IID_IConstructReplicaKeyMap</b> to the <b>QueryInterface</b> method of an <b>IReplicaKeyMap</b> object.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-iconstructreplicakeymap
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IConstructReplicaKeyMap extends IUnknown {
    /**
     * The interface identifier for IConstructReplicaKeyMap
     * @type {Guid}
     */
    static IID := Guid("{ded10970-ec85-4115-b52c-4405845642a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IConstructReplicaKeyMap interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindOrAddReplica : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IConstructReplicaKeyMap.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iconstructreplicakeymap-findoraddreplica
     */
    FindOrAddReplica(pbReplicaId, pdwReplicaKey) {
        pbReplicaIdMarshal := pbReplicaId is VarRef ? "char*" : "ptr"
        pdwReplicaKeyMarshal := pdwReplicaKey is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbReplicaIdMarshal, pbReplicaId, pdwReplicaKeyMarshal, pdwReplicaKey, "HRESULT")
        return result
    }

    Query(iid) {
        if (IConstructReplicaKeyMap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindOrAddReplica := CallbackCreate(GetMethod(implObj, "FindOrAddReplica"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindOrAddReplica)
    }
}
