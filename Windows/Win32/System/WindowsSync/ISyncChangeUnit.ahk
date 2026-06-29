#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISyncChange.ahk" { ISyncChange }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\SYNC_VERSION.ahk" { SYNC_VERSION }

/**
 * Represents a change to a change unit that is contained in an item.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isyncchangeunit
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncChangeUnit extends IUnknown {
    /**
     * The interface identifier for ISyncChangeUnit
     * @type {Guid}
     */
    static IID := Guid("{60edd8ca-7341-4bb7-95ce-fab6394b51cb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncChangeUnit interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetItemChange        : IntPtr
        GetChangeUnitId      : IntPtr
        GetChangeUnitVersion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncChangeUnit.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the item change that contains this change unit change.
     * @returns {ISyncChange} Returns the item change that contains this change unit change.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangeunit-getitemchange
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangeunit-getchangeunitid
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangeunit-getchangeunitversion
     */
    GetChangeUnitVersion(pbCurrentReplicaId, pVersion) {
        pbCurrentReplicaIdMarshal := pbCurrentReplicaId is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pbCurrentReplicaIdMarshal, pbCurrentReplicaId, SYNC_VERSION.Ptr, pVersion, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncChangeUnit.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetItemChange := CallbackCreate(GetMethod(implObj, "GetItemChange"), flags, 2)
        this.vtbl.GetChangeUnitId := CallbackCreate(GetMethod(implObj, "GetChangeUnitId"), flags, 3)
        this.vtbl.GetChangeUnitVersion := CallbackCreate(GetMethod(implObj, "GetChangeUnitVersion"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetItemChange)
        CallbackFree(this.vtbl.GetChangeUnitId)
        CallbackFree(this.vtbl.GetChangeUnitVersion)
    }
}
