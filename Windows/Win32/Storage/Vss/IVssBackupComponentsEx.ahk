#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssExamineWriterMetadataEx.ahk
#Include .\IVssBackupComponents.ahk
#Include .\VSS_COMPONENT_TYPE.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * Provides methods for requesters to run backup and restore operations using multiple writer instances.
 * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nl-vsbackup-ivssbackupcomponentsex
 * @namespace Windows.Win32.Storage.Vss
 */
class IVssBackupComponentsEx extends IVssBackupComponents {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssBackupComponentsEx
     * @type {Guid}
     */
    static IID => Guid("{963f03ad-9e4c-4a34-ac15-e4b6174e5036}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 51

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWriterMetadataEx", "SetSelectedForRestoreEx"]

    /**
     * The GetWriterMetadataEx method returns the metadata for a specific writer instance running on the system.
     * @remarks
     * <b>GetWriterMetadataEx</b> is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwritermetadata">IVssBackupComponents::GetWriterMetadata</a> method, except that it returns an <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssexaminewritermetadataex">IVssExamineWriterMetadataEx</a> interface pointer instead of an <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssexaminewritermetadata">IVssExamineWriterMetadata</a> interface pointer in the <i>ppMetadata</i> parameter.
     * 
     * A requester must call the asynchronous <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwritermetadata">IVssBackupComponents::GatherWriterMetadata</a> method and wait for it to complete prior to calling <b>GetWriterMetadataEx</b>.
     * 
     * Although 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-gatherwritermetadata">GatherWriterMetadata</a> method must be called prior to either a restore or backup operation, 
     * <b>GetWriterMetadataEx</b> is not typically called for restores.
     * 
     * Component information retrieved (during backup operations) using 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getcomponent">IVssExamineWriterMetadata::GetComponent</a> method, where the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssexaminewritermetadataex">IVssExamineWriterMetadataEx</a> interface has been returned by 
     * <b>GetWriterMetadataEx</b>, comes from the Writer Metadata Document of a live writer process.
     * 
     * This is in contrast to the information returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwritercomponents">GetWriterComponents</a> (during restore operations), which was stored in the Backup Components Document by calls to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a> method.
     * 
     * When the caller of this method is finished accessing the metadata, it must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>.
     * @param {Integer} iWriter Index of the writer whose metadata is to be retrieved. The value of this parameter is an integer from 0 
     *       to <i>n</i>–1 inclusive, where <i>n</i> is the total number of writers on the current system. The value of <i>n</i> is returned by 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwritermetadatacount">IVssBackupComponents::GetWriterMetadataCount</a> method.
     * @param {Pointer<Guid>} pidInstance Address of a caller-allocated variable that receives the instance identifier of the writer that collected the metadata.
     * @param {Pointer<IVssExamineWriterMetadataEx>} ppMetadata Doubly indirect pointer to the instance of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssexaminewritermetadataex">IVssExamineWriterMetadataEx</a> object that contains the returned metadata.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssexaminewritermetadataex">IVssExamineWriterMetadataEx</a> interface object.
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
     * The <i>iWriter</i> parameter does not point to a valid writer.
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
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex-getwritermetadataex
     */
    GetWriterMetadataEx(iWriter, pidInstance, ppMetadata) {
        result := ComCall(51, this, "uint", iWriter, "ptr", pidInstance, "ptr*", ppMetadata, "HRESULT")
        return result
    }

    /**
     * The SetSelectedForRestoreEx method indicates whether the specified selectable component is selected for restoration to a specified writer instance.
     * @remarks
     * <b>SetSelectedForRestoreEx</b>, which moves a component to a different writer instance, can be called only for a writer that supports running multiple writer instances with the same class ID and supports a requester moving a component to a different writer instance at restore time. To determine whether a writer provides this support, call the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getbackupschema">IVssExamineWriterMetadata::GetBackupSchema</a> method.
     * 
     * <b>SetSelectedForRestoreEx</b> has 
     *     meaning only for restores taking place in component mode.
     * 
     * <b>SetSelectedForRestoreEx</b> can 
     *     be called only for components that were explicitly added to the backup document at backup time using 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">AddComponent</a>. 
     *     Restoring a component that was implicitly selected for backup as part of a component set must be done by calling 
     *    <b>SetSelectedForRestoreEx</b> on the 
     *     closest ancestor component that was added to the document. If only this component's data is to be restored, that 
     *     should be accomplished through 
     *     the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addrestoresubcomponent">IVssBackupComponents::AddRestoreSubcomponent</a> method; 
     *     this can be done only if the component is selectable for restore (see 
     *     <a href="https://docs.microsoft.com/windows/desktop/VSS/working-with-selectability-and-logical-paths">Working with Selectability and 
     *     Logical Paths</a>).
     * 
     * This method must be called before 
     *     the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore">IVssBackupComponents::PreRestore</a> method.
     * 
     * The distinction between the <i>instanceId</i> and <i>writerID</i> parameters is necessary because it is possible that multiple instances of the same writer are running on the computer.
     * 
     * If the value of the <i>instanceId</i> parameter is  GUID_NULL, this is equivalent to calling the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setselectedforrestore">IVssBackupComponents::SetSelectedForRestore</a> method.
     * 
     * The <i>instanceId</i> parameter is used to specify that the component is to be restored to a different writer instance. If the value of the <i>instanceId</i> parameter is not GUID_NULL, it must match the instance ID of a writer instance with the same writer class ID specified in in the <i>writerID</i> parameter.
     * 
     * A writer's class identifier, instance identifier, and instance name can be found by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadataex-getidentityex">IVssExamineWriterMetadataEx::GetIdentityEx</a> method.
     * @param {Guid} writerId Globally unique identifier (GUID) of the writer class.
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
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a> method.
     * @param {Integer} bSelectedForRestore If the value of this parameter is <b>true</b>, the selected component has been selected for restoration. If the 
     *      value is <b>false</b>, the selected component has not been selected for restoration.
     * @param {Guid} instanceId GUID of the writer instance.
     * 
     * The default value for this parameter is GUID_NULL.
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
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex-setselectedforrestoreex
     */
    SetSelectedForRestoreEx(writerId, ct, wszLogicalPath, wszComponentName, bSelectedForRestore, instanceId) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName

        result := ComCall(52, this, "ptr", writerId, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "char", bSelectedForRestore, "ptr", instanceId, "HRESULT")
        return result
    }
}
