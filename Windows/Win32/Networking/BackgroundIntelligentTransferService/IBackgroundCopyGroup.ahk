#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumBackgroundCopyJobs1.ahk" { IEnumBackgroundCopyJobs1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IBackgroundCopyJob1.ahk" { IBackgroundCopyJob1 }
#Import ".\GROUPPROP.ahk" { GROUPPROP }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Use the IBackgroundCopyGroup interface to manage a group. A group contains download jobs. For example, add a job to the group, set the properties of the group, and start and stop the group in the download queue.
 * @see https://learn.microsoft.com/windows/win32/api/qmgr/nn-qmgr-ibackgroundcopygroup
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBackgroundCopyGroup extends IUnknown {
    /**
     * The interface identifier for IBackgroundCopyGroup
     * @type {Guid}
     */
    static IID := Guid("{1ded80a7-53ea-424f-8a04-17fea9adc4f5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBackgroundCopyGroup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProp                : IntPtr
        SetProp                : IntPtr
        GetProgress            : IntPtr
        GetStatus              : IntPtr
        GetJob                 : IntPtr
        SuspendGroup           : IntPtr
        ResumeGroup            : IntPtr
        CancelGroup            : IntPtr
        get_Size               : IntPtr
        get_GroupID            : IntPtr
        CreateJob              : IntPtr
        EnumJobs               : IntPtr
        SwitchToForeground     : IntPtr
        QueryNewJobInterface   : IntPtr
        SetNotificationPointer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBackgroundCopyGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * @type {Guid} 
     */
    GroupID {
        get => this.get_GroupID()
    }

    /**
     * Use the GetProp method to retrieve a property value from the group.
     * @param {GROUPPROP} propID Identifies the property to retrieve. For a list of properties, see the <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/ne-qmgr-groupprop">GROUPPROP</a> enumeration.
     * @returns {VARIANT} Property value.
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-getprop
     */
    GetProp(propID) {
        pvarVal := VARIANT()
        result := ComCall(3, this, GROUPPROP, propID, VARIANT.Ptr, pvarVal, "HRESULT")
        return pvarVal
    }

    /**
     * Use the SetProp method to set the property value for a group property.
     * @param {GROUPPROP} propID Identifies the property to set. For a list of properties, see the <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/ne-qmgr-groupprop">GROUPPROP</a> enumeration.
     * @param {Pointer<VARIANT>} pvarVal Property value.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully set the property.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You specified a property that is not supported.
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
     * You specified a variant type that is not compatible with the property.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-setprop
     */
    SetProp(propID, pvarVal) {
        result := ComCall(4, this, GROUPPROP, propID, VARIANT.Ptr, pvarVal, "HRESULT")
        return result
    }

    /**
     * Use the GetProgress method to retrieve the progress of the download.
     * @param {Integer} dwFlags Type of progress to retrieve. Specify one of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QM_PROGRESS_PERCENT_DONE"></a><a id="qm_progress_percent_done"></a><dl>
     * <dt><b>QM_PROGRESS_PERCENT_DONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the percent of the download that is complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QM_PROGRESS_SIZE_DONE"></a><a id="qm_progress_size_done"></a><dl>
     * <dt><b>QM_PROGRESS_SIZE_DONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the number of bytes downloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QM_PROGRESS_TIME_DONE"></a><a id="qm_progress_time_done"></a><dl>
     * <dt><b>QM_PROGRESS_TIME_DONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} Progress of the download. The progress represents the number of bytes downloaded or the percent of the download that is complete, depending on <i>dwFlags</i>.
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-getprogress
     */
    GetProgress(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "uint*", &pdwProgress := 0, "HRESULT")
        return pdwProgress
    }

    /**
     * Use the GetStatus method to retrieve the state of the group.
     * @param {Pointer<Integer>} pdwStatus State of the group. The state can be set to one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QM_STATUS_GROUP_FOREGROUND"></a><a id="qm_status_group_foreground"></a><dl>
     * <dt><b>QM_STATUS_GROUP_FOREGROUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * QMGR is downloading the group in the foreground.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QM_STATUS_GROUP_INCOMPLETE"></a><a id="qm_status_group_incomplete"></a><dl>
     * <dt><b>QM_STATUS_GROUP_INCOMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * QMGR is still downloading the group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QM_STATUS_GROUP_SUSPENDED"></a><a id="qm_status_group_suspended"></a><dl>
     * <dt><b>QM_STATUS_GROUP_SUSPENDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group is suspended.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QM_STATUS_GROUP_ERROR"></a><a id="qm_status_group_error"></a><dl>
     * <dt><b>QM_STATUS_GROUP_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while processing the group. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwJobIndex Current job in progress. The index is always 0 (groups can only contain one job).
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully retrieved the state of the group.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-getstatus
     */
    GetStatus(pdwStatus, pdwJobIndex) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"
        pdwJobIndexMarshal := pdwJobIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwStatusMarshal, pdwStatus, pdwJobIndexMarshal, pdwJobIndex, "HRESULT")
        return result
    }

    /**
     * Use the GetJob method to retrieve a job from the group.
     * @param {Guid} jobID Identifies the job to retrieve.
     * @returns {IBackgroundCopyJob1} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/nn-qmgr-ibackgroundcopyjob1">IBackgroundCopyJob1</a> interface pointer. Use the interface to add files and retrieve the state of the job.
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-getjob
     */
    GetJob(jobID) {
        result := ComCall(7, this, Guid, jobID, "ptr*", &ppJob := 0, "HRESULT")
        return IBackgroundCopyJob1(ppJob)
    }

    /**
     * Use the SuspendGroup method to pause a group in the download queue. New groups, groups that are in error, or groups that have finished downloading are automatically suspended.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully suspended the group in the download queue.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-suspendgroup
     */
    SuspendGroup() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Use the ResumeGroup method to start a group that has been suspended in the download queue.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully resumed the group in the download queue.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-resumegroup
     */
    ResumeGroup() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Use the CancelGroup method to remove the group from the queue. Files completely downloaded before calling this method are available to the client. You can cancel a group at anytime; however, the group cannot be recovered once it is canceled.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group was successfully canceled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-cancelgroup
     */
    CancelGroup() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Use the get_Size method to retrieve the size of all files in the group to download.
     * @returns {Integer} Total size, in bytes, of all files in the group to download, or 0 if QMGR cannot determine the size.
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-get_size
     */
    get_Size() {
        result := ComCall(11, this, "uint*", &pdwSize := 0, "HRESULT")
        return pdwSize
    }

    /**
     * Use the get_GroupID method to retrieve the group's identifier.
     * @returns {Guid} GUID that uniquely identifies the group within the download queue.
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-get_groupid
     */
    get_GroupID() {
        pguidGroupID := Guid()
        result := ComCall(12, this, Guid.Ptr, pguidGroupID, "HRESULT")
        return pguidGroupID
    }

    /**
     * Use the CreateJob method to add a new job to the group. A group can contain only one job.
     * @param {Guid} guidJobID Uniquely identifies the job in the group and queue.
     * @returns {IBackgroundCopyJob1} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/nn-qmgr-ibackgroundcopyjob1">IBackgroundCopyJob1</a> interface pointer. Use the interface to add files and check the state of the job.
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-createjob
     */
    CreateJob(guidJobID) {
        result := ComCall(13, this, Guid, guidJobID, "ptr*", &ppJob := 0, "HRESULT")
        return IBackgroundCopyJob1(ppJob)
    }

    /**
     * Use the EnumJobs method to retrieve a list of jobs in the group. The list contains only one job.
     * @param {Integer} dwFlags Must be 0.
     * @returns {IEnumBackgroundCopyJobs1} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/nn-qmgr-ienumbackgroundcopyjobs1">IEnumBackgroundCopyJobs1</a> interface pointer. Use the interface to iterate through the list of jobs.
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-enumjobs
     */
    EnumJobs(dwFlags) {
        result := ComCall(14, this, "uint", dwFlags, "ptr*", &ppEnumJobs := 0, "HRESULT")
        return IEnumBackgroundCopyJobs1(ppEnumJobs)
    }

    /**
     * Use the SwitchToForeground method to download the group in the foreground instead of the background.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully switched the group to foreground processing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-switchtoforeground
     */
    SwitchToForeground() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Use the IBackgroundCopyGroup interface to manage a group. A group contains download jobs. For example, add a job to the group, set the properties of the group, and start and stop the group in the download queue.
     * @param {Pointer<Guid>} iid 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nn-qmgr-ibackgroundcopygroup
     */
    QueryNewJobInterface(iid) {
        result := ComCall(16, this, Guid.Ptr, iid, "ptr*", &pUnk := 0, "HRESULT")
        return IUnknown(pUnk)
    }

    /**
     * Use the IBackgroundCopyGroup interface to manage a group. A group contains download jobs. For example, add a job to the group, set the properties of the group, and start and stop the group in the download queue.
     * @param {Pointer<Guid>} iid 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nn-qmgr-ibackgroundcopygroup
     */
    SetNotificationPointer(iid, pUnk) {
        result := ComCall(17, this, Guid.Ptr, iid, "ptr", pUnk, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBackgroundCopyGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProp := CallbackCreate(GetMethod(implObj, "GetProp"), flags, 3)
        this.vtbl.SetProp := CallbackCreate(GetMethod(implObj, "SetProp"), flags, 3)
        this.vtbl.GetProgress := CallbackCreate(GetMethod(implObj, "GetProgress"), flags, 3)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 3)
        this.vtbl.GetJob := CallbackCreate(GetMethod(implObj, "GetJob"), flags, 3)
        this.vtbl.SuspendGroup := CallbackCreate(GetMethod(implObj, "SuspendGroup"), flags, 1)
        this.vtbl.ResumeGroup := CallbackCreate(GetMethod(implObj, "ResumeGroup"), flags, 1)
        this.vtbl.CancelGroup := CallbackCreate(GetMethod(implObj, "CancelGroup"), flags, 1)
        this.vtbl.get_Size := CallbackCreate(GetMethod(implObj, "get_Size"), flags, 2)
        this.vtbl.get_GroupID := CallbackCreate(GetMethod(implObj, "get_GroupID"), flags, 2)
        this.vtbl.CreateJob := CallbackCreate(GetMethod(implObj, "CreateJob"), flags, 3)
        this.vtbl.EnumJobs := CallbackCreate(GetMethod(implObj, "EnumJobs"), flags, 3)
        this.vtbl.SwitchToForeground := CallbackCreate(GetMethod(implObj, "SwitchToForeground"), flags, 1)
        this.vtbl.QueryNewJobInterface := CallbackCreate(GetMethod(implObj, "QueryNewJobInterface"), flags, 3)
        this.vtbl.SetNotificationPointer := CallbackCreate(GetMethod(implObj, "SetNotificationPointer"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProp)
        CallbackFree(this.vtbl.SetProp)
        CallbackFree(this.vtbl.GetProgress)
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.GetJob)
        CallbackFree(this.vtbl.SuspendGroup)
        CallbackFree(this.vtbl.ResumeGroup)
        CallbackFree(this.vtbl.CancelGroup)
        CallbackFree(this.vtbl.get_Size)
        CallbackFree(this.vtbl.get_GroupID)
        CallbackFree(this.vtbl.CreateJob)
        CallbackFree(this.vtbl.EnumJobs)
        CallbackFree(this.vtbl.SwitchToForeground)
        CallbackFree(this.vtbl.QueryNewJobInterface)
        CallbackFree(this.vtbl.SetNotificationPointer)
    }
}
