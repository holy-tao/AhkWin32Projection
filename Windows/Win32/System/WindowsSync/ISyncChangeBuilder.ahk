#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\SYNC_VERSION.ahk" { SYNC_VERSION }

/**
 * Provides additional data for an item change.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isyncchangebuilder
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncChangeBuilder extends IUnknown {
    /**
     * The interface identifier for ISyncChangeBuilder
     * @type {Guid}
     */
    static IID := Guid("{56f14771-8677-484f-a170-e386e418a676}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncChangeBuilder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddChangeUnitMetadata : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncChangeBuilder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds change unit metadata to an item change.
     * @param {Pointer<Integer>} pbChangeUnitId The ID of the change unit to add to the item change.
     * @param {Pointer<SYNC_VERSION>} pChangeUnitVersion The version of the change unit change to add to the item change.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
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
     * The format of the change unit ID that is contained in <i>pbChangeUnitId</i> does not match the format that is specified by the ID format schema of the provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item change to which to add this change unit to has <b>SYNC_CHANGE_FLAG_DELETE</b> or <b>SYNC_CHANGE_FLAG_DOES_NOT_EXIST</b> set as one of its flags.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebuilder-addchangeunitmetadata
     */
    AddChangeUnitMetadata(pbChangeUnitId, pChangeUnitVersion) {
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pbChangeUnitIdMarshal, pbChangeUnitId, SYNC_VERSION.Ptr, pChangeUnitVersion, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncChangeBuilder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddChangeUnitMetadata := CallbackCreate(GetMethod(implObj, "AddChangeUnitMetadata"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddChangeUnitMetadata)
    }
}
