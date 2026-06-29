#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssExamineWriterMetadata.ahk
#Include .\IVssWriterComponentsExt.ahk
#Include .\VSS_OBJECT_TYPE.ahk
#Include .\IVssEnumObject.ahk
#Include .\VSS_FILE_RESTORE_STATUS.ahk
#Include .\VSS_BACKUP_TYPE.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\VSS_SNAPSHOT_PROP.ahk
#Include .\VSS_COMPONENT_TYPE.ahk
#Include .\VSS_WRITER_STATE.ahk
#Include .\IVssAsync.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\VSS_RESTORE_TYPE.ahk

/**
 * The IVssBackupComponents interface is used by a requester to poll writers about file status and to run backup/restore operations.
 * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nl-vsbackup-ivssbackupcomponents
 * @namespace Windows.Win32.Storage.Vss
 */
class IVssBackupComponents extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssBackupComponents
     * @type {Guid}
     */
    static IID => Guid("{665c1d5f-c218-414d-a05d-7fef5f9d5c86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWriterComponentsCount", "GetWriterComponents", "InitializeForBackup", "SetBackupState", "InitializeForRestore", "SetRestoreState", "GatherWriterMetadata", "GetWriterMetadataCount", "GetWriterMetadata", "FreeWriterMetadata", "AddComponent", "PrepareForBackup", "AbortBackup", "GatherWriterStatus", "GetWriterStatusCount", "FreeWriterStatus", "GetWriterStatus", "SetBackupSucceeded", "SetBackupOptions", "SetSelectedForRestore", "SetRestoreOptions", "SetAdditionalRestores", "SetPreviousBackupStamp", "SaveAsXML", "BackupComplete", "AddAlternativeLocationMapping", "AddRestoreSubcomponent", "SetFileRestoreStatus", "AddNewTarget", "SetRangesFilePath", "PreRestore", "PostRestore", "SetContext", "StartSnapshotSet", "AddToSnapshotSet", "DoSnapshotSet", "DeleteSnapshots", "ImportSnapshots", "BreakSnapshotSet", "GetSnapshotProperties", "Query", "IsVolumeSupported", "DisableWriterClasses", "EnableWriterClasses", "DisableWriterInstances", "ExposeSnapshot", "RevertToSnapshot", "QueryRevertStatus"]

    /**
     * The GetWriterComponentsCount method returns the number of writers whose components have been added to a requester's Backup Components Document.
     * @remarks
     * The count returned by 
     * <b>GetWriterComponentsCount</b> is that of writers that have had at least one of their components stored in the Backup Components Document by earlier calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * @returns {Integer} Pointer to the returned number of writers whose components have been stored.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwritercomponentscount
     */
    GetWriterComponentsCount() {
        result := ComCall(3, this, "uint*", &pcComponents := 0, "HRESULT")
        return pcComponents
    }

    /**
     * The GetWriterComponents method is used to return information about those components of a given writer that have been stored in a requester's Backup Components Document.
     * @remarks
     * The caller of this method must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when it finishes accessing the component information.
     * 
     * <b>GetWriterComponents</b> retrieves component information for a component stored in the Backup Components Document by earlier calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * 
     * The information in the components stored in the Backup Components Document is not static. If a writer updates a component during a restore, that change will be reflected in the component retrieved by 
     * <b>GetWriterComponents</b>. This is in contrast with component information found in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivsswmcomponent">IVssWMComponent</a> object returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getcomponent">IVssExamineWriterMetadata::GetComponent</a>. That information is read-only and comes from the Writer Metadata Document of a writer process.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivsswritercomponentsext">IVssWriterComponentsExt</a> interface pointer that is returned in the <i>pWriterComponents</i> parameter should not be cached, because the following <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssbackupcomponents">IVssBackupComponents</a> methods cause the interface pointer that is returned by <b>GetWriterComponents</b> to be no longer valid:
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prepareforbackup">IVssBackupComponents::PrepareForBackup</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-dosnapshotset">IVssBackupComponents::DoSnapshotSet</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-backupcomplete">IVssBackupComponents::BackupComplete</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore">IVssBackupComponents::PreRestore</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-postrestore">IVssBackupComponents::PostRestore</a>
     * If you call one of these methods after you have retrieved an <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivsswritercomponentsext">IVssWriterComponentsExt</a> interface pointer by calling <b>GetWriterComponents</b>, you cannot reuse that pointer, because it is no longer valid. Instead, you must call <b>GetWriterComponents</b> again to retrieve a new <b>IVssWriterComponentsExt</b> interface pointer.
     * @param {Integer} iWriter The index of the writer being queried. It is a number between 0 and <i>n</i>-1, where <i>n</i> is the value returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwritercomponentscount">IVssBackupComponents::GetWriterComponentsCount</a>.
     * @returns {IVssWriterComponentsExt} Doubly indirect pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivsswritercomponentsext">IVssWriterComponentsExt</a> interface object that will receive the returned component information.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwritercomponents
     */
    GetWriterComponents(iWriter) {
        result := ComCall(4, this, "uint", iWriter, "ptr*", &ppWriter := 0, "HRESULT")
        return IVssWriterComponentsExt(ppWriter)
    }

    /**
     * The InitializeForBackup method initializes the backup components metadata in preparation for backup.
     * @remarks
     * The XML document supplied to this method initializes the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssbackupcomponents">IVssBackupComponents</a> object with metadata previously stored by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-saveasxml">IVssBackupComponents::SaveAsXML</a>. Users should not tamper with this metadata document.
     * 
     * For more information on how to use 
     * <b>InitializeForBackup</b> with transportable shadow copies, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/importing-transportable-shadow-copied-volumes">Importing Transportable Shadow Copied Volumes</a>.
     * @param {BSTR} bstrXML Optional. During imports of transported shadow copies, this parameter must be the original document generated when creating the saved shadow copy and saved using <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-saveasxml">IVssBackupComponents::SaveAsXML</a>.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully initialized the specified document for backup.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient backup privileges or is not an administrator.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-initializeforbackup
     */
    InitializeForBackup(bstrXML) {
        bstrXML := bstrXML is String ? BSTR.Alloc(bstrXML).Value : bstrXML

        result := ComCall(5, this, "ptr", bstrXML, "HRESULT")
        return result
    }

    /**
     * The SetBackupState method defines an overall configuration for a backup operation.
     * @remarks
     * Applications must call 
     * <b>SetBackupState</b> prior to calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prepareforbackup">IVssBackupComponents::PrepareForBackup</a>.
     * @param {Integer} bSelectComponents Indicates whether a backup or restore operation will be in component mode. 
     * 
     * 
     * 
     * 
     * Operation in component mode supports selectively backing up designated individual components (which can allow their exclusion), or only supports backing up all files and components on a volume.
     * 
     * The Boolean is <b>true</b> if the operation will be conducted in component mode and <b>false</b> if not.
     * @param {Integer} bBackupBootableSystemState Indicates whether a bootable system state backup is being performed.
     * @param {VSS_BACKUP_TYPE} backupType A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_backup_type">VSS_BACKUP_TYPE</a> enumeration value indicating the type of backup to be performed.
     * @param {Integer} bPartialFileSupport Optional. If the value of this parameter is <b>true</b>, partial file support is enabled. The default value for this argument is <b>false</b>.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully set the backup state.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setbackupstate
     */
    SetBackupState(bSelectComponents, bBackupBootableSystemState, backupType, bPartialFileSupport) {
        result := ComCall(6, this, "char", bSelectComponents, "char", bBackupBootableSystemState, "int", backupType, "char", bPartialFileSupport, "HRESULT")
        return result
    }

    /**
     * The InitializeForRestore method initializes the IVssBackupComponents interface in preparation for a restore operation.
     * @remarks
     * The XML document supplied to this method initializes the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssbackupcomponents">IVssBackupComponents</a> object with metadata previously stored by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-saveasxml">IVssBackupComponents::SaveAsXML</a>. Users should not tamper with this metadata document.
     * @param {BSTR} bstrXML XML string containing the Backup Components Document generated by a backup operation and saved by <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-saveasxml">IVssBackupComponents::SaveAsXML</a>.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully initialized the specified document for backup.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient backup privileges or is not an administrator.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The load operation of the specified XML document failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-initializeforrestore
     */
    InitializeForRestore(bstrXML) {
        bstrXML := bstrXML is String ? BSTR.Alloc(bstrXML).Value : bstrXML

        result := ComCall(7, this, "ptr", bstrXML, "HRESULT")
        return result
    }

    /**
     * The SetRestoreState method defines an overall configuration for a restore operation.
     * @remarks
     * Typically, most restore operations will not need to override the default restore type (VSS_RTYPE_UNDEFINED). Writers should treat this restore type as if it were VSS_RTYPE_BY_COPY.
     * 
     * If applications need to call 
     * <b>SetRestoreState</b>, it should be called prior to calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore">IVssBackupComponents::PreRestore</a>.
     * 
     * If 
     * <b>SetRestoreState</b> is not called prior to <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore">IVssBackupComponents::PreRestore</a>, the default restore state () is used.
     * @param {VSS_RESTORE_TYPE} restoreType A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_restore_type">VSS_RESTORE_TYPE</a> enumeration value indicating the type of restore to be performed.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully set the backup state.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a backup operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setrestorestate
     */
    SetRestoreState(restoreType) {
        result := ComCall(8, this, "int", restoreType, "HRESULT")
        return result
    }

    /**
     * The GatherWriterMetadata method prompts each writer to send the metadata they have collected. The method will generate an Identify event to communicate with writers.
     * @remarks
     * The caller is responsible for releasing the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> interface.
     * 
     * <b>GatherWriterMetadata</b> should be called only once during the lifetime of a given 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssbackupcomponents">IVssBackupComponents</a> object.
     * 
     * <b>GatherWriterMetadata</b> generates an Identify event, which is handled by each instance of each writer through the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onidentify">CVssWriter::OnIdentify</a> method, which is used to fill the Writer Metadata Document.
     * @returns {IVssAsync} Doubly indirect pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> object containing the writer metadata.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwritermetadata
     */
    GatherWriterMetadata() {
        result := ComCall(9, this, "ptr*", &pAsync := 0, "HRESULT")
        return IVssAsync(pAsync)
    }

    /**
     * The GetWriterMetadataCount method returns the number of writers with metadata.
     * @remarks
     * A requester must call the asynchronous operation 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwritermetadata">IVssBackupComponents::GatherWriterMetadata</a> and wait for it to complete prior to calling <b>IVssBackupComponents::GetWriterMetadataCount</b>.
     * 
     * The number of writers returned by 
     * <b>GetWriterMetadataCount</b> should always be the same as that returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwriterstatuscount">IVssBackupComponents::GetWriterStatusCount</a>.
     * @returns {Integer} Number of writers with metadata.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwritermetadatacount
     */
    GetWriterMetadataCount() {
        result := ComCall(10, this, "uint*", &pcWriters := 0, "HRESULT")
        return pcWriters
    }

    /**
     * The GetWriterMetadata method returns the metadata for a specific writer running on the system.
     * @remarks
     * A requester must call the asynchronous operation 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwritermetadata">IVssBackupComponents::GatherWriterMetadata</a> and wait for it to complete prior to calling <b>GetWriterMetadata</b>.
     * 
     * Although 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwritermetadata">IVssBackupComponents::GatherWriterMetadata</a> must be called prior to either a restore or backup operation, 
     * <b>GetWriterMetadata</b> is not typically called for restores.
     * 
     * Component information retrieved (during backup operations) using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getcomponent">IVssExamineWriterMetadata::GetComponent</a>, where the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssexaminewritermetadata">IVssExamineWriterMetadata</a> interface has been returned by 
     * <b>GetWriterMetadata</b>, comes from the Writer Metadata Document of a live writer process.
     * 
     * This is in contrast to the information returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwritercomponents">GetWriterComponents</a> (during restore operations), which was stored in the Backup Components Document by calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">AddComponent</a>.
     * 
     * When the caller of this method is finished accessing the metadata, it must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>.
     * @param {Integer} iWriter Index of the writer whose metadata is to be retrieved. The value of this parameter is an integer from 0 
     *       to <i>n</i>–1 inclusive, where <i>n</i> is the total number of writers on the current system. The value of <i>n</i> is returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwritermetadatacount">IVssBackupComponents::GetWriterMetadataCount</a>.
     * @param {Pointer<Guid>} pidInstance Pointer to the instance identifier of the writer that collected the metadata.
     * @param {Pointer<IVssExamineWriterMetadata>} ppMetadata Doubly indirect pointer to the instance of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssexaminewritermetadata">IVssExamineWriterMetadata</a> object that contains the returned metadata.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully returned a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssexaminewritermetadata">IVssExamineWriterMetadata</a> interface object.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified shadow copy does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwritermetadata
     */
    GetWriterMetadata(iWriter, pidInstance, ppMetadata) {
        result := ComCall(11, this, "uint", iWriter, "ptr", pidInstance, "ptr*", ppMetadata, "HRESULT")
        return result
    }

    /**
     * The FreeWriterMetadata method frees system resources allocated when IVssBackupComponents::GatherWriterMetadata was called.
     * @remarks
     * This method should never be called prior to the completion of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwritermetadata">IVssBackupComponents::GatherWriterMetadata</a>. The result of calling the method prior to completion of the metadata gather is undefined.
     * 
     * Once writer metadata has been freed, it cannot be recovered by the current instance of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssbackupcomponents">IVssBackupComponents</a> interface. It will be necessary to create a new instance of 
     * <b>IVssBackupComponents</b>, and call the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwritermetadata">IVssBackupComponents::GatherWriterMetadata</a> method again.
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
     * </dl>
     * </td>
     * <td width="60%">
     * The writer metadata was successfully freed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-freewritermetadata
     */
    FreeWriterMetadata() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Used to explicitly add to the backup set.
     * @remarks
     * The <b>AddComponent</b> method has meaning only if the backup operation takes place in component mode.
     * 
     * Only these kinds of components should be added to the Backup Components Document using <b>AddComponent</b>.
     * - Components that are selectable for backup (see <a href="https://docs.microsoft.com/windows/win32/vss/vssgloss-s">selectability for backup</a>).
     * - Nonselectable-for-backup components with no selectable-for-backup ancestors.
     * 
     * Nonselectable for backup components that have a selectable for backup ancestor in the hierarchy of their 
     *     logical paths are part of a component set defined by the selectable for backup ancestor. These components are 
     *     implicitly added to the Backup Components Document when the ancestor is added and should never be explicitly added 
     *     to a requester's Backup Components Document by using 
     *     <b>AddComponent</b>.The result of doing so is 
     *     undefined (see <a href="https://docs.microsoft.com/windows/desktop/VSS/working-with-selectability-and-logical-paths">Working with 
     *     Selectability and Logical Paths</a>).
     * 
     * Selectable for backup components with selectable for backup ancestors are also subcomponents in a component 
     *     set. They can be implicitly selected if their ancestor is selected (in which case they are not added to the Backup 
     *     Components Document using 
     *     <b>AddComponent</b>), or they can be 
     *     explicitly selected using 
     *     <b>AddComponent</b>.
     * 
     * The combination of logical path and name for each component of a given instance of a given class of writer 
     *     must be unique. Attempting to call 
     *     <b>AddComponent</b> twice with the same values 
     *     of <i>wszLogicalPath</i> and <i>wszComponentName</i> results in a 
     *     VSS_E_OBJECT_ALREADY_EXISTS error.
     * 
     * The distinction between the <i>instanceId</i> and the <i>writerID</i> is 
     *     necessary because it is possible to run multiple copies for the same writer.
     * 
     * A writer's class identifier and instance can be found by calling 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getidentity">IVssExamineWriterMetadata::GetIdentity</a>.
     * 
     * Before it calls <b>AddComponent</b>, a 
     *     requester must have been initialized for backup by calling 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-initializeforbackup">IVssBackupComponents::InitializeForBackup</a> and <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwritermetadata">IVssBackupComponents::GatherWriterMetadata</a>. See <a href="https://docs.microsoft.com/windows/desktop/VSS/overview-of-backup-initialization">Overview of Backup Initialization</a>.
     * 
     * The requester must call <b>AddComponent</b> to add the required components to the shadow copy before calling <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-dosnapshotset">IVssBackupComponents::DoSnapshotSet</a> to create the shadow copy. See <a href="https://docs.microsoft.com/windows/desktop/VSS/overview-of-the-backup-discovery-phase">Overview of the Backup Discovery Phase</a> and <a href="https://docs.microsoft.com/windows/desktop/VSS/overview-of-pre-backup-tasks">Overview of Pre-Backup Tasks</a>.
     * @param {Guid} instanceId Identifies a specific instance of a writer.
     * @param {Guid} writerId Writer class identifier.
     * @param {VSS_COMPONENT_TYPE} ct Identifies the type of the component. Refer to the documentation for 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> for permitted input values.
     * @param {PWSTR} wszLogicalPath <b>Null</b>-terminated wide character string containing the logical path of the selectable for backup component.
     *       For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * A logical path is not required when adding a component. Therefore, the value of this parameter can be 
     *        <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @param {PWSTR} wszComponentName <b>Null</b>-terminated wide character string containing the name of the selectable for backup component.
     *       
     * 
     * The value of this parameter cannot be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully added the component.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more 
     *         information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is a duplicate. A component with the same logical path and component name already 
     *         exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent
     */
    AddComponent(instanceId, writerId, ct, wszLogicalPath, wszComponentName) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName

        result := ComCall(13, this, "ptr", instanceId, "ptr", writerId, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "HRESULT")
        return result
    }

    /**
     * The PrepareForBackup method will cause VSS to generate a PrepareForBackup event, signaling writers to prepare for an upcoming backup operation. This makes a requester's Backup Components Document available to writers.
     * @remarks
     * <b>PrepareForBackup</b> generates a 
     * PrepareForBackup event, which is handled by each instance of each writer through the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpreparebackup">CVssWriter::OnPrepareBackup</a> method.
     * 
     * Before 
     * <b>PrepareForBackup</b> can be called, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setbackupstate">IVssBackupComponents::SetBackupState</a> must be called.
     * 
     * The Backup Components Document can still be modified by writers in their 
     * <b>PrepareForBackup</b> event handler (<a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpreparebackup">CVssWriter::OnPrepareBackup</a>), and afterward until the generation of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-backupcomplete">BackupComplete</a> event.
     * 
     * The caller is responsible for releasing the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> interface.
     * @returns {IVssAsync} Doubly indirect pointer to an instance of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> interface that is used to determine when the asynchronous operation is complete.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prepareforbackup
     */
    PrepareForBackup() {
        result := ComCall(14, this, "ptr*", &ppAsync := 0, "HRESULT")
        return IVssAsync(ppAsync)
    }

    /**
     * The AbortBackup method notifies VSS that a backup operation was terminated.
     * @remarks
     * <b>AbortBackup</b> generates an <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-a">Abort</a> event, which is handled by each instance of each writer through the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onabort">CVssWriter::OnAbort</a> method.
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
     * </dl>
     * </td>
     * <td width="60%">
     * The query operation was successful.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-abortbackup
     */
    AbortBackup() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * The GatherWriterStatus method prompts each writer to send a status message.
     * @remarks
     * The caller of this method should also call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-freewriterstatus">IVssBackupComponents::FreeWriterStatus</a> after receiving the status of each writer.
     * 
     * After calling <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-backupcomplete">BackupComplete</a>, requesters must call <b>GatherWriterStatus</b> to cause the writer session to be set to a completed state.
     * 
     * <div class="alert"><b>Note</b>  This is only necessary on Windows Server 2008 with Service Pack 2 (SP2) and earlier.</div>
     * <div> </div>
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-cvsswriter">CVssWriter</a> class handles the status message sent by each writer.
     * 
     * The caller is responsible for releasing the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> interface.
     * @returns {IVssAsync} Doubly indirect pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> object containing the writer status data.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwriterstatus
     */
    GatherWriterStatus() {
        result := ComCall(16, this, "ptr*", &pAsync := 0, "HRESULT")
        return IVssAsync(pAsync)
    }

    /**
     * The GetWriterStatusCount method returns the number of writers with status.
     * @remarks
     * A requester must call the asynchronous operation 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwriterstatus">IVssBackupComponents::GatherWriterStatus</a> and wait for it to complete prior to calling <b>IVssBackupComponents::GetWriterStatusCount</b>.
     * 
     * The number of writers returned by 
     * <b>GetWriterStatusCount</b> should always be the same as that returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwritermetadatacount">IVssBackupComponents::GetWriterMetadataCount</a>.
     * @returns {Integer} The number of writers with status.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwriterstatuscount
     */
    GetWriterStatusCount() {
        result := ComCall(17, this, "uint*", &pcWriters := 0, "HRESULT")
        return pcWriters
    }

    /**
     * The FreeWriterStatus method frees system resources allocated during the call to IVssBackupComponents::GatherWriterStatus.
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
     * </dl>
     * </td>
     * <td width="60%">
     * The writer status was successfully freed.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-freewriterstatus
     */
    FreeWriterStatus() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * The GetWriterStatus method returns the status of the specified writer.
     * @remarks
     * A requester must call the asynchronous operation 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwriterstatus">IVssBackupComponents::GatherWriterStatus</a> 
     *     and wait for it to complete prior to calling 
     *     <b>GetWriterStatus</b>.
     * 
     * When the caller has finished accessing the status information returned by this method, it should call 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory held by the 
     *     <i>pbstrWriter</i> parameter.
     * 
     * The VSS_E_WRITERERROR_<i>XXX</i> values returned in the <i>pHrResultFailure</i> parameter are generated by writers. VSS_E_WRITER_NOT_RESPONDING and VSS_E_WRITER_STATUS_NOT_AVAILABLE are generated by VSS.
     * @param {Integer} iWriter Index of the writer whose metadata is to be retrieved. The value of this parameter is an integer from 0 
     *       to <i>n</i>–1 inclusive, where <i>n</i> is the total number of 
     *       writers on the current system. The value of <i>n</i> is returned by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwriterstatuscount">IVssBackupComponents::GetWriterStatusCount</a>.
     * @param {Pointer<Guid>} pidInstance The address of a caller-allocated variable that receives the instance identifier of the writer.
     * @param {Pointer<Guid>} pidWriter The address of a caller-allocated variable that receives the identifier for the writer class.
     * @param {Pointer<BSTR>} pbstrWriter The address of a caller-allocated variable that receives a string containing the name of the specified writer.
     * @param {Pointer<VSS_WRITER_STATE>} pnStatus The address of a caller-allocated variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_writer_state">VSS_WRITER_STATE</a> enumeration value.
     * @param {Pointer<HRESULT>} phResultFailure The address of a caller-allocated variable that receives the HRESULT failure code that was returned by the writer. 
     *       
     * 
     * The following are the supported values for <i>pHrResultFailure</i>.
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
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error 
     *         Handling Under VSS</a>.
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
     * <b>Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * </table>
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully returned the status of the specified writer. Note that the value of the 
     *         <i>pHrWriterFailure</i> parameter must be checked to verify that the writer was successful. 
     *         The writer failure codes can be among those listed in VsWriter.h and in <a href="https://docs.microsoft.com/windows/desktop/VSS/writer-errors-and-vetoes">Writer Errors and Vetoes</a>.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
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
     * </dl>
     * </td>
     * <td width="60%">
     * The specified writer does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwriterstatus
     */
    GetWriterStatus(iWriter, pidInstance, pidWriter, pbstrWriter, pnStatus, phResultFailure) {
        pnStatusMarshal := pnStatus is VarRef ? "int*" : "ptr"
        phResultFailureMarshal := phResultFailure is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, "uint", iWriter, "ptr", pidInstance, "ptr", pidWriter, "ptr", pbstrWriter, pnStatusMarshal, pnStatus, phResultFailureMarshal, phResultFailure, "HRESULT")
        return result
    }

    /**
     * The SetBackupSucceeded method indicates whether the backup of the specified component of a specific writer was successful.
     * @remarks
     * When working in component mode (when 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setbackupstate">IVssBackupComponents::SetBackupState</a> is called with its select components argument set to <b>true</b>), writers check the state of each components backup using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getbackupsucceeded">IVssComponent::GetBackupSucceeded</a>. Therefore, a well-behaved backup application (requester) must call 
     * <b>SetBackupSucceeded</b> after each component has been processed and prior to calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-backupcomplete">IVssBackupComponents::BackupComplete</a>.
     * 
     * Do not call this method if the call to <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-dosnapshotset">IVssBackupComponents::DoSnapshotSet</a> failed.  For more information about how requesters use  <b>DoSnapshotSet</b>, <b>SetBackupSucceeded</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-backupcomplete">BackupComplete</a> in a backup operation, see <a href="https://docs.microsoft.com/windows/desktop/VSS/overview-of-pre-backup-tasks">Overview of Pre-Backup Tasks</a> and <a href="https://docs.microsoft.com/windows/desktop/VSS/overview-of-actual-backup-of-files">Overview of Actual Backup Of Files</a>.
     * @param {Guid} instanceId Globally unique identifier (GUID) of the writer instance.
     * @param {Guid} writerId Globally unique identifier (GUID) of the writer class.
     * @param {VSS_COMPONENT_TYPE} ct Type of the component. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> for the possible values.
     * @param {PWSTR} wszLogicalPath <b>Null</b>-terminated wide character string containing the logical path of the component. 
     * 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * The value of the string containing the logical path used here should be the same as was used when the component was added to the backup set using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * 
     * The logical path can be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @param {PWSTR} wszComponentName <b>Null</b>-terminated wide character string containing the name of the component. 
     * 
     * 
     * 
     * 
     * The string cannot be <b>NULL</b> and should contain the same component name as was used when the component was added to the backup set using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * @param {Integer} bSucceded Set this parameter to <b>true</b> if the component was successfully backed up, or <b>false</b> otherwise.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully set the backup succeeded state.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup component does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setbackupsucceeded
     */
    SetBackupSucceeded(instanceId, writerId, ct, wszLogicalPath, wszComponentName, bSucceded) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName

        result := ComCall(20, this, "ptr", instanceId, "ptr", writerId, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "char", bSucceded, "HRESULT")
        return result
    }

    /**
     * The SetBackupOptions method sets a string of private, or writer-dependent, backup parameters for a component.
     * @remarks
     * The exact syntax and content of the backup options set by the <i>wszBackupOptions</i> parameter of the 
     * <b>SetBackupOptions</b> method will depend on the specific writer being contacted.
     * 
     * This method must be called before 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prepareforbackup">IVssBackupComponents::PrepareForBackup</a>.
     * @param {Guid} writerId Writer identifier.
     * @param {VSS_COMPONENT_TYPE} ct Type of the component. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> for the possible values.
     * @param {PWSTR} wszLogicalPath <b>Null</b>-terminated wide character string containing the logical path of the component. 
     * 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * The value of the string containing the logical path used here should be the same as was used when the component was added to the backup set using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * 
     * The logical path can be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @param {PWSTR} wszComponentName <b>Null</b>-terminated wide character string containing the name of the component. 
     * 
     * 
     * 
     * 
     * The string containing the name cannot be <b>NULL</b> and should contain the same component name as was used when the component was added to the backup set using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * @param {PWSTR} wszBackupOptions <b>Null</b>-terminated wide character string containing the backup parameters to be set.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully set the backup options.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup component does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setbackupoptions
     */
    SetBackupOptions(writerId, ct, wszLogicalPath, wszComponentName, wszBackupOptions) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszBackupOptions := wszBackupOptions is String ? StrPtr(wszBackupOptions) : wszBackupOptions

        result := ComCall(21, this, "ptr", writerId, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "ptr", wszBackupOptions, "HRESULT")
        return result
    }

    /**
     * The SetSelectedForRestore method indicates whether the specified selectable component is selected for restoration.
     * @remarks
     * <b>SetSelectedForRestore</b> has 
     *     meaning only for restores taking place in component mode.
     * 
     * <b>SetSelectedForRestore</b> can 
     *     only be called for components that were explicitly added to the backup document at backup time using 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>. 
     *     Restoring a component that was implicitly selected for backup as part of a component set must be done by calling 
     *    <b>SetSelectedForRestore</b> on the 
     *     closest ancestor component that was added to the document. If only this component's data is to be restored, that 
     *     should be accomplished through 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addrestoresubcomponent">IVssBackupComponents::AddRestoreSubcomponent</a>; 
     *     this can only be done if the component is selectable for restore (see 
     *     <a href="https://docs.microsoft.com/windows/desktop/VSS/working-with-selectability-and-logical-paths">Working with Selectability and 
     *     Logical Paths</a>).
     * 
     * This method must be called before 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore">IVssBackupComponents::PreRestore</a>.
     * @param {Guid} writerId Writer identifier.
     * @param {VSS_COMPONENT_TYPE} ct Type of the component. See <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> 
     *       for the possible values.
     * @param {PWSTR} wszLogicalPath <b>Null</b>-terminated wide character string containing the logical path of the component. 
     *       For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * The value of the string containing the logical path used here should be the same as was used when the 
     *        component was added.
     * 
     * The logical path can be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @param {PWSTR} wszComponentName <b>Null</b>-terminated wide character string containing the name of the component. 
     *      
     * 
     * The string cannot be <b>NULL</b> and should contain the same component name as was used when the component was added 
     *       to the backup set using 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * @param {Integer} bSelectedForRestore If the value of this parameter is <b>true</b>, the selected component has been selected for restoration. If the 
     *      value is <b>false</b>, the selected component has not been selected for restoration.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully indicated that the specified component has been selected to be restored.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
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
     * </dl>
     * </td>
     * <td width="60%">
     * The component being selected does not exist in the Backup Components Document, or a live instance of the 
     *         writer corresponding to that component is not running on the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more 
     *         information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setselectedforrestore
     */
    SetSelectedForRestore(writerId, ct, wszLogicalPath, wszComponentName, bSelectedForRestore) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName

        result := ComCall(22, this, "ptr", writerId, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "char", bSelectedForRestore, "HRESULT")
        return result
    }

    /**
     * The SetRestoreOptions method sets a string of private, or writer-dependent, restore parameters for a writer component.
     * @remarks
     * This method must be called before 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore">IVssBackupComponents::PreRestore</a>.
     * 
     * The exact syntax and content of the restore options set by the <i>wszRestoreOptions</i> 
     *     parameter of the 
     *     <b>SetRestoreOptions</b> method will 
     *     depend on the specific writer being contacted.
     * @param {Guid} writerId Writer identifier.
     * @param {VSS_COMPONENT_TYPE} ct Type of the component. See <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> 
     *       for the possible values.
     * @param {PWSTR} wszLogicalPath Null-terminated wide character string containing the logical path of the component. 
     *       For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * The value of the string containing the logical path used here should be the same as was used when the 
     *        component was added to the backup set using 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * 
     * The logical path can be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-NULL logical path.
     * @param {PWSTR} wszComponentName Null-terminated wide character string containing the name of the component. 
     *       
     * 
     * The string cannot be <b>NULL</b> and should contain the same component name as was used when the component was added 
     *       to the backup set using 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * @param {PWSTR} wszRestoreOptions Null-terminated wide character string containing the private string of restore parameters. For more 
     *       information see <a href="https://docs.microsoft.com/windows/desktop/VSS/setting-vss-restore-options">Setting VSS Restore 
     *       Options</a>.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully set the previous backup time stamp.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
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
     * </dl>
     * </td>
     * <td width="60%">
     * The backup component does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more 
     *         information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setrestoreoptions
     */
    SetRestoreOptions(writerId, ct, wszLogicalPath, wszComponentName, wszRestoreOptions) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszRestoreOptions := wszRestoreOptions is String ? StrPtr(wszRestoreOptions) : wszRestoreOptions

        result := ComCall(23, this, "ptr", writerId, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "ptr", wszRestoreOptions, "HRESULT")
        return result
    }

    /**
     * The SetAdditionalRestores method is used by a requester during incremental or differential restore operations to indicate to writers that a given component will require additional restore operations to completely retrieve it.
     * @remarks
     * The information provided by the 
     * <b>SetAdditionalRestores</b> method is typically used by writers that support an explicit recovery mechanism as part of their 
     * PostRestore event handler (<a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpostrestore">CVssWriter::OnPostRestore</a>)—for instance, the Exchange Server, and database applications such as SQL Server. For these applications, it is often not possible to perform additional differential, incremental, or log restores after such a recovery is performed.
     * 
     * Therefore, if 
     * <b>SetAdditionalRestores</b> for a component is set to <b>true</b>, this means that such a writer should not execute its explicit recovery mechanism and should expect that additional differential, incremental, or log restores will be done.
     * 
     * When 
     * <b>SetAdditionalRestores</b> on a component is set to <b>false</b>, then after the component is restored, the application can complete its recovery operation and be brought back online.
     * 
     * This method must be called before 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore">IVssBackupComponents::PreRestore</a>.
     * @param {Guid} writerId Writer identifier.
     * @param {VSS_COMPONENT_TYPE} ct Type of the component. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> for the possible values.
     * @param {PWSTR} wszLogicalPath <b>Null</b>-terminated wide character string containing the logical path of the component to be added. 
     * 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * The value of the string containing the logical path used here should be the same as was used when the component was added to the backup set using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * 
     * The logical path can be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @param {PWSTR} wszComponentName <b>Null</b>-terminated wide character string containing the name of the component. 
     * 
     * 
     * 
     * 
     * The value of the string should not be <b>NULL</b>, and should contain the same component as was used when the component was added to the backup set using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * @param {Integer} bAdditionalRestores If the value of this parameter is <b>true</b>, additional restores of the component will follow this restore. If the value is <b>false</b>, additional restores of the component will not follow this restore.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully set the additional restore status.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup component does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setadditionalrestores
     */
    SetAdditionalRestores(writerId, ct, wszLogicalPath, wszComponentName, bAdditionalRestores) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName

        result := ComCall(24, this, "ptr", writerId, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "char", bAdditionalRestores, "HRESULT")
        return result
    }

    /**
     * The SetPreviousBackupStamp method sets the backup stamp of an earlier backup operation, upon which a differential or incremental backup operation will be based.
     * @remarks
     * This method should be called before 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prepareforbackup">IVssBackupComponents::PrepareForBackup</a>.
     * 
     * Only requesters can call this method.
     * 
     * The backup stamp set by 
     * <b>SetPreviousBackupStamp</b> applies to all files in the component and any nonselectable subcomponents it has.
     * 
     * Requesters merely store the backup stamps in the Backup Components Document. They cannot make direct use of the backup stamps, do not know their format, and do not know how to generate them.
     * 
     * Therefore, the value set with 
     * <b>SetPreviousBackupStamp</b> should either be retrieved from the stored Backup Components Document of an earlier backup operation (using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getbackupstamp">IVssComponent::GetBackupStamp</a> for the correct component), or from information stored by the requester into its own internal records.
     * 
     * A writer will then obtain this value (using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getpreviousbackupstamp">IVssComponent::GetPreviousBackupStamp</a>) and using it will be able to mark the appropriate files for participation in an incremental or differential backup.
     * @param {Guid} writerId Writer identifier.
     * @param {VSS_COMPONENT_TYPE} ct Type of the component. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> for the possible values.
     * @param {PWSTR} wszLogicalPath <b>Null</b>-terminated wide character string containing the logical path of the component. 
     * 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * The value of the string containing the logical path used here should be the same as was used when the component was added to the backup set using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * 
     * The logical path can be <b>NULL</b>.
     * @param {PWSTR} wszComponentName <b>Null</b>-terminated wide character string containing the name of the component. 
     * 
     * 
     * 
     * 
     * The string cannot be <b>NULL</b> and should contain the same component name as was used when the component was added to the backup set using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * @param {PWSTR} wszPreviousBackupStamp The backup stamp to be set.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully set the previous backup time stamp.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup component does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setpreviousbackupstamp
     */
    SetPreviousBackupStamp(writerId, ct, wszLogicalPath, wszComponentName, wszPreviousBackupStamp) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszPreviousBackupStamp := wszPreviousBackupStamp is String ? StrPtr(wszPreviousBackupStamp) : wszPreviousBackupStamp

        result := ComCall(25, this, "ptr", writerId, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "ptr", wszPreviousBackupStamp, "HRESULT")
        return result
    }

    /**
     * The SaveAsXML method saves the Backup Components Document containing a requester's state information to a specified string. This XML document, which contains the Backup Components Document, should always be securely saved as part of a backup operation.
     * @remarks
     * For a typical backup operation, 
     * <b>SaveAsXML</b> should not be called until after both writers and the requester are finished modifying the Backup Components Document.
     * 
     * Writers can continue to modify the Backup Components Document until their successful return from handling the PostSnapshot event (<a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpostsnapshot">CVssWriter::OnPostSnapshot</a>), or equivalently upon the completion of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-dosnapshotset">IVssBackupComponents::DoSnapshotSet</a>.
     * 
     * Requesters will need to continue to modify the Backup Components Document as the backup progresses. In particular, a requester will store a component-by-component record of the success or failure of the backup through calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setbackupsucceeded">IVssBackupComponents::SetBackupSucceeded</a> method.
     * 
     * Once the requester has finished modifying the Backup Components Document, the requester should use 
     * <b>SaveAsXML</b> to save a copy of the document to the backup media.
     * 
     * A Backup Components Document can be saved at earlier points in the life cycle of a backup operation—for instance, to support the generation of transportable shadow copies to be handled on remote machines. (See 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/importing-transportable-shadow-copied-volumes">Importing Transportable Shadow Copied Volumes</a> for more information.)
     * 
     * However, 
     * <b>SaveAsXML</b> should never be called prior to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prepareforbackup">IVssBackupComponents::PrepareForBackup</a>, because the Backup Components Document will not have been filled by the requester and the writers.
     * @param {Pointer<BSTR>} pbstrXML Pointer to a string to be used to store the Backup Components Document containing a requester's state information.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully saved the XML document as the <i>pbstrXML</i> parameter value.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-saveasxml
     */
    SaveAsXML(pbstrXML) {
        result := ComCall(26, this, "ptr", pbstrXML, "HRESULT")
        return result
    }

    /**
     * The BackupComplete method causes VSS to generate a BackupComplete event, which signals writers that the backup process has completed.
     * @remarks
     * When working in component mode (<a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setbackupstate">IVssBackupComponents::SetBackupState</a> was called with a select components argument of <b>TRUE</b>), writers can determine the success or failure of the backup of any component explicitly included in the Backup Components Document components by using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getbackupsucceeded">IVssComponent::GetBackupSucceeded</a>. Therefore, a well-behaved backup application (requester) must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setbackupsucceeded">IVssBackupComponents::SetBackupSucceeded</a> after each component has been processed and prior to calling 
     * <b>BackupComplete</b>.
     * 
     * Do not call this method if the call to <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-dosnapshotset">IVssBackupComponents::DoSnapshotSet</a> failed. For more information about how requesters use  <b>DoSnapshotSet</b>, <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setbackupsucceeded">SetBackupSucceeded</a>, and <b>BackupComplete</b> in a backup operation, see <a href="https://docs.microsoft.com/windows/desktop/VSS/overview-of-pre-backup-tasks">Overview of Pre-Backup Tasks</a> and <a href="https://docs.microsoft.com/windows/desktop/VSS/overview-of-actual-backup-of-files">Overview of Actual Backup Of Files</a>.
     * 
     * This operation is asynchronous. The caller can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/nf-vss-ivssasync-querystatus">QueryStatus</a> interface method in the returned 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> interface to determine the status of the notification.
     * 
     * After calling <b>BackupComplete</b>, requesters must call <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwriterstatus">GatherWriterStatus</a> to cause the writer session to be set to a completed state.
     * 
     * <div class="alert"><b>Note</b>  This is only necessary on Windows Server 2008 with Service Pack 2 (SP2) and earlier.</div>
     * <div> </div>
     * The backup application can choose to abort the backup at any time after the shadow copy is created by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/nf-vss-ivssasync-cancel">IVssAsync::Cancel</a>.
     * 
     * The calling application is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> to release the resources held by the returned 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> when it is no longer needed.
     * @returns {IVssAsync} Doubly indirect pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> instance.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-backupcomplete
     */
    BackupComplete() {
        result := ComCall(27, this, "ptr*", &ppAsync := 0, "HRESULT")
        return IVssAsync(ppAsync)
    }

    /**
     * The AddAlternativeLocationMapping method is used by a requester to indicate that an alternate location mapping was used to restore all the members of a file set in a given component.
     * @remarks
     * <b>Windows 7, Windows Server 2008 R2, Windows Vista, Windows Server 2008, Windows XP and Windows Server 2003:  </b>Remote file shares are not supported until Windows 8 and Windows Server 2012.
     * 
     * The <i>writerId</i>, <i>componentType</i>, <i>wszLogicalPath</i>, and <i>wszComponentName</i> parameters identify a particular component, and the <i>wszPath</i>, <i>wszFilespec</i>, and <i>bRecursive</i> parameters identify the file set belonging to that component.
     * 
     * The combination of path, file specification, and recursion flag (<i>wszPath</i>, <i>wszFilespec</i>, and <i>bRecursive</i>, respectively) provided to 
     * <b>AddAlternativeLocationMapping</b> to be mapped must match that of one of the file sets added to a component using either 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-addfilestofilegroup">IVssCreateWriterMetadata::AddFilesToFileGroup</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-adddatabasefiles">IVssCreateWriterMetadata::AddDatabaseFiles</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-adddatabaselogfiles">IVssCreateWriterMetadata::AddDatabaseLogFiles</a>.
     * 
     * Because 
     * <b>AddAlternativeLocationMapping</b> is used to notify a writer that an alternate location was used to restore all the files in a component, it should not be called for any component or files in a component that have not had an alternate location mapping specified.
     * 
     * The value of <i>wszPath</i> will have been mapped to <i>wszDestination</i> on restore; however, file names and subdirectories under the original path retain their same names.
     * 
     * A typical usage of 
     * <b>AddAlternativeLocationMapping</b> during restore might be the following:
     * 
     * <ol>
     * <li>Retrieve stored Writer Metadata Documents from the backup media and load that information with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-loadfromxml">IVssExamineWriterMetadata::LoadFromXML</a>.</li>
     * <li>Call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getalternatelocationmapping">IVssExamineWriterMetadata::GetAlternateLocationMapping</a> to get an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> interface with the mapping information and use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsswmfiledesc-getalternatelocation">IVssWMFiledesc::GetAlternateLocation</a> to get the alternate location.</li>
     * <li>Examine filedesc information to heuristically determine which component this alternate location mapping should be applied to.</li>
     * <li>Call 
     * <b>IVssBackupComponents::AddAlternativeLocationMapping</b> to communicate where files were restored.</li>
     * </ol>
     * A file should always be restored to its alternate location mapping if either of the following is true:
     * 
     * <ul>
     * <li>The restore method (set at backup time) is VSS_RME_RESTORE_TO_ALTERNATE_LOCATION.</li>
     * <li>Its restore target was set (at restore time) to VSS_RT_ALTERNATE.</li>
     * </ul>
     * In either case, if no valid alternate location mapping is defined this constitutes a writer error.
     * 
     * A file may be restored to an alternate location mapping if either of the following is true:
     * 
     * <ul>
     * <li>The restore method is VSS_RME_RESTORE_IF_NOT_THERE and a version of the file is already present on disk.</li>
     * <li>The restore method is VSS_RME_RESTORE_IF_CAN_REPLACE and a version of the file is present on disk and cannot be replaced.</li>
     * </ul>
     * Again, if no valid alternate location mapping is defined this constitutes a writer error.
     * 
     * An alternate location mapping is used only during a restore operation and should not be confused with an alternate path, which is used only during a backup operation.
     * @param {Guid} writerId Globally unique identifier (GUID) of the writer class that exported the component.
     * @param {VSS_COMPONENT_TYPE} _componentType Type of the component. The possible values of this parameter are defined by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> enumeration.
     * @param {PWSTR} wszLogicalPath <b>Null</b>-terminated wide character string containing the logical path to the component. 
     * 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * The logical path can be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @param {PWSTR} wszComponentName <b>Null</b>-terminated wide character string containing the component name. 
     * 
     * 
     * 
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @param {PWSTR} wszPath <b>Null</b>-terminated wide character string containing the path to the directory that originally contained the file to be relocated. This path can be local to the VSS machine, or it can be a file share directory on a remote file server. 
     * 
     * 
     * 
     * 
     * The path can contain environment variables (for example, %SystemRoot%) but cannot contain wildcard characters. UNC paths are supported.
     * 
     * There is no requirement that the path end with a backslash ("\"). It is up to applications that retrieve this information to check.
     * @param {PWSTR} wszFilespec <b>Null</b>-terminated wide character string containing the original file specification. 
     * 
     * 
     * 
     * 
     * A file specification cannot contain directory specifications (for example, no backslashes) but can contain the ? and * wildcard characters.
     * @param {Integer} bRecursive A Boolean value that indicates whether the path specified by the <i>wszPath</i> parameter identifies only a single directory or if it indicates a hierarchy of directories to be traversed recursively. This parameter should be set to <b>true</b> if the path is treated as a hierarchy of directories to be traversed recursively, or <b>false</b> if not. 
     * 
     * 
     * 
     * 
     * For information on traversing mounted folders, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/working-with-reparse-and-mount-points">Working with Mounted Folders and Reparse Points</a>.
     * @param {PWSTR} wszDestination <b>Null</b>-terminated wide character string containing the name of the directory where the file will be relocated. This path can be local to the VSS machine, or it can be a file share directory on a remote file server. UNC paths are supported.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully added the alternate location mapping.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified component does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addalternativelocationmapping
     */
    AddAlternativeLocationMapping(writerId, _componentType, wszLogicalPath, wszComponentName, wszPath, wszFilespec, bRecursive, wszDestination) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilespec := wszFilespec is String ? StrPtr(wszFilespec) : wszFilespec
        wszDestination := wszDestination is String ? StrPtr(wszDestination) : wszDestination

        result := ComCall(28, this, "ptr", writerId, "int", _componentType, "ptr", wszLogicalPath, "ptr", wszComponentName, "ptr", wszPath, "ptr", wszFilespec, "char", bRecursive, "ptr", wszDestination, "HRESULT")
        return result
    }

    /**
     * Indicates that a subcomponent member of a component set, which had been marked as nonselectable for backup but is marked selectable for restore, is to be restored.
     * @remarks
     * Before calling 
     *     <b>AddRestoreSubcomponent</b>, the 
     *     root component defined by the <i>wszLogicalPath</i> and 
     *     <i>wszComponentName</i> parameters must first be selected for restore using 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setselectedforrestore">IVssBackupComponents::SetSelectedForRestore</a>.
     * 
     * If a requester is to support restoring subcomponents, this method must be called before 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore">IVssBackupComponents::PreRestore</a>.
     * 
     * <b>AddRestoreSubcomponent</b> 
     *     is intended for the case in which all the files in a writer's component set must be backed up as a unit, but where 
     *     it is desirable that selected files (subcomponents) be capable of being restored individually.
     * 
     * To participate in such a restore, a subcomponent must have the 
     *     <b>bSelectableForRestore</b> member of 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/ns-vsbackup-vss_componentinfo">VSS_COMPONENTINFO</a> set to <b>TRUE</b>. The component defined 
     *     by the <i>wszLogicalPath</i> and <i>wszComponentName</i> parameters must 
     *     also be selected for restore using 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setselectedforrestore">IVssBackupComponents::SetSelectedForRestore</a>.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/VSS/working-with-selectability-for-restore-and-subcomponents">Working with 
     *     Selectability for Restore and Subcomponents</a> for more information.
     * @param {Guid} writerId Writer class identifier.
     * @param {VSS_COMPONENT_TYPE} _componentType Identifies the type of the component. Refer to the documentation for 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> for possible return values.
     * @param {PWSTR} wszLogicalPath <b>Null</b>-terminated wide character string containing the logical path of the component in the backup document 
     *       that defines the backup component set containing the subcomponent to be added for restore. 
     *       
     * 
     * The value of this parameter can be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @param {PWSTR} wszComponentName <b>Null</b>-terminated wide character string containing the logical path of the component in the backup document 
     *       that defines the backup component set containing the subcomponent to be added for restore.
     *       
     * 
     * The value of this parameter cannot be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> component name.
     * @param {PWSTR} wszSubComponentLogicalPath <b>Null</b>-terminated wide character string containing the logical path of the subcomponent to be added for 
     *       restore.
     *       
     * 
     * A logical path is required when adding a subcomponent. Therefore, the value of this parameter cannot be 
     *        <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @param {PWSTR} wszSubComponentName <b>Null</b>-terminated wide character string containing the logical name of the subcomponent to be added for 
     *       restore. 
     *       
     * 
     * The value of this parameter cannot be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> component name.
     * @param {Integer} bRepair This parameter is reserved for future use. This parameter should always be set to <b>false</b>
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully added the restore subcomponent.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has not been called during a restore 
     *         operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more 
     *         information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The component does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addrestoresubcomponent
     */
    AddRestoreSubcomponent(writerId, _componentType, wszLogicalPath, wszComponentName, wszSubComponentLogicalPath, wszSubComponentName, bRepair) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszSubComponentLogicalPath := wszSubComponentLogicalPath is String ? StrPtr(wszSubComponentLogicalPath) : wszSubComponentLogicalPath
        wszSubComponentName := wszSubComponentName is String ? StrPtr(wszSubComponentName) : wszSubComponentName

        result := ComCall(29, this, "ptr", writerId, "int", _componentType, "ptr", wszLogicalPath, "ptr", wszComponentName, "ptr", wszSubComponentLogicalPath, "ptr", wszSubComponentName, "char", bRepair, "HRESULT")
        return result
    }

    /**
     * The SetFileRestoreStatus method indicates whether some, all, or no files were successfully restored.
     * @remarks
     * This method should be called between calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore">IVssBackupComponents::PreRestore</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-postrestore">IVssBackupComponents::PostRestore</a>.
     * @param {Guid} writerId Writer identifier.
     * @param {VSS_COMPONENT_TYPE} ct Type of the component. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> for the possible values.
     * @param {PWSTR} wszLogicalPath <b>Null</b>-terminated wide character string containing the logical path of the component. 
     * 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * The value of the string containing the logical path used here should be the same as was used when the component was added to the backup set using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * 
     * The logical path can be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @param {PWSTR} wszComponentName <b>Null</b>-terminated wide character string containing the name of the component. 
     * 
     * 
     * 
     * 
     * The string cannot be <b>NULL</b> and should contain the same component name as was used when the component was added to the backup set using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * @param {VSS_FILE_RESTORE_STATUS} _status If all of the files were restored, the value of this parameter is VSS_RS_ALL. If some of the files were restored, the value of this parameter is VSS_RS_FAILED. If none of the files were restored, the value of this parameter is VSS_RS_NONE.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully set the file restore status.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup component does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setfilerestorestatus
     */
    SetFileRestoreStatus(writerId, ct, wszLogicalPath, wszComponentName, _status) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName

        result := ComCall(30, this, "ptr", writerId, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "int", _status, "HRESULT")
        return result
    }

    /**
     * The AddNewTarget method is used by a requester during a restore operation to indicate that the backup application plans to restore files to a new location.
     * @remarks
     * <b>Windows 7, Windows Server 2008 R2, Windows Vista, Windows Server 2008, Windows XP and Windows Server 2003:  </b>Remote file shares are not supported until Windows 8 and Windows Server 2012.
     * 
     * The component name specified as an argument to 
     * <b>AddNewTarget</b> (<i>wszComponentName</i>) must match a component that has already been added to the Backup Components Document.
     * 
     * Therefore, <i>wszComponentName</i> can be the name of any component explicitly included in the Backup Components Document.
     * 
     * Adding a new target for file in a subcomponent must be done using the name of the component that defines the component set containing the subcomponent.
     * 
     * When specifying a file or files to have their restore target changed, a requester must ensure that the combination of path, file specification, and recursion flag (<i>wszPath</i>, <i>wszFileSpec</i>, and  <i>bRecursive</i>, respectively) provided to 
     * <b>AddNewTarget</b> must match that of one of the file sets added to a component using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-addfilestofilegroup">IVssCreateWriterMetadata::AddFilesToFileGroup</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-adddatabasefiles">IVssCreateWriterMetadata::AddDatabaseFiles</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-adddatabaselogfiles">IVssCreateWriterMetadata::AddDatabaseLogFiles</a>.
     * 
     * When a requester calls <b>AddNewTarget</b>, it must do so before calling <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore">IVssBackupComponents::PreRestore</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/overview-of-preparing-for-restore">Overview of Preparing for Restore</a>.
     * 
     * Path and file descriptor information can be obtained from the Writer Metadata Document by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivsswmcomponent-getfile">IVssWMComponent::GetFile</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivsswmcomponent-getdatabasefile">IVssWMComponent::GetDatabaseFile</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivsswmcomponent-getdatabaselogfile">IVssWMComponent::GetDatabaseLogFile</a>. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivsswmcomponent">IVssWMComponent</a> object is obtained from Writer Metadata Document by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getcomponent">IVssExamineWriterMetadata::GetComponent</a> method.
     * 
     * Writers can determine if files have been restored to new locations by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getnewtargetcount">IVssComponent::GetNewTargetCount</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getnewtarget">IVssComponent::GetNewTarget</a> methods.
     * @param {Guid} writerId Globally unique identifier (GUID) of the writer class containing the files that are to receive a new target.
     * @param {VSS_COMPONENT_TYPE} ct Identifies the type of the component. Refer to the documentation for 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> for possible return values.
     * @param {PWSTR} wszLogicalPath <b>Null</b>-terminated wide character string containing the logical path of the component containing the files that are to receive a new restore target. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>. 
     * 
     * 
     * 
     * 
     * The value of the string containing the logical path used here should be the same as was used when the component was added to the backup set using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * 
     * The logical path can be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @param {PWSTR} wszComponentName <b>Null</b>-terminated wide character string containing the name of the component containing the files that are to receive a new restore target. 
     * 
     * 
     * 
     * 
     * The string should not be <b>NULL</b> and should contain the same component name as was used when the component was added to the backup set using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @param {PWSTR} wszPath <b>Null</b>-terminated wide character string containing the name of the directory or directory hierarchy containing the files to receive a new restore target. 
     * 
     * 
     * 
     * 
     * The directory can be a local directory on the VSS machine, or it can be a file share directory on a remote file server.
     * 
     * The path can contain environment variables (for example, %SystemRoot%) but cannot contain wildcard characters. UNC paths are supported.
     * 
     * There is no requirement that the path end with a backslash ("\"). It is up to applications that retrieve this information to check.
     * @param {PWSTR} wszFileName <b>Null</b>-terminated wide character string containing the file specification of the files to receive a new restore target. 
     * 
     * 
     * 
     * 
     * A file specification cannot contain directory specifications (for example, no backslashes) but can contain the ? and * wildcard characters.
     * @param {Integer} bRecursive Boolean indicating whether only the files in the directory defined by <i>wszPath</i> and matching the file specification provided by <i>wszFileName</i> are to receive a new restore target, or if all files in the hierarchy defined by <i>wszPath</i> and matching the file specification provided by <i>wszFileName</i> are to receive a new restore target. 
     * 
     * 
     * 
     * 
     * For information on traversing mounted folders, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/working-with-reparse-and-mount-points">Working with Mounted Folders and Reparse Points</a>.
     * @param {PWSTR} wszAlternatePath <b>Null</b>-terminated wide character string containing the fully qualified path of the new restore target directory. 
     * 
     * The directory can be a local directory on the VSS machine, or it can be a file share directory on a remote file server.
     * 
     * UNC paths are supported.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully added the new restore target.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, or this method has been called during a restore operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The component does not exist or the path and file specification do not match a component and file specification in the component.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addnewtarget
     */
    AddNewTarget(writerId, ct, wszLogicalPath, wszComponentName, wszPath, wszFileName, bRecursive, wszAlternatePath) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFileName := wszFileName is String ? StrPtr(wszFileName) : wszFileName
        wszAlternatePath := wszAlternatePath is String ? StrPtr(wszAlternatePath) : wszAlternatePath

        result := ComCall(31, this, "ptr", writerId, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "ptr", wszPath, "ptr", wszFileName, "char", bRecursive, "ptr", wszAlternatePath, "HRESULT")
        return result
    }

    /**
     * The SetRangesFilePath method is used when a partial file operation requires a ranges file, and that file has been restored to a location other than its original one.
     * @remarks
     * Calling 
     * <b>SetRangesFilePath</b> is not necessary if ranges files are restored in place.
     * @param {Guid} writerId Globally unique identifier (GUID) of the writer class containing the files involved in the partial file operation.
     * @param {VSS_COMPONENT_TYPE} ct Identifies the type of the component. Refer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> for possible return values.
     * @param {PWSTR} wszLogicalPath <b>Null</b>-terminated wide character string containing the logical path of the component containing the files that are participating in the partial file operation. 
     * 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * The value of the string containing the logical path used here should be the same as was used when the component was added to the backup set using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * 
     * The logical path can be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @param {PWSTR} wszComponentName <b>Null</b>-terminated wide character string containing the name of the component containing the files that are participating in the partial file operation. 
     * 
     * 
     * 
     * 
     * The string cannot be <b>NULL</b> and should contain the same component name as was used when the component was added to the backup set using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * @param {Integer} iPartialFile Index number of the partial file. The value of this parameter is an integer from 0 
     *       to <i>n</i>–1 inclusive, where <i>n</i> is the total number of partial files associated with a given component. The value of <i>n</i> is returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getpartialfilecount">IVssComponent::GetPartialFileCount</a>.
     * @param {PWSTR} wszRangesFile <b>Null</b>-terminated wide character string containing the fully qualified path of a ranges file.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully added the new restore target.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, or this method has been called other than during a restore operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The component does not exist or the path and file specification do not match a component and file specification in the component.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setrangesfilepath
     */
    SetRangesFilePath(writerId, ct, wszLogicalPath, wszComponentName, iPartialFile, wszRangesFile) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszRangesFile := wszRangesFile is String ? StrPtr(wszRangesFile) : wszRangesFile

        result := ComCall(32, this, "ptr", writerId, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "uint", iPartialFile, "ptr", wszRangesFile, "HRESULT")
        return result
    }

    /**
     * The PreRestore method will cause VSS to generate a PreRestore event, signaling writers to prepare for an upcoming restore operation.
     * @remarks
     * The caller is responsible for releasing the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> interface pointer.
     * 
     * Special consideration should be given to EFI systems when the requester has selected the Automated System Recovery (ASR) writer for restore.  If you are restoring to a disk that contains the EFI partition, and one of the following conditions exists, you must first clean the disk by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-clean">IVdsAdvancedDisk::Clean</a> method:
     * 
     * <ul>
     * <li>You are restoring to an EFI system disk whose partitioning has changed since the last ASR backup.</li>
     * <li>You are restoring to a different physical drive than the one from which the backup was taken.</li>
     * </ul>
     * Failure to perform this disk-cleaning step may result in unexpected results during <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-p">PreRestore</a>.
     * 
     * For more information about the ASR writer, see <a href="https://docs.microsoft.com/windows/desktop/VSS/in-box-vss-writers">In-Box VSS Writers</a>.
     * @returns {IVssAsync} Doubly indirect pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> object containing status data for the signaled event.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore
     */
    PreRestore() {
        result := ComCall(33, this, "ptr*", &ppAsync := 0, "HRESULT")
        return IVssAsync(ppAsync)
    }

    /**
     * The PostRestore method will cause VSS to generate a PostRestore event, signaling writers that the current restore operation has finished.
     * @remarks
     * The caller is responsible for releasing the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> interface.
     * @returns {IVssAsync} Doubly indirect pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> object that contains status data for the signaled event.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-postrestore
     */
    PostRestore() {
        result := ComCall(34, this, "ptr*", &ppAsync := 0, "HRESULT")
        return IVssAsync(ppAsync)
    }

    /**
     * The SetContext method sets the context for subsequent shadow copy-related operations.
     * @remarks
     * The default context for VSS shadow copies is VSS_CTX_BACKUP.
     * 
     * <b>Windows XP:  </b>The only supported context is the default context, VSS_CTX_BACKUP. Therefore, calling 
     *      <b>SetContext</b> under Windows XP returns
     *      E_NOTIMPL.
     * 
     * <b>SetContext</b> can be called only once, 
     *     and it must be called prior to calling most VSS  functions.
     * 
     * For details on how the context set by 
     *     <b>IVssBackupComponents::SetContext</b> affects 
     *     how a shadow copy is created and managed, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/VSS/implementation-details-for-creating-shadow-copies">Implementation Details for 
     *     Creating Shadow Copies</a>.
     *    
     * 
     * For a complete discussion of the permitted shadow copy contexts, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_snapshot_context">_VSS_SNAPSHOT_CONTEXT</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a>.
     * @param {Integer} lContext The context to be set. The context must be one of the supported values of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_snapshot_context">_VSS_SNAPSHOT_CONTEXT</a> or a supported bit mask (or
     *       bitwise OR) of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a> with a 
     *       valid <b>_VSS_SNAPSHOT_CONTEXT</b>.
     * @returns {HRESULT} The default return value of this method is S_OK. The following are the valid return codes for this method.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully set the context.
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
     * One of the parameter values is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or 
     *         this method has not been called within the correct sequence.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setcontext
     */
    SetContext(lContext) {
        result := ComCall(35, this, "int", lContext, "HRESULT")
        return result
    }

    /**
     * The StartSnapshotSet method creates a new, empty shadow copy set.
     * @remarks
     * This method must be called before 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prepareforbackup">IVssBackupComponents::PrepareForBackup</a> during backup operations.
     * @returns {Guid} The address of a caller-allocated variable that receives the shadow copy set identifier.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-startsnapshotset
     */
    StartSnapshotSet() {
        pSnapshotSetId := Guid()
        result := ComCall(36, this, "ptr", pSnapshotSetId, "HRESULT")
        return pSnapshotSetId
    }

    /**
     * The AddToSnapshotSet method adds an original volume or original remote file share to the shadow copy set.
     * @remarks
     * <b>Windows 7, Windows Server 2008 R2, Windows Vista, Windows Server 2008, Windows XP and Windows Server 2003:  </b>Remote file shares are not supported until Windows 8 and Windows Server 2012.
     * 
     * If <i>pwszVolumeName</i> is a UNC share path, the server name portion must be in hostname or fully qualified domain name format. UNC share names with IP addresses must be normalized by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex4-getrootandlogicalprefixpaths">IVssBackupComponentsEx4::GetRootAndLogicalPrefixPaths</a> method before they are passed to <b>AddToSnapshotSet</b>.
     * 
     * The maximum number of shadow copied volumes in a single shadow copy set is 64.
     * 
     * If <i>ProviderId</i> is GUID_NULL, the default provider is selected according to the 
     *     following algorithm:
     *    
     * 
     * <ol>
     * <li>If any hardware provider supports the given volume or remote file share, that provider is selected.</li>
     * <li>If there is no hardware provider available, if any software provider supports the given volume, it 
     *       is selected.
     *      </li>
     * <li>If there is no hardware provider or software provider available, the system provider is selected. 
     *       (There is only one preinstalled system provider, which must support all nonremovable local volumes.)
     *      </li>
     * </ol>
     * This method cannot be called for a virtual hard disk (VHD) that is nested inside another VHD.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>VHDs are not supported.
     * 
     * The shadow copy identifier that is returned in the <i>pidSnapshot</i> parameter is stored in the Backup Components Document. However, there is no method for querying this information, and the caller may need to store it so that it can be used during restore.
     * @param {Pointer<Integer>} pwszVolumeName Null-terminated wide character string containing the name of the volume or the UNC path of the remote file share to be shadow copied. The name or UNC path must be in one of the following formats and must include a trailing backslash (\\): 
     *       
     * 
     * <ul>
     * <li>The path of a mounted folder, for example, Y:\MountX\</li>
     * <li>A drive letter, for example, D:\</li>
     * <li>A volume GUID path of the form \\?&#92;<i>Volume</i>{<i>GUID</i>}\ (where <i>GUID</i> identifies the volume)</li>
     * <li>A UNC path that specifies a remote file share, for example, \\Clusterx\Share1\</li>
     * </ul>
     * @param {Guid} ProviderId The provider to be used. GUID_NULL can be used, in which case the default provider will be used.
     * @returns {Guid} Returned identifier of the added shadow copy.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addtosnapshotset
     */
    AddToSnapshotSet(pwszVolumeName, ProviderId) {
        pwszVolumeNameMarshal := pwszVolumeName is VarRef ? "ushort*" : "ptr"

        pidSnapshot := Guid()
        result := ComCall(37, this, pwszVolumeNameMarshal, pwszVolumeName, "ptr", ProviderId, "ptr", pidSnapshot, "HRESULT")
        return pidSnapshot
    }

    /**
     * Commits all shadow copies in this set simultaneously.
     * @remarks
     * The caller is responsible for releasing the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> interface.
     *    
     * 
     * This method cannot be called for a virtual hard disk (VHD) that is nested inside another VHD.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>VHDs are not supported.
     * 
     * For information on how to use 
     *     <b>IVssBackupComponents::DoSnapshotSet</b> to
     *     create a standard backup shadow copy, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/VSS/overview-of-pre-backup-tasks">Overview of Pre-Backup Tasks</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/VSS/simple-shadow-copy-creation-for-backup">Simple Shadow Copy Creation for Backup</a>.
     *     For information on how the method is used under different VSS contexts, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/VSS/implementation-details-for-creating-shadow-copies">Implementation Details for 
     *     Creating Shadow Copies</a>.
     * @returns {IVssAsync} A
     *       doubly indirect pointer to the required <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> asynchronous 
     *       interface. This is used to query the method execution state and to retrieve the final error code.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-dosnapshotset
     */
    DoSnapshotSet() {
        result := ComCall(38, this, "ptr*", &ppAsync := 0, "HRESULT")
        return IVssAsync(ppAsync)
    }

    /**
     * The DeleteSnapshots method deletes one or more shadow copies or a shadow copy set.
     * @remarks
     * Multiple shadow copies in a shadow copy set are deleted sequentially. If an error occurs during one of these 
     *     individual deletions, 
     *     <b>DeleteSnapshots</b> will return
     *     immediately; no attempt will be made to delete any remaining shadow copies. The 
     *     <a href="https://docs.microsoft.com/windows/desktop/VSS/volume-shadow-copy-api-data-types">VSS_ID</a> of the undeleted shadow copy is 
     *     returned in <i>pNondeletedSnapshotID</i>.
     *    
     * 
     * The requester is responsible for serializing the delete shadow copy operation.
     * 
     * During a backup, shadow copies are automatically released as soon as the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssbackupcomponents">IVssBackupComponents</a> instance is released. In this 
     *     case, it is not necessary to explicitly delete shadow copies.
     * @param {Guid} SourceObjectId Identifier of the shadow copy or a shadow copy set to be deleted.
     * @param {VSS_OBJECT_TYPE} eSourceObjectType Type of the object on which all shadow copies will be deleted. The value of this parameter is
     *       <b>VSS_OBJECT_SNAPSHOT</b> or <b>VSS_OBJECT_SNAPSHOT_SET</b>.
     * @param {BOOL} bForceDelete If the value of this parameter is <b>TRUE</b>, the provider will do everything possible to delete the shadow copy or 
     *       shadow copies in a shadow copy set. If it is <b>FALSE</b>, no additional effort will be made.
     * @param {Pointer<Integer>} plDeletedSnapshots Number of deleted shadow copies.
     * @param {Pointer<Guid>} pNondeletedSnapshotID If an error occurs, the value of this parameter is the identifier of the first shadow copy that could not be 
     *       deleted. Otherwise, it is <b>GUID_NULL</b>.
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
     * </dl>
     * </td>
     * <td width="60%">
     * The shadow copies were successfully deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient backup privileges or is not an administrator.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified shadow copy does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_PROVIDER_VETO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Expected provider error. The provider logged the error in the event log. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED_PROVIDER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected provider error. The error code is logged in the error log. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     *        
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-deletesnapshots
     */
    DeleteSnapshots(SourceObjectId, eSourceObjectType, bForceDelete, plDeletedSnapshots, pNondeletedSnapshotID) {
        plDeletedSnapshotsMarshal := plDeletedSnapshots is VarRef ? "int*" : "ptr"

        result := ComCall(39, this, "ptr", SourceObjectId, "int", eSourceObjectType, "int", bForceDelete, plDeletedSnapshotsMarshal, plDeletedSnapshots, "ptr", pNondeletedSnapshotID, "HRESULT")
        return result
    }

    /**
     * Imports shadow copies transported from a different machine.
     * @remarks
     * Only one shadow copy can be imported at a time. 
     * 
     * The requester is responsible for serializing the import shadow copy operation.
     * 
     * The caller is responsible for releasing the <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> 
     *     interface.
     * 
     * For more information on importing shadow copies, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/VSS/importing-transportable-shadow-copied-volumes">Importing Transportable Shadow 
     *     Copied Volumes</a>.
     * 
     * <b>Transportable shadow copies in a cluster:  </b>For details about using transportable shadow copies in a cluster, see 
     *      <a href="https://docs.microsoft.com/windows/desktop/VSS/fast-recovery-using-transportable-shadow-copied-volumes">Fast Recovery Using 
     *      Transportable Shadow Copied Volumes</a>. The transportable shadow copy must be 
     *      imported from outside the cluster as long as the original volume is mounted within the cluster.
     * 
     * <div class="alert"><b>Note</b>   If the shadow copy import fails, the Volume Shadow Copy Service won't clean up LUNs on its own. The requester has to initiate the cleanup of LUNs.</div>
     * <div> </div>
     * @returns {IVssAsync} Doubly indirect pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> object 
     *       containing the imported shadow copy status data.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-importsnapshots
     */
    ImportSnapshots() {
        result := ComCall(40, this, "ptr*", &ppAsync := 0, "HRESULT")
        return IVssAsync(ppAsync)
    }

    /**
     * The BreakSnapshotSet method causes the existence of a shadow copy set to be &quot;forgotten&quot; by VSS.
     * @remarks
     * <b>BreakSnapshotSet</b> can be used only for shadow copies created by a hardware shadow copy provider. This method makes these shadow copies regular volumes.
     * 
     * Shadow copies of volumes "broken" with 
     * <b>BreakSnapshotSet</b> must be managed independently of VSS as stand-alone volumes. See 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/breaking-shadow-copies">Breaking Shadow Copies</a> for more information.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex2-breaksnapshotsetex">IVssBackupComponentsEx2::BreakSnapshotSetEx</a> is similar to the <b>BreakSnapshotSet</b> method, except that it has extra parameters to query status and specify how the shadow copy set is broken.
     * @param {Guid} SnapshotSetId Shadow copy set identifier.
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
     * </dl>
     * </td>
     * <td width="60%">
     * The shadow copy set was successfully broken.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient backup privileges or is not an administrator.
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
     * One of the parameter values is not valid.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified shadow copy does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_PROVIDER_VETO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shadow copy was created by a software provider and cannot be broken.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-breaksnapshotset
     */
    BreakSnapshotSet(SnapshotSetId) {
        result := ComCall(41, this, "ptr", SnapshotSetId, "HRESULT")
        return result
    }

    /**
     * The GetSnapshotProperties method gets the properties of the specified shadow copy.
     * @remarks
     * The caller should set the contents of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure to zero before calling the <b>GetSnapshotProperties</b> method.
     * 
     * The provider is responsible for allocating and freeing the strings in the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure.
     * @param {Guid} SnapshotId The identifier of the shadow copy of a volume as returned by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addtosnapshotset">IVssBackupComponents::AddToSnapshotSet</a>.
     * @returns {VSS_SNAPSHOT_PROP} The address of a caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> structure that receives 
     *       the shadow copy properties.
     *       The software provider is responsible for setting the members of this structure. The software provider allocates memory for all string members  that it sets in the structure. When the structure is no longer needed, the software provider is responsible for freeing these strings by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-vssfreesnapshotproperties">VssFreeSnapshotProperties</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getsnapshotproperties
     */
    GetSnapshotProperties(SnapshotId) {
        pProp := VSS_SNAPSHOT_PROP()
        result := ComCall(42, this, "ptr", SnapshotId, "ptr", pProp, "HRESULT")
        return pProp
    }

    /**
     * The Query method queries providers on the system and/or the completed shadow copies in the system that reside in the current context. The method can be called only during backup operations.
     * @remarks
     * Because <b>Query</b> returns only information on 
     *     completed shadow copies, the only shadow copy state it can disclose is VSS_SS_COMPLETED.
     *    
     * 
     * The method may be called only during backup operations and must be preceded by calls to 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-initializeforbackup">IVssBackupComponents::InitializeForBackup</a> 
     *     and <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setcontext">IVssBackupComponents::SetContext</a>.
     *    
     * 
     * While <b>Query</b> can return information on all of 
     *     the providers available on a system, it will return only information about shadow copies with the current context 
     *     (set by <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setcontext">IVssBackupComponents::SetContext</a>). 
     *     For instance, if the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_snapshot_context">_VSS_SNAPSHOT_CONTEXT</a> context 
     *     is set to <b>VSS_CTX_BACKUP</b>, 
     *     <b>Query</b> will not return information on a shadow 
     *     copy created with a context of VSS_CTX_FILE_SHARE_BACKUP.
     *    
     * 
     * While this method currently returns a lists of all available providers and/or all completed shadow copies, in the 
     *     future, specialized queries may be supported: for instance, querying all shadow copies associated with a provider.
     * @param {Guid} QueriedObjectId Reserved. The value of this parameter must be GUID_NULL.
     * @param {VSS_OBJECT_TYPE} eQueriedObjectType Indicates restriction of the query to the given object type. A value of VSS_OBJECT_NONE indicates no 
     *       restriction—that is, all objects will be queried. 
     *       
     * 
     * Currently, the value of this parameter must be <b>VSS_OBJECT_NONE</b>.
     * @param {VSS_OBJECT_TYPE} eReturnedObjectsType Object types to be returned. The value of this parameter must be either 
     *       <b>VSS_OBJECT_SNAPSHOT</b> or <b>VSS_OBJECT_PROVIDER</b>.
     * @param {Pointer<IVssEnumObject>} ppEnum Doubly indirect pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssenumobject">IVssEnumObject</a> enumerator object.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully returned a pointer to an instance of the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssenumobject">IVssEnumObject</a> interface.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is not an administrator or a backup operator.
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
     * One of the parameter values is not valid.
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
     * Out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or 
     *         this method has not been called within the correct sequence.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The queried object is not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_PROVIDER_VETO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Expected provider error. The provider logged the error in the event log. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED_PROVIDER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected provider error. The error code is logged in the error log. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     *        
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-query
     */
    Query(QueriedObjectId, eQueriedObjectType, eReturnedObjectsType, ppEnum) {
        result := ComCall(43, this, "ptr", QueriedObjectId, "int", eQueriedObjectType, "int", eReturnedObjectsType, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * The IsVolumeSupported method determines whether the specified provider supports shadow copies on the specified volume or remote file share.
     * @remarks
     * <b>Windows 7, Windows Server 2008 R2, Windows Vista, Windows Server 2008, Windows XP and Windows Server 2003:  </b>Remote file shares are not supported until Windows 8 and Windows Server 2012.
     * 
     * <b>IsVolumeSupported</b> will return <b>TRUE</b> if it is possible to create shadow copies on the given volume, even if the current configuration does not allow the creation of shadow copies on that volume at the present time.
     * 
     * For example, if the maximum number of shadow copies has been reached on a given volume (and therefore no more shadow copies can be created on that volume), the method will still indicate that the volume can be shadow copied.
     * 
     * <div class="alert"><b>Note</b>  For more information about the maximum number of shadow copies that can be created on a volume, see the entry for <b>MaxShadowCopies</b> in <a href="https://docs.microsoft.com/windows/desktop/Backup/registry-keys-for-backup-and-restore">Registry Keys and Values for Backup and Restore</a>.</div>
     * <div> </div>
     * This method cannot be called for a virtual hard disk (VHD) that is nested inside another VHD.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>VHDs are not supported.
     * @param {Guid} ProviderId Provider identifier. If the value is GUID_NULL, 
     * <b>IsVolumeSupported</b> checks whether any provider supports the volume or remote file share.
     * @param {Pointer<Integer>} pwszVolumeName Volume name or UNC path of remote file share. The name or UNC path must be in one of the following formats and must include a trailing backslash (\\): 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>The path of a mounted folder, for example, Y:\MountX\</li>
     * <li>A drive letter, for example, D:\</li>
     * <li>A volume GUID path of the form \\?&#92;<i>Volume</i>{<i>GUID</i>}\ (where <i>GUID</i> identifies the volume)</li>
     * <li>A UNC path that specifies a remote file share, for example, \\Clusterx\Share1\</li>
     * </ul>
     * @param {Pointer<BOOL>} pbSupportedByThisProvider Address of a caller-allocated variable that receives <b>TRUE</b> if shadow copies are supported on the specified volume or remote file share, or <b>FALSE</b> otherwise.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully returned the provider support information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient backup privileges or is not an administrator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_NESTED_VOLUME_LIMIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified volume is nested too deeply to participate in the VSS operation.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This return code is not supported.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified volume or remote file share was not found or was not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-isvolumesupported
     */
    IsVolumeSupported(ProviderId, pwszVolumeName, pbSupportedByThisProvider) {
        pwszVolumeNameMarshal := pwszVolumeName is VarRef ? "ushort*" : "ptr"
        pbSupportedByThisProviderMarshal := pbSupportedByThisProvider is VarRef ? "int*" : "ptr"

        result := ComCall(44, this, "ptr", ProviderId, pwszVolumeNameMarshal, pwszVolumeName, pbSupportedByThisProviderMarshal, pbSupportedByThisProvider, "HRESULT")
        return result
    }

    /**
     * The DisableWriterClasses method prevents a specific class of writers from receiving any events.
     * @remarks
     * If you have multiple running copies of the same writer, they will all have the same writer class identifier, but they will have different writer instance identifiers. Disabling a writer class causes all of the writer's instances to be disabled.
     * 
     * If the <b>DisableWriterClasses</b> method and the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-enablewriterclasses">IVssBackupComponents::EnableWriterClasses</a> method are never called, all writer classes are enabled.
     * 
     * After the first call to <b>DisableWriterClasses</b> returns, the writer classes that were specified in the <i>rgWriterClassId</i> array are disabled, and all other writer classes are enabled.
     * 
     * If you call <b>DisableWriterClasses</b> more than once, each call adds the writers in the <i>rgWriterClassId</i> array to the list of disabled writers.
     * 
     * If you call <b>DisableWriterClasses</b> one or more times and then call <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-enablewriterclasses">EnableWriterClasses</a>, the first call to <b>EnableWriterClasses</b> cancels the effect of the calls to <b>DisableWriterClasses</b> and enables only the writers in the <i>rgWriterClassId</i> array.
     * 
     * If you call <b>DisableWriterClasses</b>, you must do so before calling the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwritermetadata">IVssBackupComponents::GatherWriterMetadata</a> method. If you call <b>GatherWriterMetadata</b> first and then call <b>DisableWriterClasses</b>, the call to <b>DisableWriterClasses</b> has no effect. If you need to call <b>GatherWriterMetadata</b> first, to determine which writer classes to disable, you must call it from a different instance of the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssbackupcomponents">IVssBackupComponents</a> interface.
     * @param {Pointer<Guid>} rgWriterClassId An array containing one or more writer class identifiers.
     * @param {Integer} cClassId The number of entries in the <i>rgWriterClassId</i> array.
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
     * </dl>
     * </td>
     * <td width="60%">
     * The writer class has been successfully disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient backup privileges or is not an administrator.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-disablewriterclasses
     */
    DisableWriterClasses(rgWriterClassId, cClassId) {
        result := ComCall(45, this, "ptr", rgWriterClassId, "uint", cClassId, "HRESULT")
        return result
    }

    /**
     * The EnableWriterClasses method enables the specified writers to receive all events.
     * @remarks
     * If the <b>EnableWriterClasses</b> method and the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-disablewriterclasses">IVssBackupComponents::DisableWriterClasses</a> method are never called, all writer classes are enabled.
     * 
     * After the first call to <b>EnableWriterClasses</b> returns, the writer classes that were specified in the <i>rgWriterClassId</i> array are enabled, and all other writer classes are disabled. 
     * 
     * If you call <b>EnableWriterClasses</b> more than once, each call adds the writers in the <i>rgWriterClassId</i> array to the list of enabled writers.
     * 
     * If you call <b>EnableWriterClasses</b> one or more times and then call <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-disablewriterclasses">DisableWriterClasses</a>, the call to <b>DisableWriterClasses</b> disables any writers in the   <i>rgWriterClassId</i> array that were enabled in the calls to <b>EnableWriterClasses</b>.
     * 
     * If you call <b>EnableWriterClasses</b>, you must do so before calling the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwritermetadata">IVssBackupComponents::GatherWriterMetadata</a> method. If you call <b>GatherWriterMetadata</b> first and then call <b>EnableWriterClasses</b>, the call to <b>EnableWriterClasses</b> has no effect.  If you need to call <b>GatherWriterMetadata</b> first, to determine which writer classes to enable, you must call it from a different instance of the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssbackupcomponents">IVssBackupComponents</a> interface.
     * @param {Pointer<Guid>} rgWriterClassId An array containing one or more writer class identifiers.
     * @param {Integer} cClassId The number of entries in the <i>rgWriterClassId</i> array.
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
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully enabled the writer class.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient backup privileges or is not an administrator.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-enablewriterclasses
     */
    EnableWriterClasses(rgWriterClassId, cClassId) {
        result := ComCall(46, this, "ptr", rgWriterClassId, "uint", cClassId, "HRESULT")
        return result
    }

    /**
     * The DisableWriterInstances method disables a specified writer instance or instances.
     * @remarks
     * If you have multiple running copies of the same writer, they will all have the same writer class identifier, but they will have different writer instance identifiers. Disabling one instance of a writer does not cause the writer's other instances to be disabled.
     * 
     * If you call <b>DisableWriterInstances</b>, you must do so before calling the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwritermetadata">IVssBackupComponents::GatherWriterMetadata</a> method. If you call <b>GatherWriterMetadata</b> first and then call <b>DisableWriterInstances</b>, the call to <b>DisableWriterInstances</b> has no effect. If you need to call <b>GatherWriterMetadata</b> first, to determine which writer instances to disable, you must call it from a different instance of the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssbackupcomponents">IVssBackupComponents</a> interface.
     * @param {Pointer<Guid>} rgWriterInstanceId An array containing one or more writer instance identifiers.
     * @param {Integer} cInstanceId The number of entries in the <i>rgWriterInstanceId</i> array.
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
     * </dl>
     * </td>
     * <td width="60%">
     * The writer class has been successfully enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient backup privileges or is not an administrator.
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
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_BAD_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The backup components object is not initialized, this method has been called during a restore operation, or this method has not been called within the correct sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-disablewriterinstances
     */
    DisableWriterInstances(rgWriterInstanceId, cInstanceId) {
        result := ComCall(47, this, "ptr", rgWriterInstanceId, "uint", cInstanceId, "HRESULT")
        return result
    }

    /**
     * The ExposeSnapshot method exposes a shadow copy as a drive letter, mounted folder, or file share.
     * @remarks
     * The caller is responsible for freeing the string that  the <i>pwszExposed</i> parameter points to by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * 
     * When exposing a persistent shadow copy, it remains exposed through subsequent boots.
     * 
     * When exposing a shadow copy of a volume, the shadow copy may be treated either as a mountable device or as a file 
     *     system available for file sharing.
     *    
     * 
     * When it is exposed as a device—as with other mountable devices—the shadow copy of a volume is exposed 
     *     at its mount point (drive letter or mounted folder) starting with its root.
     *    
     * 
     * When exposed as a file share, subsets (indicated by <i>wszPathFromRoot</i>) of the volume can 
     *     be shared.
     *    
     * 
     * For more information on how to expose shadow copies, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/VSS/exposing-and-surfacing-shadow-copied-volumes">Exposing and Surfacing Shadow Copied
     *     Volumes</a>.
     * @param {Guid} SnapshotId Shadow copy identifier.
     * @param {Pointer<Integer>} wszPathFromRoot The path to the portion of the volume made available when exposing a shadow copy as a file share. The value of 
     *       this parameter must be <b>NULL</b> when exposing a shadow copy locally; that is, exposing it as a drive letter or mounted folder. 
     *       
     * 
     * The path cannot contain environment variables (for example, %MyEnv%) or wildcard characters.
     * 
     * There is no requirement that the path end with a backslash ("\"). It is up to applications that
     *        retrieve this information to check.
     * @param {Integer} lAttributes Attributes of the exposed shadow copy indicating whether it is exposed locally or remotely. The value must be 
     *       either the <b>VSS_VOLSNAP_ATTR_EXPOSED_LOCALLY</b> or the 
     *       <b>VSS_VOLSNAP_ATTR_EXPOSED_REMOTELY</b> value of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a>.
     * @param {Pointer<Integer>} wszExpose When a shadow copy is exposed as a file share, the value of this parameter is the share name. If a shadow copy 
     *       is exposed by mounting it as a device, the parameter value is a drive letter followed by a colon—for
     *       example, "X:" or a mounted folder path (for example, "Y:\MountX"). If the value of this parameter is <b>NULL</b>, then VSS
     *       determines the share name or drive letter if the <i>lAttributes</i> parameter is 
     *       <b>VSS_VOLSNAP_ATTR_EXPOSED_REMOTELY</b>.
     * @returns {Pointer<Integer>} The exposed name of the shadow copy. This is either a share name, a drive letter followed by a colon, 
     *       or a mounted folder. The value is <b>NULL</b> if 
     *       <b>ExposeSnapshot</b> failed.
     *      VSS allocates the memory for this string.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-exposesnapshot
     */
    ExposeSnapshot(SnapshotId, wszPathFromRoot, lAttributes, wszExpose) {
        wszPathFromRootMarshal := wszPathFromRoot is VarRef ? "ushort*" : "ptr"
        wszExposeMarshal := wszExpose is VarRef ? "ushort*" : "ptr"

        result := ComCall(48, this, "ptr", SnapshotId, wszPathFromRootMarshal, wszPathFromRoot, "int", lAttributes, wszExposeMarshal, wszExpose, "ptr*", &pwszExposed := 0, "HRESULT")
        return pwszExposed
    }

    /**
     * Reverts a volume to a previous shadow copy. (IVssBackupComponents.RevertToSnapshot)
     * @remarks
     * This operation cannot be canceled, or undone once completed. If the computer is rebooted during the revert 
     *      operation, the revert process will continue when the system is restarted.
     * @param {Guid} SnapshotId VSS_ID of the shadow copy to revert.
     * @param {BOOL} bForceDismount If this parameter is 
     *       <b>TRUE</b>, the volume will be dismounted and reverted even if the volume is in use.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
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
     * <dt><b><b>E_ACCESSDENIED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling process has insufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_FAIL</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is an internal error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters passed is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_NOTIMPL</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider for the volume does not support revert operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_OUTOFMEMORY</b></b></dt>
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
     * <dt><b><b>VSS_E_OBJECT_NOT_FOUND</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>SnapshotId</i> parameter is not a valid shadow copy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_PROVIDER_NOT_REGISTERED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_REVERT_IN_PROGRESS</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume already has a revert in process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_UNSUPPORTED_CONTEXT</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Revert is only supported for persistent shadow copies.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_VOLUME_IN_USE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>bForceDismount</i> parameter was <b>FALSE</b>, and the 
     *         volume could not be locked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VSS_E_VOLUME_NOT_SUPPORTED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Revert is not supported on this volume.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-reverttosnapshot
     */
    RevertToSnapshot(SnapshotId, bForceDismount) {
        result := ComCall(49, this, "ptr", SnapshotId, "int", bForceDismount, "HRESULT")
        return result
    }

    /**
     * Returns an IVssAsync interface pointer that can be used to determine the status of the revert operation. (IVssBackupComponents.QueryRevertStatus)
     * @remarks
     * The revert operation will continue even if the computer is rebooted, and cannot be canceled or undone, except 
     *     by restoring a backup created using another method. The 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/nf-vss-ivssasync-querystatus">QueryStatus</a> method on the returned  
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> interface cannot return 
     *     <b>VSS_S_ASYNC_CANCELLED</b> as the revert operation cannot be canceled after it has 
     *     started.
     * @param {Pointer<Integer>} pwszVolume Null-terminated wide character string containing the name of the volume. The name must be in one of the following formats and must include a trailing backslash (\\): 
     *       
     * 
     * <ul>
     * <li>The path of a mounted folder, for example, Y:\MountX\</li>
     * <li>A drive letter, for example, D:\</li>
     * <li>A volume GUID path of the form \\?&#92;<i>Volume</i>{<i>GUID</i>}\ (where <i>GUID</i> identifies the volume)</li>
     * </ul>
     * @returns {IVssAsync} Pointer to a location that will receive an <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssasync">IVssAsync</a> 
     *       interface pointer that can be used to retrieve the status of the revert process. When the operation is complete, the caller must release the interface pointer by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponents-queryrevertstatus
     */
    QueryRevertStatus(pwszVolume) {
        pwszVolumeMarshal := pwszVolume is VarRef ? "ushort*" : "ptr"

        result := ComCall(50, this, pwszVolumeMarshal, pwszVolume, "ptr*", &ppAsync := 0, "HRESULT")
        return IVssAsync(ppAsync)
    }
}
