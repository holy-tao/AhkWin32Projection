#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IVssWMFiledesc.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssComponent interface is a C++ (not COM) interface containing methods for examining and modifying information about components contained in a requester's Backup Components Document.
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/nl-vswriter-ivsscomponent
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssComponent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssComponent
     * @type {Guid}
     */
    static IID => Guid("{d2c72c96-c121-4518-b627-e5a93d010ead}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLogicalPath", "GetComponentType", "GetComponentName", "GetBackupSucceeded", "GetAlternateLocationMappingCount", "GetAlternateLocationMapping", "SetBackupMetadata", "GetBackupMetadata", "AddPartialFile", "GetPartialFileCount", "GetPartialFile", "IsSelectedForRestore", "GetAdditionalRestores", "GetNewTargetCount", "GetNewTarget", "AddDirectedTarget", "GetDirectedTargetCount", "GetDirectedTarget", "SetRestoreMetadata", "GetRestoreMetadata", "SetRestoreTarget", "GetRestoreTarget", "SetPreRestoreFailureMsg", "GetPreRestoreFailureMsg", "SetPostRestoreFailureMsg", "GetPostRestoreFailureMsg", "SetBackupStamp", "GetBackupStamp", "GetPreviousBackupStamp", "GetBackupOptions", "GetRestoreOptions", "GetRestoreSubcomponentCount", "GetRestoreSubcomponent", "GetFileRestoreStatus", "AddDifferencedFilesByLastModifyTime", "AddDifferencedFilesByLastModifyLSN", "GetDifferencedFilesCount", "GetDifferencedFile"]

    /**
     * The GetLogicalPath method returns the logical path of this component.
     * @param {Pointer<BSTR>} pbstrPath Pointer to a string containing the logical path of the component.
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
     * Successfully returned the attribute value.
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
     * This component has no logical path.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getlogicalpath
     */
    GetLogicalPath(pbstrPath) {
        result := ComCall(3, this, "ptr", pbstrPath, "HRESULT")
        return result
    }

    /**
     * The GetComponentType method returns the type of this component in terms of the VSS_COMPONENT_TYPE enumeration.
     * @param {Pointer<Integer>} pct The address of a caller-allocated variable that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> enumeration value that specifies the type of the component.
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
     * Successfully returned the attribute value.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getcomponenttype
     */
    GetComponentType(pct) {
        pctMarshal := pct is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pctMarshal, pct, "HRESULT")
        return result
    }

    /**
     * The GetComponentName method returns the logical name of this component.
     * @param {Pointer<BSTR>} pbstrName Pointer to a string containing the logical name of the component.
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
     * Successfully returned the attribute value.
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
     * This component has no name. This state should never occur.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getcomponentname
     */
    GetComponentName(pbstrName) {
        result := ComCall(5, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * The GetBackupSucceeded method returns the status of a complete attempt at backing up all the files of a selected component or component set as a VSS_FILE_RESTORE_STATUS enumeration.
     * @param {Pointer<Boolean>} pbSucceeded The address of a caller-allocated variable that receives <b>true</b> if the backup was successful, or <b>false</b> otherwise.
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
     * Successfully returned the attribute value.
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
     * The backup success state is undefined because the method was called prior to a 
     * <a href="/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-backupcomplete">BackupComplete</a> event.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getbackupsucceeded
     */
    GetBackupSucceeded(pbSucceeded) {
        pbSucceededMarshal := pbSucceeded is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pbSucceededMarshal, pbSucceeded, "HRESULT")
        return result
    }

    /**
     * The GetAlternateLocationMappingCount method returns the number of alternate location mappings used by a requester in restoring data. Either a writer or a requester can call this method.
     * @param {Pointer<Integer>} pcMappings The address of a caller-allocated variable that receives the number of alternate location mappings.
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
     * Successfully returned the attribute value.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getalternatelocationmappingcount
     */
    GetAlternateLocationMappingCount(pcMappings) {
        pcMappingsMarshal := pcMappings is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pcMappingsMarshal, pcMappings, "HRESULT")
        return result
    }

    /**
     * The GetAlternateLocationMapping is used to return a file set's alternate location for file restoration. This method can be called by either a writer or a requester.
     * @param {Integer} iMapping Index of a particular mapping. The value of this parameter is an integer from 0 
     *       to <i>n</i>–1 inclusive, where <i>n</i> is the total number of alternate location mappings associated with the current component. The value of <i>n</i> is returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getalternatelocationmappingcount">IVssComponent::GetAlternateLocationMappingCount</a>.
     * @returns {IVssWMFiledesc} Doubly indirect pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object containing the mapping information.
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getalternatelocationmapping
     */
    GetAlternateLocationMapping(iMapping) {
        result := ComCall(8, this, "uint", iMapping, "ptr*", &ppFiledesc := 0, "HRESULT")
        return IVssWMFiledesc(ppFiledesc)
    }

    /**
     * The SetBackupMetadata method sets backup metadata with the component.
     * @param {PWSTR} wszData A <b>NULL</b>-terminated wide character string that contains the backup metadata.
     * @returns {HRESULT} The following are the valid return codes for this method.
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
     * Successfully set the item.
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
     * <dt><b>VSS_E_OBJECT_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Private metadata has already been written for this component.
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
     * This method was not called by a writer or, if called by a writer, it either was not called during a backup
     *         operation or was called while handling a 
     *         BackupComplete or 
     *         BackupShutdown event.
     *        
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-setbackupmetadata
     */
    SetBackupMetadata(wszData) {
        wszData := wszData is String ? StrPtr(wszData) : wszData

        result := ComCall(9, this, "ptr", wszData, "HRESULT")
        return result
    }

    /**
     * The GetBackupMetadata method retrieves private, writer-specific backup metadata that might have been set during a PrepareForBackup event by CVssWriter::OnPrepareBackup using IVssComponent::SetBackupMetadata.
     * @param {Pointer<BSTR>} pbstrData The address of a caller-allocated variable that receives a string containing the backup metadata that was added during an 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpreparebackup">OnPrepareBackup</a> event.
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
     * Successfully returned the attribute value.
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
     * There is no backup metadata associated with this component.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more
     *         information, see 
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     *        
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getbackupmetadata
     */
    GetBackupMetadata(pbstrData) {
        result := ComCall(10, this, "ptr", pbstrData, "HRESULT")
        return result
    }

    /**
     * The AddPartialFile method indicates that only portions of a given file are to be backed up and which portions those are.
     * @param {PWSTR} wszPath <b>Null</b>-terminated wide character string containing the path of the file involved in partial file operations. 
     *      
     * 
     * The path can contain environment variables (for example, %SystemRoot%) but cannot contain wildcard
     *      characters.
     * 
     * There is no requirement that the path end with a backslash ("\"). It is up to applications that
     *      retrieve this information to check.
     * 
     * This path should match or be beneath the path of a file set already in the component (or one of its
     *      subcomponents if the component defines a component set).
     * @param {PWSTR} wszFilename <b>Null</b>-terminated wide character string containing the name of the file involved in partial file operations.
     *      The name of the file (<i>wszFilename</i>) cannot contain wildcard characters (* or ?) and must be consistent with the
     *      file specification of a file set containing the source path (<i>wszPath</i>).
     * @param {PWSTR} wszRanges <b>Null</b>-terminated wide character string containing either a listing of file offsets and lengths that make up
     *      the partial file support range (the sections of the file to actually be backed up), or the name of a file
     *      containing such a list. 
     *      
     * 
     * Specifying the partial file support range is required, and this value cannot be <b>NULL</b>.
     * @param {PWSTR} wszMetadata <b>Null</b>-terminated wide character string containing any additional metadata required by a writer to validate a
     *      partial file restore operation. The information in this metadata string will be opaque to requesters. 
     *      
     * 
     * If additional metadata is not required, this value can be <b>NULL</b>.
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
     * Successfully set the item.
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
     * The method was not called by a writer or, if called by a writer, was not called during a restore
     *        operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-addpartialfile
     */
    AddPartialFile(wszPath, wszFilename, wszRanges, wszMetadata) {
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilename := wszFilename is String ? StrPtr(wszFilename) : wszFilename
        wszRanges := wszRanges is String ? StrPtr(wszRanges) : wszRanges
        wszMetadata := wszMetadata is String ? StrPtr(wszMetadata) : wszMetadata

        result := ComCall(11, this, "ptr", wszPath, "ptr", wszFilename, "ptr", wszRanges, "ptr", wszMetadata, "HRESULT")
        return result
    }

    /**
     * The GetPartialFileCount method returns the number of partial files associated with a component.
     * @param {Pointer<Integer>} pcPartialFiles The address of a caller-allocated variable that receives the number of partial files.
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
     * Successfully returned the attribute value.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getpartialfilecount
     */
    GetPartialFileCount(pcPartialFiles) {
        pcPartialFilesMarshal := pcPartialFiles is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pcPartialFilesMarshal, pcPartialFiles, "HRESULT")
        return result
    }

    /**
     * The GetPartialFile method returns information on a partial file associated with this component.
     * @param {Integer} iPartialFile Index number of the partial file. The value of this parameter is an integer from 0 
     *       to <i>n</i>–1 inclusive, where <i>n</i> is the total number of partial files associated with a given component. The value of <i>n</i> is returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getpartialfilecount">IVssComponent::GetPartialFileCount</a>.
     * @param {Pointer<BSTR>} pbstrPath Pointer to a string containing the path of the partial file. 
     * 
     * 
     * 
     * 
     * Users of this method need to check to determine whether this path ends with a backslash ("\").
     * @param {Pointer<BSTR>} pbstrFilename Pointer to a string containing the name of the partial file.
     * @param {Pointer<BSTR>} pbstrRange A pointer to a string containing either a listing of file offsets and lengths that make up the partial file support range (the sections of the file that were backed up), or the name of a file containing such a list.
     * @param {Pointer<BSTR>} pbstrMetadata Pointer to a string containing any additional metadata required by a writer to validate a partial file restore operation. The information in this metadata string will be opaque to requesters. 
     * 
     * 
     * 
     * 
     * Additional metadata is not required, so <i>pbstrMetadata</i> may also be empty (zero length).
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
     * Successfully returned the attribute value.
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
     * The caller is not in the correct state (either backup or restore) for the operation.
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
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
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
     * The specified item was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getpartialfile
     */
    GetPartialFile(iPartialFile, pbstrPath, pbstrFilename, pbstrRange, pbstrMetadata) {
        result := ComCall(13, this, "uint", iPartialFile, "ptr", pbstrPath, "ptr", pbstrFilename, "ptr", pbstrRange, "ptr", pbstrMetadata, "HRESULT")
        return result
    }

    /**
     * The IsSelectedForRestore method determines whether the current component has been selected to be restored.
     * @param {Pointer<Boolean>} pbSelectedForRestore The address of a caller-allocated variable that receives <b>true</b> if the component has been selected to be restored, or <b>false</b> otherwise.
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
     * Successfully set the item.
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
     * The caller is not in the correct state (either backup or restore) for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-isselectedforrestore
     */
    IsSelectedForRestore(pbSelectedForRestore) {
        pbSelectedForRestoreMarshal := pbSelectedForRestore is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pbSelectedForRestoreMarshal, pbSelectedForRestore, "HRESULT")
        return result
    }

    /**
     * The GetAdditionalRestores method is used by a writer during incremental or differential restore operations to determine whether a given component will require additional restore operations to completely retrieve it.
     * @param {Pointer<Boolean>} pbAdditionalRestores The address of a caller-allocated variable that receives <b>true</b> if additional restores will occur for the current component, or <b>false</b> otherwise.
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
     * Successfully returned the attribute value.
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
     * The specified attribute does not have a value.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getadditionalrestores
     */
    GetAdditionalRestores(pbAdditionalRestores) {
        pbAdditionalRestoresMarshal := pbAdditionalRestores is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, pbAdditionalRestoresMarshal, pbAdditionalRestores, "HRESULT")
        return result
    }

    /**
     * The GetNewTargetCount method returns the number of new target restore locations associated with a given component.
     * @param {Pointer<Integer>} pcNewTarget The address of a caller-allocated variable that receives the number of new target restore locations.
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
     * Successfully returned the attribute value.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getnewtargetcount
     */
    GetNewTargetCount(pcNewTarget) {
        pcNewTargetMarshal := pcNewTarget is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pcNewTargetMarshal, pcNewTarget, "HRESULT")
        return result
    }

    /**
     * The GetNewTarget method returns the new file restoration locations for the selected component or component set.
     * @param {Integer} iNewTarget Index number of the new target. The value of this parameter is an integer from 0 
     *       to <i>n</i>–1 inclusive, where <i>n</i> is the total number of new targets associated with a given component. The value of <i>n</i> is returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getnewtargetcount">IVssComponent::GetNewTargetCount</a>.
     * @returns {IVssWMFiledesc} Doubly indirect pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object containing the new target restore location information.
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getnewtarget
     */
    GetNewTarget(iNewTarget) {
        result := ComCall(17, this, "uint", iNewTarget, "ptr*", &ppFiledesc := 0, "HRESULT")
        return IVssWMFiledesc(ppFiledesc)
    }

    /**
     * The AddDirectedTarget method allows a writer to indicate at restore time that when a file is to be restored, it (the source file) should be remapped.
     * @param {PWSTR} wszSourcePath Null-terminated wide character string containing the path to the directory at restore time containing the file to be restored (the source file). This path should match or be beneath the path of a file set already in the component (or one of its subcomponents if the component defines a component set).
     * @param {PWSTR} wszSourceFilename Null-terminated wide character string containing the name of the file (at backup time) that will be remapped at restore time (the source file). The name of the file (<i>wszSourceFilename</i>) cannot contain wildcard characters (* or ?) and must be consistent with the file specification of a file set containing the source path (<i>wszSourcePath</i>).
     * @param {PWSTR} wszSourceRangeList A null-terminated wide character string containing a comma-separated list of file offsets and lengths indicating the source file support range (the sections of the file to actually be restored). 
     * 
     * 
     * 
     * 
     * The number and length of the source file support ranges must match the number and size of destination file support ranges.
     * @param {PWSTR} wszDestinationPath Null-terminated wide character string containing the path to which source file data will be remapped at restore time.
     * @param {PWSTR} wszDestinationFilename Null-terminated wide character string containing the name of the file to which source file data will be remapped at restore time. The name of the file (<i>wszDestinationFilename</i>) cannot contain wildcard characters (* or ?).
     * @param {PWSTR} wszDestinationRangeList A null-terminated wide character string containing a comma-separated list of file offsets and lengths indicating the destination file support range (locations to which the sections of the source file are to be restored). 
     * 
     * 
     * 
     * 
     * The number and length of the destination file support ranges must match the number and size of source file support ranges.
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
     * Successfully set the item.
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
     * This method was not called by a writer or, if called by a writer, it either was not called during a restore operation or was called while handling a <a href="/windows/desktop/VSS/vssgloss-b">BackupComplete</a> or <a href="/windows/desktop/VSS/vssgloss-b">BackupShutdown</a> event.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-adddirectedtarget
     */
    AddDirectedTarget(wszSourcePath, wszSourceFilename, wszSourceRangeList, wszDestinationPath, wszDestinationFilename, wszDestinationRangeList) {
        wszSourcePath := wszSourcePath is String ? StrPtr(wszSourcePath) : wszSourcePath
        wszSourceFilename := wszSourceFilename is String ? StrPtr(wszSourceFilename) : wszSourceFilename
        wszSourceRangeList := wszSourceRangeList is String ? StrPtr(wszSourceRangeList) : wszSourceRangeList
        wszDestinationPath := wszDestinationPath is String ? StrPtr(wszDestinationPath) : wszDestinationPath
        wszDestinationFilename := wszDestinationFilename is String ? StrPtr(wszDestinationFilename) : wszDestinationFilename
        wszDestinationRangeList := wszDestinationRangeList is String ? StrPtr(wszDestinationRangeList) : wszDestinationRangeList

        result := ComCall(18, this, "ptr", wszSourcePath, "ptr", wszSourceFilename, "ptr", wszSourceRangeList, "ptr", wszDestinationPath, "ptr", wszDestinationFilename, "ptr", wszDestinationRangeList, "HRESULT")
        return result
    }

    /**
     * The GetDirectedTargetCount method returns the number of directed target specifications associated with the current component. Either a writer or a requester can call this method.
     * @param {Pointer<Integer>} pcDirectedTarget The address of a caller-allocated variable that receives the number of directed target specifications.
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
     * Successfully returned the attribute value.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getdirectedtargetcount
     */
    GetDirectedTargetCount(pcDirectedTarget) {
        pcDirectedTargetMarshal := pcDirectedTarget is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, pcDirectedTargetMarshal, pcDirectedTarget, "HRESULT")
        return result
    }

    /**
     * The GetDirectedTarget method returns information stored by a writer, at backup time, to the Backup Components Document to indicate that when a file is to be restored, it (the source file) should be remapped.
     * @param {Integer} iDirectedTarget Index number of the directed target. The value of this parameter is an integer from 0 
     *       to <i>n</i>–1 inclusive, where <i>n</i> is the total number of directed targets associated with a given component (and its subcomponents if it defines a component set). The value of <i>n</i> is returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getdirectedtargetcount">IVssComponent::GetDirectedTargetCount</a>.
     * @param {Pointer<BSTR>} pbstrSourcePath The address of a caller-allocated variable that receives a string containing the path to the directory that at backup time contained the file to be restored (the source file). This path should match or be beneath the path of a file set already in the component or one of its subcomponents (if the component defines a component set).
     * @param {Pointer<BSTR>} pbstrSourceFileName The address of a caller-allocated variable that receives a string containing the name of the file (at backup time) that is to be remapped during a restore (the source file). The name of this file should not contain any wildcard characters, and must be a member of the same file set as the source path (<i>pbstrSourcePath</i>).
     * @param {Pointer<BSTR>} pbstrSourceRangeList The address of a caller-allocated variable that receives a string containing a comma-separated list of file offsets and lengths indicating the source file support range (the sections of the file to be restored). 
     * 
     * 
     * 
     * 
     * The number and length of the source file support ranges must match the number and size of destination file support ranges.
     * @param {Pointer<BSTR>} pbstrDestinationPath The address of a caller-allocated variable that receives a string containing the path to which source file data will be remapped at restore time.
     * @param {Pointer<BSTR>} pbstrDestinationFilename The address of a caller-allocated variable that receives a string containing the name of the file to which source file data will be remapped at restore time.
     * @param {Pointer<BSTR>} pbstrDestinationRangeList The address of a caller-allocated variable that receives a string containing a comma-separated list of file offsets and lengths indicating the destination file support range (locations to which the sections of the source file are to be restored). 
     * 
     * 
     * 
     * 
     * The number and length of the destination file support ranges must match the number and size of source file support ranges.
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
     * Successfully returned the attribute value.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
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
     * The specified item was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getdirectedtarget
     */
    GetDirectedTarget(iDirectedTarget, pbstrSourcePath, pbstrSourceFileName, pbstrSourceRangeList, pbstrDestinationPath, pbstrDestinationFilename, pbstrDestinationRangeList) {
        result := ComCall(20, this, "uint", iDirectedTarget, "ptr", pbstrSourcePath, "ptr", pbstrSourceFileName, "ptr", pbstrSourceRangeList, "ptr", pbstrDestinationPath, "ptr", pbstrDestinationFilename, "ptr", pbstrDestinationRangeList, "HRESULT")
        return result
    }

    /**
     * The SetRestoreMetadata method sets writer-specific metadata for the current component.
     * @param {PWSTR} wszRestoreMetadata A caller-allocated <b>NULL</b>-terminated wide character string containing the restore metadata for the component.
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
     * Successfully set the item.
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
     * <dt><b>VSS_E_OBJECT_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Private metadata has already been written for this component.
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
     * The method was called outside of the context of a writer handling a 
     * <a href="/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore">PreRestore</a> event.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-setrestoremetadata
     */
    SetRestoreMetadata(wszRestoreMetadata) {
        wszRestoreMetadata := wszRestoreMetadata is String ? StrPtr(wszRestoreMetadata) : wszRestoreMetadata

        result := ComCall(21, this, "ptr", wszRestoreMetadata, "HRESULT")
        return result
    }

    /**
     * The GetRestoreMetadata method retrieves private, writer-specific restore metadata that might have been set during a PreRestore event by CVssWriter::OnPreRestore using IVssComponent::SetRestoreMetadata.
     * @param {Pointer<BSTR>} pbstrRestoreMetadata A string containing the restore metadata.
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
     * Successfully returned the attribute value.
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
     * The specified attribute does not have a value.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more
     *         information, see 
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     *        
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getrestoremetadata
     */
    GetRestoreMetadata(pbstrRestoreMetadata) {
        result := ComCall(22, this, "ptr", pbstrRestoreMetadata, "HRESULT")
        return result
    }

    /**
     * The SetRestoreTarget method sets the restore target (in terms of the VSS_RESTORE_TARGET enumeration) for the current component.
     * @param {Integer} target A value from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_restore_target">VSS_RESTORE_TARGET</a> containing the restore target information.
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
     * Successfully set the item.
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
     * The caller is not in the correct state (either backup or restore) for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-setrestoretarget
     */
    SetRestoreTarget(target) {
        result := ComCall(23, this, "int", target, "HRESULT")
        return result
    }

    /**
     * The GetRestoreTarget method returns the restore target (in terms of the VSS_RESTORE_TARGET enumeration) for the current component.
     * @param {Pointer<Integer>} pTarget The address of a caller-allocated variable that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_restore_target">VSS_RESTORE_TARGET</a> enumeration value that specifies the restore target.
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
     * Successfully returned the attribute value.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
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
     * The specified item was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getrestoretarget
     */
    GetRestoreTarget(pTarget) {
        pTargetMarshal := pTarget is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, pTargetMarshal, pTarget, "HRESULT")
        return result
    }

    /**
     * The SetPreRestoreFailureMsg method is used to create a message describing a failure in processing a PreRestore event.
     * @param {PWSTR} wszPreRestoreFailureMsg A caller-allocated <b>NULL</b>-terminated wide character string containing the failure message describing an error that occurred 
     *       while processing a <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore">PreRestore</a> 
     *       event.
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
     * Successfully set the failure message.
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
     * The caller is not in the correct state (either backup or restore) for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-setprerestorefailuremsg
     */
    SetPreRestoreFailureMsg(wszPreRestoreFailureMsg) {
        wszPreRestoreFailureMsg := wszPreRestoreFailureMsg is String ? StrPtr(wszPreRestoreFailureMsg) : wszPreRestoreFailureMsg

        result := ComCall(25, this, "ptr", wszPreRestoreFailureMsg, "HRESULT")
        return result
    }

    /**
     * The GetPreRestoreFailureMsg method retrieves the error message generated by a writer while handling the PreRestore event, if IVssComponent::SetPreRestoreFailureMsg set one.
     * @param {Pointer<BSTR>} pbstrPreRestoreFailureMsg String containing the failure message that describes an error that occurred while processing the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore">PreRestore</a> event.
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
     * Successfully returned the attribute value.
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
     * No 
     * <a href="/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore">PreRestore</a> failure message was available to retrieve.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getprerestorefailuremsg
     */
    GetPreRestoreFailureMsg(pbstrPreRestoreFailureMsg) {
        result := ComCall(26, this, "ptr", pbstrPreRestoreFailureMsg, "HRESULT")
        return result
    }

    /**
     * The SetPostRestoreFailureMsg method is used to create a message describing a failure in processing a PostRestore event.
     * @param {PWSTR} wszPostRestoreFailureMsg A caller-allocated <b>NULL</b>-terminated wide character string containing the failure message that describes an error that occurred while processing a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-postrestore">PostRestore</a> event.
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
     * Successfully set the failure message.
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
     * The caller is not in the correct state (either backup or restore) for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-setpostrestorefailuremsg
     */
    SetPostRestoreFailureMsg(wszPostRestoreFailureMsg) {
        wszPostRestoreFailureMsg := wszPostRestoreFailureMsg is String ? StrPtr(wszPostRestoreFailureMsg) : wszPostRestoreFailureMsg

        result := ComCall(27, this, "ptr", wszPostRestoreFailureMsg, "HRESULT")
        return result
    }

    /**
     * The GetPostRestoreFailureMsg method returns the failure message generated by a writer while handling the PostRestore event, if IVssComponent::SetPostRestoreFailureMsg set one.
     * @param {Pointer<BSTR>} pbstrPostRestoreFailureMsg Pointer to a string containing the failure message that describes an error that occurred while processing the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-postrestore">PostRestore</a> event.
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
     * Successfully returned the attribute value.
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
     * No PostRestoreFailure message was available to retrieve.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getpostrestorefailuremsg
     */
    GetPostRestoreFailureMsg(pbstrPostRestoreFailureMsg) {
        result := ComCall(28, this, "ptr", pbstrPostRestoreFailureMsg, "HRESULT")
        return result
    }

    /**
     * The SetBackupStamp method sets a string containing information indicating when a backup took place.
     * @param {PWSTR} wszBackupStamp Null-terminated wide character string information indicating when a backup took place.
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
     * Successfully set the backup time stamp.
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
     * This method was not called by a writer or, if called by a writer, it either was not called during a backup operation or was called while handling a BackupComplete or BackupShutdown event.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-setbackupstamp
     */
    SetBackupStamp(wszBackupStamp) {
        wszBackupStamp := wszBackupStamp is String ? StrPtr(wszBackupStamp) : wszBackupStamp

        result := ComCall(29, this, "ptr", wszBackupStamp, "HRESULT")
        return result
    }

    /**
     * The GetBackupStamp method returns the backup stamp string stored by a writer for a given component.
     * @param {Pointer<BSTR>} pbstrBackupStamp The address of a caller-allocated variable that receives a string containing the backup stamp indicating the time at which the component was backed up.
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
     * Successfully returned the attribute value.
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
     * There is no time stamp associated with this component.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getbackupstamp
     */
    GetBackupStamp(pbstrBackupStamp) {
        result := ComCall(30, this, "ptr", pbstrBackupStamp, "HRESULT")
        return result
    }

    /**
     * The GetPreviousBackupStamp method returns a previous backup stamp loaded by a requester in the Backup Components Document. The value is used by a writer when deciding if files should participate in differential or incremental backup operation.
     * @param {Pointer<BSTR>} pbstrBackupStamp Pointer to a string containing the time stamp of a previous backup so that a differential or incremental backup can be correctly implemented.
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
     * Successfully returned the attribute value.
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
     * No previous backup time stamp has been set.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getpreviousbackupstamp
     */
    GetPreviousBackupStamp(pbstrBackupStamp) {
        result := ComCall(31, this, "ptr", pbstrBackupStamp, "HRESULT")
        return result
    }

    /**
     * The GetBackupOptions method returns the backup options specified to the writer that manages the currently selected component or component set by a requester using IVssBackupComponents::SetBackupOptions.
     * @param {Pointer<BSTR>} pbstrBackupOptions The address of a caller-allocated variable that receives a string containing the backup options for the current writer.
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
     * Successfully returned the attribute value.
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
     * No backup options have been specified for this component.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getbackupoptions
     */
    GetBackupOptions(pbstrBackupOptions) {
        result := ComCall(32, this, "ptr", pbstrBackupOptions, "HRESULT")
        return result
    }

    /**
     * The GetRestoreOptions method gets the restore options specified to the current writer by a requester using IVssBackupComponents::SetRestoreOptions.
     * @param {Pointer<BSTR>} pbstrRestoreOptions String containing the restore options of the writer.
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
     * Successfully returned the attribute value.
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
     * No restore options have been specified.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getrestoreoptions
     */
    GetRestoreOptions(pbstrRestoreOptions) {
        result := ComCall(33, this, "ptr", pbstrRestoreOptions, "HRESULT")
        return result
    }

    /**
     * The GetRestoreSubcomponentCount method returns the number of subcomponents associated with a component.
     * @param {Pointer<Integer>} pcRestoreSubcomponent The address of a caller-allocated variable that receives the number of subcomponents that are associated with a component.
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
     * Successfully returned the attribute value.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getrestoresubcomponentcount
     */
    GetRestoreSubcomponentCount(pcRestoreSubcomponent) {
        pcRestoreSubcomponentMarshal := pcRestoreSubcomponent is VarRef ? "uint*" : "ptr"

        result := ComCall(34, this, pcRestoreSubcomponentMarshal, pcRestoreSubcomponent, "HRESULT")
        return result
    }

    /**
     * The GetRestoreSubcomponent method returns the specified subcomponent associated with a given component.
     * @param {Integer} iComponent Index of the subcomponent. The value of this parameter is an integer from 0 
     *       to <i>n</i>–1 inclusive, where <i>n</i> is the total number of subcomponents associated with a given component. The value of <i>n</i> is returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getrestoresubcomponentcount">IVssComponent::GetRestoreSubcomponentCount</a>.
     * @param {Pointer<BSTR>} pbstrLogicalPath Pointer to a string containing the logical path of the subcomponent. The logical path cannot be empty when working with subcomponents.
     * @param {Pointer<BSTR>} pbstrComponentName Pointer to a string containing the name of the subcomponent. The string cannot be empty.
     * @param {Pointer<Boolean>} pbRepair Reserved for future use.
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
     * Successfully returned the attribute value.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
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
     * The specified item was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getrestoresubcomponent
     */
    GetRestoreSubcomponent(iComponent, pbstrLogicalPath, pbstrComponentName, pbRepair) {
        pbRepairMarshal := pbRepair is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, "uint", iComponent, "ptr", pbstrLogicalPath, "ptr", pbstrComponentName, pbRepairMarshal, pbRepair, "HRESULT")
        return result
    }

    /**
     * The GetFileRestoreStatus method returns the status of a completed attempt to restore all the files of a selected component or component set as a VSS_FILE_RESTORE_STATUS enumeration.
     * @param {Pointer<Integer>} pStatus The address of a caller-allocated variable that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_file_restore_status">VSS_FILE_RESTORE_STATUS</a> enumeration value that specifies whether all files were successfully restored.
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
     * Successfully returned the attribute value.
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
     * The method was not called as part of a restore operation.
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
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getfilerestorestatus
     */
    GetFileRestoreStatus(pStatus) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * Used by a writer to indicate that a file set (a specified file or files) should be evaluated against a last modification time stamp for inclusion in a time stamped incremental or differential backup using entire files.
     * @param {PWSTR} wszPath Null-terminated wide character string containing the name of the directory or directory hierarchy 
     *       containing the files to be mapped.
     *       
     * 
     * The path can contain environment variables (for example, %SystemRoot%) but cannot contain wildcard 
     *        characters.
     * 
     * There is no requirement that the path end with a backslash ("\"). It is up to applications that 
     *        retrieve this information to check.
     * @param {PWSTR} wszFilespec Null-terminated wide character string containing the file specification of the files to be mapped.
     *       
     * 
     * A file specification cannot contain directory specifications (for example, no backslashes) but can contain 
     *        the ? and * wildcard characters.
     * @param {BOOL} bRecursive A Boolean value specifying whether the path specified by the <i>wszPath</i> parameter identifies 
     *       only a single directory or if it indicates a hierarchy of directories to be traversed recursively. This parameter should be set to <b>true</b> if the path is treated as a hierarchy of directories to be traversed recursively, or  <b>false</b> if not.
     *       
     * 
     * For information on traversing mounted folders, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/VSS/working-with-reparse-and-mount-points">Working with Mounted Folders and Reparse Points</a>.
     * @param {FILETIME} ftLastModifyTime The writer specification of the time of last modification for the difference files, expressed as a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     *       
     * 
     * The last-modify time is always given in Greenwich Mean Time.
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
     * Successfully added differenced files.
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
     * This method was not called by a writer or, if called by a writer, it either was not called during a 
     *         backup operation or was called while handling a 
     *         <a href="/windows/desktop/VSS/vssgloss-b">BackupComplete</a> or 
     *         <a href="/windows/desktop/VSS/vssgloss-b">BackupShutdown</a> event.
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
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
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
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-adddifferencedfilesbylastmodifytime
     */
    AddDifferencedFilesByLastModifyTime(wszPath, wszFilespec, bRecursive, ftLastModifyTime) {
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilespec := wszFilespec is String ? StrPtr(wszFilespec) : wszFilespec

        result := ComCall(37, this, "ptr", wszPath, "ptr", wszFilespec, "int", bRecursive, "ptr", ftLastModifyTime, "HRESULT")
        return result
    }

    /**
     * Not supported.
     * @param {PWSTR} wszPath This parameter is reserved for system use.
     * @param {PWSTR} wszFilespec This parameter is reserved for system use.
     * @param {BOOL} bRecursive This parameter is reserved for system use.
     * @param {BSTR} bstrLsnString This parameter is reserved for system use.
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-adddifferencedfilesbylastmodifylsn
     */
    AddDifferencedFilesByLastModifyLSN(wszPath, wszFilespec, bRecursive, bstrLsnString) {
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilespec := wszFilespec is String ? StrPtr(wszFilespec) : wszFilespec
        bstrLsnString := bstrLsnString is String ? BSTR.Alloc(bstrLsnString).Value : bstrLsnString

        result := ComCall(38, this, "ptr", wszPath, "ptr", wszFilespec, "int", bRecursive, "ptr", bstrLsnString, "HRESULT")
        return result
    }

    /**
     * Returns the number of file specifications in this component (and in any subcomponents of the component set it defines) marked by a writer supporting an incremental backup or restore as differenced files.
     * @param {Pointer<Integer>} pcDifferencedFiles The address of a caller-allocated variable that receives the number of differenced file specifications.
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
     * Successfully returned the attribute value.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getdifferencedfilescount
     */
    GetDifferencedFilesCount(pcDifferencedFiles) {
        pcDifferencedFilesMarshal := pcDifferencedFiles is VarRef ? "uint*" : "ptr"

        result := ComCall(39, this, pcDifferencedFilesMarshal, pcDifferencedFiles, "HRESULT")
        return result
    }

    /**
     * The GetDifferencedFile method returns information about a file set (a specified file or files) to participate in an incremental or differential backup or restore as a differenced file�that is, backup and restores associated with it are to be implemented as if entire files are copied to and from backup media (as opposed to using partial files).
     * @param {Integer} iDifferencedFile Index number of the differenced file to be examined. The value of this parameter is an integer from 0 
     *       to <i>n</i>–1 inclusive, where <i>n</i> is the total number of differenced files 
     *       associated with a given component (and its subcomponents if it defines a component set). The value of 
     *       <i>n</i> is returned by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getdifferencedfilescount">IVssComponent::GetDifferencedFilesCount</a>.
     * @param {Pointer<BSTR>} pbstrPath The address of a caller-allocated variable that receives a string containing the path to the differenced files.
     *       
     * 
     * Users of this method need to check to determine whether this path ends with a backslash 
     *        (\\).
     * @param {Pointer<BSTR>} pbstrFilespec The address of a caller-allocated variable that receives a string containing the file specification of the differenced files.
     * @param {Pointer<BOOL>} pbRecursive The address of a caller-allocated variable that receives a Boolean specifying whether the file specification for the differenced files should be 
     *       interpreted recursively. If <b>TRUE</b>, then the entire directory hierarchy will need to be searched for files 
     *       matching the file specification <i>pbstrFilespec</i> to find files to be handled as 
     *       differenced files during incremental or differential backups. If <b>FALSE</b>, only the root directory needs to be 
     *       searched.
     * @param {Pointer<BSTR>} pbstrLsnString Reserved for future use.
     * @param {Pointer<FILETIME>} pftLastModifyTime The address of a caller-allocated variable that receives the writer specification of the time of last modification for the difference files, expressed as a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
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
     * Successfully returned the attribute value.
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
     * No differenced file corresponding to the supplied index was found.
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
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscomponent-getdifferencedfile
     */
    GetDifferencedFile(iDifferencedFile, pbstrPath, pbstrFilespec, pbRecursive, pbstrLsnString, pftLastModifyTime) {
        pbRecursiveMarshal := pbRecursive is VarRef ? "int*" : "ptr"

        result := ComCall(40, this, "uint", iDifferencedFile, "ptr", pbstrPath, "ptr", pbstrFilespec, pbRecursiveMarshal, pbRecursive, "ptr", pbstrLsnString, "ptr", pftLastModifyTime, "HRESULT")
        return result
    }
}
