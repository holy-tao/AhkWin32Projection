#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDiskQuotaUser.ahk" { IDiskQuotaUser }

/**
 * Adds multiple quota user objects to a container that is then submitted for update in a single call.
 * @see https://learn.microsoft.com/windows/win32/api/dskquota/nn-dskquota-idiskquotauserbatch
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct IDiskQuotaUserBatch extends IUnknown {
    /**
     * The interface identifier for IDiskQuotaUserBatch
     * @type {Guid}
     */
    static IID := Guid("{7988b576-ec89-11cf-9c00-00aa00a14f56}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDiskQuotaUserBatch interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Add         : IntPtr
        Remove      : IntPtr
        RemoveAll   : IntPtr
        FlushToDisk : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDiskQuotaUserBatch.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds an IDiskQuotaUser pointer to the batch list.
     * @param {IDiskQuotaUser} pUser A pointer to the quota user object's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nn-dskquota-idiskquotauser">IDiskQuotaUser</a> interface.
     * @returns {HRESULT} This method returns one of the following values.
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
     * Success.
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
     * The <i>pUser</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauserbatch-add
     */
    Add(pUser) {
        result := ComCall(3, this, "ptr", pUser, "HRESULT")
        return result
    }

    /**
     * Removes an IDiskQuotaUser pointer from the batch list.
     * @param {IDiskQuotaUser} pUser A pointer to the quota user object's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nn-dskquota-idiskquotauser">IDiskQuotaUser</a> interface.
     * @returns {HRESULT} This method returns one of the following values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Quota user object not found in batch.
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
     * The <i>pUser</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauserbatch-remove
     */
    Remove(pUser) {
        result := ComCall(4, this, "ptr", pUser, "HRESULT")
        return result
    }

    /**
     * Removes all IDiskQuotaUser pointers from the batch list.
     * @returns {HRESULT} This method returns one of the following values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauserbatch-removeall
     */
    RemoveAll() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Writes user object changes to disk in a single call to the underlying file system.
     * @remarks
     * There are limitations on the amount of information that can be written to disk in a single call to the file system. The flush operation may generate multiple calls to the file system. Nonetheless, the batch operation will be more efficient than a single call for each user object.
     * @returns {HRESULT} This method returns a file system error or one of the following values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has insufficient access rights.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected file system error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected exception occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dskquota/nf-dskquota-idiskquotauserbatch-flushtodisk
     */
    FlushToDisk() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDiskQuotaUserBatch.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.RemoveAll := CallbackCreate(GetMethod(implObj, "RemoveAll"), flags, 1)
        this.vtbl.FlushToDisk := CallbackCreate(GetMethod(implObj, "FlushToDisk"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.RemoveAll)
        CallbackFree(this.vtbl.FlushToDisk)
    }
}
