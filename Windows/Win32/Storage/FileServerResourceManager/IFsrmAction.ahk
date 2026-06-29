#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FsrmActionType.ahk" { FsrmActionType }

/**
 * The base class for all FSRM action interfaces.
 * @remarks
 * The FSRM server starts the action in response to quota or file screen event (for example, a directory size 
 *     exceeds a directory quota threshold or detection of a restricted file).
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nn-fsrm-ifsrmaction
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmAction extends IDispatch {
    /**
     * The interface identifier for IFsrmAction
     * @type {Guid}
     */
    static IID := Guid("{6cd6408a-ae60-463b-9ef1-e117534d69dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmAction interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Id               : IntPtr
        get_ActionType       : IntPtr
        get_RunLimitInterval : IntPtr
        put_RunLimitInterval : IntPtr
        Delete               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmAction.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {FsrmActionType} 
     */
    ActionType {
        get => this.get_ActionType()
    }

    /**
     * @type {Integer} 
     */
    RunLimitInterval {
        get => this.get_RunLimitInterval()
        set => this.put_RunLimitInterval(value)
    }

    /**
     * Retrieves the identifier of the action.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmaction-get_id
     */
    get_Id() {
        id := Guid()
        result := ComCall(7, this, Guid.Ptr, id, "HRESULT")
        return id
    }

    /**
     * Retrieves the action's type.
     * @returns {FsrmActionType} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmaction-get_actiontype
     */
    get_ActionType() {
        result := ComCall(8, this, "int*", &actionType := 0, "HRESULT")
        return actionType
    }

    /**
     * Retrieves or sets the interval that must expire before the action is run again. (Get)
     * @remarks
     * This property specifies the interval that should occur before the action is run again. For example, if the 
     *     interval has expired since the action last ran, the server will run the action again in response to an event; 
     *     otherwise, the server cannot run the action again.
     * 
     * You can specify the interval as follows.
     * 
     * <table>
     * <tr>
     * <th>Interval</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * –1
     * 
     * </td>
     * <td>
     * Use the global run-time limit. For a description, see the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-setactionrunlimitinterval">IFsrmSetting::SetActionRunLimitInterval</a> 
     *        method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * Run the action for each quota or file screen event.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * &gt;0
     * 
     * </td>
     * <td>
     * If an event occurs during this interval, do not run the action again. The interval timer starts when the 
     *        action begins. When the interval expires, the timer is reset.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmaction-get_runlimitinterval
     */
    get_RunLimitInterval() {
        result := ComCall(9, this, "int*", &minutes := 0, "HRESULT")
        return minutes
    }

    /**
     * Retrieves or sets the interval that must expire before the action is run again. (Put)
     * @remarks
     * This property specifies the interval that should occur before the action is run again. For example, if the 
     *     interval has expired since the action last ran, the server will run the action again in response to an event; 
     *     otherwise, the server cannot run the action again.
     * 
     * You can specify the interval as follows.
     * 
     * <table>
     * <tr>
     * <th>Interval</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * –1
     * 
     * </td>
     * <td>
     * Use the global run-time limit. For a description, see the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-setactionrunlimitinterval">IFsrmSetting::SetActionRunLimitInterval</a> 
     *        method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * Run the action for each quota or file screen event.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * &gt;0
     * 
     * </td>
     * <td>
     * If an event occurs during this interval, do not run the action again. The interval timer starts when the 
     *        action begins. When the interval expires, the timer is reset.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} minutes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmaction-put_runlimitinterval
     */
    put_RunLimitInterval(minutes) {
        result := ComCall(10, this, "int", minutes, "HRESULT")
        return result
    }

    /**
     * Removes the action from the quota or file screen's list of actions.
     * @remarks
     * Calling the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-deletethreshold">IFsrmQuotaBase::DeleteThreshold</a> method also 
     *     deletes the actions associated with the threshold.
     * 
     * Note that the actions are not  deleted from the object until you call the object's 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">Commit</a> method. For example, the actions are not deleted 
     *     from the quota until the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmQuota::Commit</a> 
     *     method is called, nor from the file screens until you call the 
     *     <b>IFsrmFileScreen::Commit</b> method.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmaction-delete
     */
    Delete() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmAction.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_ActionType := CallbackCreate(GetMethod(implObj, "get_ActionType"), flags, 2)
        this.vtbl.get_RunLimitInterval := CallbackCreate(GetMethod(implObj, "get_RunLimitInterval"), flags, 2)
        this.vtbl.put_RunLimitInterval := CallbackCreate(GetMethod(implObj, "put_RunLimitInterval"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_ActionType)
        CallbackFree(this.vtbl.get_RunLimitInterval)
        CallbackFree(this.vtbl.put_RunLimitInterval)
        CallbackFree(this.vtbl.Delete)
    }
}
