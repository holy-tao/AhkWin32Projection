#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncKnowledge.ahk" { ISyncKnowledge }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SYNC_VERSION.ahk" { SYNC_VERSION }

/**
 * Represents knowledge that has been forgotten because of tombstone cleanup.
 * @remarks
 * The forgotten knowledge tracks the maximum version of tombstones that have been cleaned up. When an item is deleted from the item store, the metadata for that item is kept, but the item is marked as deleted. Metadata for a deleted item is called a tombstone. Tombstones must be periodically cleaned up or they will eventually use too much space in the item store. When a tombstone is removed from the metadata, the forgotten knowledge must be updated to contain the version of the removed tombstone. Be aware that forgotten knowledge is an overestimation of which items have had their metadata removed. Therefore, the forgotten knowledge might also contain items that still have active entries in the metadata.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-iforgottenknowledge
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IForgottenKnowledge extends ISyncKnowledge {
    /**
     * The interface identifier for IForgottenKnowledge
     * @type {Guid}
     */
    static IID := Guid("{456e0f96-6036-452b-9f9d-bcc4b4a85db2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IForgottenKnowledge interfaces
    */
    struct Vtbl extends ISyncKnowledge.Vtbl {
        ForgetToVersion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IForgottenKnowledge.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Updates the forgotten knowledge to reflect that all versions that are less than or equal to the specified version might have been forgotten, and that corresponding tombstones might have been deleted.
     * @remarks
     * When a replica cleans up the tombstone for an item, its associated provider must call this method and specify the version of the tombstone that was removed.
     * @param {ISyncKnowledge} pKnowledge The current knowledge of the replica that owns this forgotten knowledge object.
     * @param {Pointer<SYNC_VERSION>} pVersion The version of the tombstone that has been cleaned up.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iforgottenknowledge-forgettoversion
     */
    ForgetToVersion(pKnowledge, pVersion) {
        result := ComCall(27, this, "ptr", pKnowledge, SYNC_VERSION.Ptr, pVersion, "HRESULT")
        return result
    }

    Query(iid) {
        if (IForgottenKnowledge.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ForgetToVersion := CallbackCreate(GetMethod(implObj, "ForgetToVersion"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ForgetToVersion)
    }
}
