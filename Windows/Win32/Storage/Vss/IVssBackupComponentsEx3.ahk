#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IVssAsync.ahk" { IVssAsync }
#Import ".\IVssBackupComponentsEx2.ahk" { IVssBackupComponentsEx2 }
#Import ".\VSS_WRITER_STATE.ahk" { VSS_WRITER_STATE }

/**
 * Defines additional methods that requesters can use to perform LUN resynchronization and return extended writer status information.
 * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nl-vsbackup-ivssbackupcomponentsex3
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct IVssBackupComponentsEx3 extends IVssBackupComponentsEx2 {
    /**
     * The interface identifier for IVssBackupComponentsEx3
     * @type {Guid}
     */
    static IID := Guid("{c191bfbc-b602-4675-8bd1-67d642f529d5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVssBackupComponentsEx3 interfaces
    */
    struct Vtbl extends IVssBackupComponentsEx2.Vtbl {
        GetWriterStatusEx        : IntPtr
        AddSnapshotToRecoverySet : IntPtr
        RecoverSet               : IntPtr
        GetSessionId             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVssBackupComponentsEx3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns extended status information for the specified writer.
     * @remarks
     * A requester must call the asynchronous operation 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwriterstatus">IVssBackupComponents::GatherWriterStatus</a> 
     *     and wait for it to complete before calling 
     *     <b>IVssBackupComponentsEx3::GetWriterStatusEx</b>.
     * 
     * If this method returns VSS_E_WRITERERROR_PARTIAL_FAILURE, the requester should use the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponentex2-getfailure">IVssComponentEx2::GetFailure</a> method to retrieve the component-level errors.
     * 
     * When the caller has finished accessing the status information returned by this method, it should call 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory held by the 
     *     <i>pbstrWriter</i> and <i>pbstrApplicationMessage</i> parameters.
     * @param {Integer} iWriter The index of the writer whose metadata is to be retrieved. The value of this parameter is an integer from 0 
     *       to <i>n</i>–1 inclusive, where <i>n</i> is the total number of 
     *       writers on the current system. The value of <i>n</i> is returned by 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwriterstatuscount">IVssBackupComponents::GetWriterStatusCount</a> method.
     * @param {Pointer<Guid>} pidInstance The address of a caller-allocated variable that receives the instance identifier of the writer. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<Guid>} pidWriter The address of a caller-allocated variable that receives the identifier for the writer class. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<BSTR>} pbstrWriter The address of a caller-allocated variable that receives a string containing the name of the specified writer. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<VSS_WRITER_STATE>} pnStatus The address of a caller-allocated variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_writer_state">VSS_WRITER_STATE</a> enumeration value. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<HRESULT>} phrFailureWriter The address of a caller-allocated variable that receives the HRESULT failure code that the writer returned for the <i>hrWriter</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriterex2-setwriterfailureex">CVssWriterEx2::SetWriterFailureEx</a> method. 
     *       
     * 
     * The following are the supported values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="S_OK"></a><a id="s_ok"></a><dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITERERROR_INCONSISTENTSNAPSHOT"></a><a id="vss_e_writererror_inconsistentsnapshot"></a><dl>
     * <dt><b>VSS_E_WRITERERROR_INCONSISTENTSNAPSHOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shadow copy contains only a subset of the volumes needed by the writer to correctly back up the 
     *         application component.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITERERROR_OUTOFRESOURCES"></a><a id="vss_e_writererror_outofresources"></a><dl>
     * <dt><b>VSS_E_WRITERERROR_OUTOFRESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer ran out of memory or other system resources. The recommended way to handle this error code is 
     *         to wait ten minutes and then repeat the operation, up to three times.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITERERROR_TIMEOUT"></a><a id="vss_e_writererror_timeout"></a><dl>
     * <dt><b>VSS_E_WRITERERROR_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer operation failed because of a time-out between the Freeze and Thaw events. The recommended way 
     *         to handle this error code is to wait ten minutes and then repeat the operation, up to three times.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITERERROR_RETRYABLE"></a><a id="vss_e_writererror_retryable"></a><dl>
     * <dt><b>VSS_E_WRITERERROR_RETRYABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer failed due to an error that would likely not occur if the entire backup, restore, or shadow 
     *         copy creation process was restarted. The recommended way to handle this error code is to wait ten minutes and 
     *         then repeat the operation, up to three times.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITERERROR_NONRETRYABLE"></a><a id="vss_e_writererror_nonretryable"></a><dl>
     * <dt><b>VSS_E_WRITERERROR_NONRETRYABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer operation failed because of an error that might recur if another shadow copy is created. For 
     *         more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITER_NOT_RESPONDING"></a><a id="vss_e_writer_not_responding"></a><dl>
     * <dt><b>VSS_E_WRITER_NOT_RESPONDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer is not responding.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITER_STATUS_NOT_AVAILABLE"></a><a id="vss_e_writer_status_not_available"></a><dl>
     * <dt><b>VSS_E_WRITER_STATUS_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer status is not available for one or more writers. A writer may have reached the maximum number of available backup and restore sessions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VSS_E_WRITERERROR_PARTIAL_FAILURE"></a><a id="vss_e_writererror_partial_failure"></a><dl>
     * <dt><b>VSS_E_WRITERERROR_PARTIAL_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer is reporting one or more component-level errors. To retrieve the errors, the requester must use the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponentex2-getfailure">IVssComponentEx2::GetFailure</a> method.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<HRESULT>} phrApplication The address of a caller-allocated variable that receives the return code that the writer passed for the <i>hrApplication</i> parameter of  the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriterex2-setwriterfailureex">CVssWriterEx2::SetWriterFailureEx</a> method. This parameter is optional and can be <b>NULL</b>.
     * @param {Pointer<BSTR>} pbstrApplicationMessage The address of a variable that receives the application failure message that the writer passed for the <i>wszApplicationMessage</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriterex2-setwriterfailureex">SetWriterFailureEx</a> method. This parameter is optional and can be <b>NULL</b>.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully returned the status of the specified writer. Note that the value of the 
     *         <i>phrFailureWriter</i> parameter must be checked to verify that the writer was successful. 
     *         The writer failure codes can be among those listed in VsWriter.h and in <a href="https://docs.microsoft.com/windows/desktop/VSS/writer-errors-and-vetoes">Writer Errors and Vetoes</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pnStatus</i>, <i>pidWriter</i>, <i>pbstrWriter</i>, or <i>pidInstance</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * <dt>0x8007000EL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * <dt>0x80042301L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, 
     *         or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * <dt>0x80042308L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>iWriter</i> parameter specifies a writer that does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex3-getwriterstatusex
     */
    GetWriterStatusEx(iWriter, pidInstance, pidWriter, pbstrWriter, pnStatus, phrFailureWriter, phrApplication, pbstrApplicationMessage) {
        pnStatusMarshal := pnStatus is VarRef ? "int*" : "ptr"
        phrFailureWriterMarshal := phrFailureWriter is VarRef ? "int*" : "ptr"
        phrApplicationMarshal := phrApplication is VarRef ? "int*" : "ptr"

        result := ComCall(60, this, "uint", iWriter, Guid.Ptr, pidInstance, Guid.Ptr, pidWriter, BSTR.Ptr, pbstrWriter, pnStatusMarshal, pnStatus, phrFailureWriterMarshal, phrFailureWriter, phrApplicationMarshal, phrApplication, BSTR.Ptr, pbstrApplicationMessage, "HRESULT")
        return result
    }

    /**
     * Specifies the volumes to be included in a LUN resynchronization operation.
     * @param {Guid} snapshotId The identifier of the shadow copy that was returned by the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addtosnapshotset">IVssBackupComponents::AddToSnapshotSet</a> method during backup. This parameter is required and cannot be GUID_NULL.
     * @param {Integer} dwFlags This parameter is reserved and must be zero.
     * @param {Pointer<Integer>} pwszDestinationVolume This parameter is optional and can be <b>NULL</b>. A value of <b>NULL</b> means that the contents of the shadow copy volume are to be copied back to the original volume. VSS identifies the original volume by the VDS_LUN_INFO information in the Backup Components Document.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * <dt>0x80042301L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either there is no hardware provider that supports the operation, or the requester did not successfully add any volumes to the recovery set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_LEGACY_PROVIDER</b></dt>
     * <dt>0x800423F7L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This version of the hardware provider does not support this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * <dt>0x80042308L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>snapshotId</i> parameter specifies a shadow copy that the hardware provider does not own.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_RESYNC_IN_PROGRESS</b></dt>
     * <dt>0x800423FFL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another LUN resynchronization operation is already in progress.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_SNAPSHOT_NOT_IN_SET</b></dt>
     * <dt>0x8004232BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>snapshotId</i> parameter specifies a shadow copy that does not exist in the Backup Components Document.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_VOLUME_NOT_SUPPORTED</b></dt>
     * <dt>0x8004230CL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * LUN resynchronization is not supported on this volume, because it is a dynamic volume, because the destination disk does not have a unique page 83 storage identifier, because the specified volume does not reside on a LUN managed by a VSS hardware provider, or because the destination disk is a cluster quorum disk. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex3-addsnapshottorecoveryset
     */
    AddSnapshotToRecoverySet(snapshotId, dwFlags, pwszDestinationVolume) {
        pwszDestinationVolumeMarshal := pwszDestinationVolume is VarRef ? "ushort*" : "ptr"

        result := ComCall(61, this, Guid, snapshotId, "uint", dwFlags, pwszDestinationVolumeMarshal, pwszDestinationVolume, "HRESULT")
        return result
    }

    /**
     * Initiates a LUN resynchronization operation.
     * @remarks
     * At the end of the resynchronization operation, by default the newly resychronized LUN will have the same disk signature that the destination LUN had before the resynchronization.
     * 
     * This method cannot be called in WinPE, and it cannot be called in Safe mode. Before calling this method, the caller must call <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-initializeforrestore">IVssBackupComponents::InitializeForRestore</a> to prepare for the resynchronization.
     * @param {Integer} dwFlags A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_recovery_options">VSS_RECOVERY_OPTIONS</a> flags that specify how the resynchronization is to be performed.
     * @returns {IVssAsync} A pointer to a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> interface pointer that can be used to retrieve the status of the LUN resynchronization operation. When the operation is complete, the caller must release the interface pointer by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex3-recoverset
     */
    RecoverSet(dwFlags) {
        result := ComCall(62, this, "uint", dwFlags, "ptr*", &ppAsync := 0, "HRESULT")
        return IVssAsync(ppAsync)
    }

    /**
     * Returns the requester's session identifier.
     * @remarks
     * The session identifier is an opaque value that uniquely identifies a backup or restore session. It is used to distinguish the current session among multiple parallel backup or restore sessions.
     * 
     * As a best practice, writers and requesters should include the session ID in all diagnostics messages used for event logging and tracing.
     * @returns {Guid} A pointer to a variable that receives the session identifier.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex3-getsessionid
     */
    GetSessionId() {
        idSession := Guid()
        result := ComCall(63, this, Guid.Ptr, idSession, "HRESULT")
        return idSession
    }

    Query(iid) {
        if (IVssBackupComponentsEx3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWriterStatusEx := CallbackCreate(GetMethod(implObj, "GetWriterStatusEx"), flags, 9)
        this.vtbl.AddSnapshotToRecoverySet := CallbackCreate(GetMethod(implObj, "AddSnapshotToRecoverySet"), flags, 4)
        this.vtbl.RecoverSet := CallbackCreate(GetMethod(implObj, "RecoverSet"), flags, 3)
        this.vtbl.GetSessionId := CallbackCreate(GetMethod(implObj, "GetSessionId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWriterStatusEx)
        CallbackFree(this.vtbl.AddSnapshotToRecoverySet)
        CallbackFree(this.vtbl.RecoverSet)
        CallbackFree(this.vtbl.GetSessionId)
    }
}
