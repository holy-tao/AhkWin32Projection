#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncCallback.ahk" { ISyncCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents additional application callbacks that are used to notify the application of synchronization events.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isynccallback2
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncCallback2 extends ISyncCallback {
    /**
     * The interface identifier for ISyncCallback2
     * @type {Guid}
     */
    static IID := Guid("{47ce84af-7442-4ead-8630-12015e030ad7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncCallback2 interfaces
    */
    struct Vtbl extends ISyncCallback.Vtbl {
        OnChangeApplied : IntPtr
        OnChangeFailed  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncCallback2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Occurs after a change is successfully applied.
     * @param {Integer} dwChangesApplied The number of changes that have been successfully applied during the synchronization session. This value is the sum of item changes plus change unit changes.
     * @param {Integer} dwChangesFailed The number of changes that have failed to apply during the synchronization session. This value is the sum of item changes plus change unit changes.
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
     * <dt><b>Application-determined error codes</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynccallback2-onchangeapplied
     */
    OnChangeApplied(dwChangesApplied, dwChangesFailed) {
        result := ComCall(8, this, "uint", dwChangesApplied, "uint", dwChangesFailed, "HRESULT")
        return result
    }

    /**
     * Occurs after a change fails to apply.
     * @param {Integer} dwChangesApplied The number of changes that have been successfully applied during the synchronization session. This value is the sum of item changes plus change unit changes.
     * @param {Integer} dwChangesFailed The number of changes that have failed to apply during the synchronization session. This value is the sum of item changes plus change unit changes.
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
     * <dt><b>Application-determined error codes</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynccallback2-onchangefailed
     */
    OnChangeFailed(dwChangesApplied, dwChangesFailed) {
        result := ComCall(9, this, "uint", dwChangesApplied, "uint", dwChangesFailed, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncCallback2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnChangeApplied := CallbackCreate(GetMethod(implObj, "OnChangeApplied"), flags, 3)
        this.vtbl.OnChangeFailed := CallbackCreate(GetMethod(implObj, "OnChangeFailed"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnChangeApplied)
        CallbackFree(this.vtbl.OnChangeFailed)
    }
}
