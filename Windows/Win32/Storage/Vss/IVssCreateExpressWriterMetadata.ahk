#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssCreateExpressWriterMetadata interface is a COM interface containing methods to construct the Writer Metadata Document for an express writer.
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/nl-vswriter-ivsscreateexpresswritermetadata
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssCreateExpressWriterMetadata extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssCreateExpressWriterMetadata
     * @type {Guid}
     */
    static IID => Guid("{9c772e77-b26e-427f-92dd-c996f41ea5e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddExcludeFiles", "AddComponent", "AddFilesToFileGroup", "SetRestoreMethod", "AddComponentDependency", "SetBackupSchema", "SaveAsXML"]

    /**
     * Excludes a file set (a specified file or files) that might otherwise be implicitly included when a component of an express writer is backed up.
     * @param {PWSTR} wszPath A pointer to a null-terminated wide character string containing the root directory under which files are to be excluded. 
     * 
     * 
     * 
     * 
     * The path can contain environment variables (for example, %SystemRoot%) but cannot contain wildcard characters.
     * 
     * There is no requirement that the path end with a backslash (\\). It is up to applications that retrieve this information to check.
     * @param {PWSTR} wszFilespec A pointer to a null-terminated wide character string containing the file specification of the files to be excluded. 
     * 
     * 
     * 
     * 
     * A file specification cannot contain directory specifications (for example, no backslashes) but can contain the ? and * wildcard characters.
     * @param {Integer} bRecursive A Boolean value specifying whether the path specified by the <i>wszPath</i> parameter identifies only a single directory or if it indicates a hierarchy of directories to be traversed recursively. This parameter should be set to <b>true</b> if the path is treated as a hierarchy of directories to be recursed through, or <b>false</b> otherwise. 
     * 
     * 
     * 
     * 
     * For information on traversing over mounted folders, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/working-with-reparse-and-mount-points">Working with Mounted Folders and Reparse Points</a>.
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
     * The operation was successful.
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
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreateexpresswritermetadata-addexcludefiles
     */
    AddExcludeFiles(wszPath, wszFilespec, bRecursive) {
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilespec := wszFilespec is String ? StrPtr(wszFilespec) : wszFilespec

        result := ComCall(3, this, "ptr", wszPath, "ptr", wszFilespec, "char", bRecursive, "HRESULT")
        return result
    }

    /**
     * Adds a file group to an express writer's set of components to be backed up.
     * @param {Integer} ct A <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> enumeration value that specifies 
     *       the type of the component. Only <b>VSS_CT_FILEGROUP</b> is supported for this parameter.
     * @param {PWSTR} wszLogicalPath A pointer to a <b>null</b>-terminated wide character string containing the logical path of the database or file group. 
     *       For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * This parameter is optional and can be <b>NULL</b>.
     * @param {PWSTR} wszComponentName A pointer to a <b>null</b>-terminated wide character string containing the name of the component. This string is not localized. 
     *       
     * 
     * This parameter is required and cannot be <b>NULL</b>. The string cannot contain backslashes.
     * @param {PWSTR} wszCaption A pointer to a <b>null</b>-terminated wide character string containing a description (also called a "friendly name") for the component. 
     *       This string might be localized, and therefore requesters must assume that it is localized. 
     * 
     * This parameter is optional and can be <b>NULL</b>. The string can contain backslashes.
     * @param {Pointer<Integer>} pbIcon A pointer to a bitmap of the icon representing the database, to be displayed in a user interface. 
     *       The size, in bytes, of the buffer is specified by the <i>cbIcon</i> parameter. 
     *       
     * 
     * This parameter is optional and can be <b>NULL</b>.
     * @param {Integer} cbIcon The size, in bytes, of the buffer. If 
     *      the <i>pbIcon</i> parameter is <b>NULL</b>, 
     *      <i>cbIcon</i> must be zero.
     * @param {Integer} bRestoreMetadata This parameter is reserved for future use and should always be set to <b>false</b>.
     * @param {Integer} bNotifyOnBackupComplete This parameter is reserved for future use and should always be set to <b>false</b>.
     * @param {Integer} bSelectable A Boolean value that indicates whether the component can be optionally backed up (which means it can be excluded
     *       from the backup) or is always backed up when any of the writer's components is backed up. This parameter should be set to  
     *       <b>true</b> if the component can be selectively backed up, or <b>false</b> if the component is backed up when any of the components 
     *       is backed up.
     * @param {Integer} bSelectableForRestore A Boolean value that determines whether a component can be individually restored when it has not been 
     *       <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-e">explicitly included</a> in 
     *       the backup document. If the component was explicitly added to the backup document, it can always be 
     *       individually selected for restore; in this case, this flag has no meaning. 
     *       
     * 
     * When this parameter is <b>true</b>, the component can be restored by itself; when <b>false</b>, the component can be restored only if 
     *        the entire component set is being restored. (For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/ns-vsbackup-vss_componentinfo">VSS_COMPONENTINFO</a> and 
     *        <a href="https://docs.microsoft.com/windows/desktop/VSS/working-with-selectability-and-logical-paths">Working with Selectability 
     *        and Logical Paths</a>.)
     *       
     * 
     * The default value for this parameter is <b>false</b>.
     * @param {Integer} dwComponentFlags A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_flags">VSS_COMPONENT_FLAGS</a> enumeration values indicating the features that this component supports. 
     *       This bitmask cannot include <b>VSS_CF_APP_ROLLBACK_RECOVERY</b> or <b>VSS_CF_BACKUP_RECOVERY</b>.
     * 
     * The default value for this parameter is zero.
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
     * The operation was successful.
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
     * The XML document is not valid. Check the event log for details. 
     *         For more information, see 
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
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
     * The object is a duplicate. A component with the same logical path and component name already exists.
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
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreateexpresswritermetadata-addcomponent
     */
    AddComponent(ct, wszLogicalPath, wszComponentName, wszCaption, pbIcon, cbIcon, bRestoreMetadata, bNotifyOnBackupComplete, bSelectable, bSelectableForRestore, dwComponentFlags) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszCaption := wszCaption is String ? StrPtr(wszCaption) : wszCaption

        pbIconMarshal := pbIcon is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "ptr", wszCaption, pbIconMarshal, pbIcon, "uint", cbIcon, "char", bRestoreMetadata, "char", bNotifyOnBackupComplete, "char", bSelectable, "char", bSelectableForRestore, "uint", dwComponentFlags, "HRESULT")
        return result
    }

    /**
     * Adds a file set (a specified file or files) to a specified file group component for an express writer.
     * @param {PWSTR} wszLogicalPath A pointer to a <b>null</b>-terminated wide character string containing the logical path (which may be <b>NULL</b>) of the component to which to add the files. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * @param {PWSTR} wszGroupName A pointer to a <b>null</b>-terminated wide character string containing the name of the file group component. The type of this component must be VSS_CT_FILEGROUP; otherwise, the method will return an error.
     * @param {PWSTR} wszPath A pointer to a <b>null</b>-terminated wide character string containing the default root directory of the files to be added. 
     * 
     * 
     * 
     * 
     * The path can contain environment variables (for example, %SystemRoot%) but cannot contain wildcard characters.
     * 
     * There is no requirement that the path end with a backslash (\\). It is up to applications that retrieve this information to check.
     * @param {PWSTR} wszFilespec A pointer to a <b>null</b>-terminated wide character string containing the file specification of the files to be included. 
     * 
     * 
     * 
     * 
     * A file specification cannot contain directory specifications (for example, no backslashes) but can contain the ? and * wildcard characters.
     * @param {Integer} bRecursive A Boolean value specifying whether the path specified by the <i>wszPath</i> parameter identifies only a single directory or if it indicates a hierarchy of directories to be traversed recursively. This parameter should be set to <b>true</b> if the path is treated as a hierarchy of directories to be recursed through, or <b>false</b> otherwise. 
     * 
     * 
     * 
     * 
     * For information on traversing over mounted folders, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/working-with-reparse-and-mount-points">Working with Mounted Folders and Reparse Points</a>.
     * @param {PWSTR} wszAlternateLocation This parameter is reserved and must be <b>NULL</b>.
     * @param {Integer} dwBackupTypeMask A bitmask of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_file_spec_backup_type">VSS_FILE_SPEC_BACKUP_TYPE</a> enumeration values to indicate if a writer should evaluate the file for participation in a certain type of backup operations. 
     * 
     * 
     * This parameter cannot include <b>VSS_FSBT_DIFFERENTIAL_BACKUP_REQUIRED</b>, <b>VSS_FSBT_INCREMENTAL_BACKUP_REQUIRED</b>, or <b>VSS_FSBT_LOG_BACKUP_REQUIRED</b>.
     * 
     * The default value for this argument is (VSS_FSBT_ALL_BACKUP_REQUIRED | VSS_FSBT_ALL_SNAPSHOT_REQUIRED).
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
     * The operation was successful.
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
     * One of the parameter values is not valid, or the caller attempted to add file-group files to a non-file-group component.
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
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. E_UNEXPECTED is used instead.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreateexpresswritermetadata-addfilestofilegroup
     */
    AddFilesToFileGroup(wszLogicalPath, wszGroupName, wszPath, wszFilespec, bRecursive, wszAlternateLocation, dwBackupTypeMask) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszGroupName := wszGroupName is String ? StrPtr(wszGroupName) : wszGroupName
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilespec := wszFilespec is String ? StrPtr(wszFilespec) : wszFilespec
        wszAlternateLocation := wszAlternateLocation is String ? StrPtr(wszAlternateLocation) : wszAlternateLocation

        result := ComCall(5, this, "ptr", wszLogicalPath, "ptr", wszGroupName, "ptr", wszPath, "ptr", wszFilespec, "char", bRecursive, "ptr", wszAlternateLocation, "uint", dwBackupTypeMask, "HRESULT")
        return result
    }

    /**
     * Specifies how an express writer's data is to be restored.
     * @param {Integer} method A <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_restoremethod_enum">VSS_RESTOREMETHOD_ENUM</a> enumeration value specifying the restore method to be used in the restore operation. This parameter is required and cannot be <b>VSS_RME_UNDEFINED</b>, <b>VSS_RME_RESTORE_TO_ALTERNATE_LOCATION</b>, or <b>VSS_RME_CUSTOM</b>.
     * @param {PWSTR} wszService A pointer to a wide character string containing the name of a service that must be stopped prior to a restore operation and then started after the restore operation takes place, if the value of <i>method</i> is <b>VSS_RME_STOP_RESTORE_START</b> or <b>VSS_RME_RESTORE_STOP_START</b>. 
     * 
     * 
     * 
     * 
     * If the value of <i>method</i> is not <b>VSS_RME_STOP_RESTORE_START</b> or <b>VSS_RME_RESTORE_STOP_START</b>, this parameter is not used and should be set to <b>NULL</b>.
     * @param {PWSTR} wszUserProcedure Reserved for future use. The value of this parameter should always be set to <b>NULL</b>.
     * @param {Integer} writerRestore A <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_writerrestore_enum">VSS_WRITERRESTORE_ENUM</a> enumeration value specifying whether the writer will be involved in restoring its data. This parameter must be set to <b>VSS_WRE_NEVER</b>.
     * @param {Integer} bRebootRequired A Boolean value indicating whether a reboot will be required after the restore operation is complete.
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
     * The operation was successful.
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
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreateexpresswritermetadata-setrestoremethod
     */
    SetRestoreMethod(method, wszService, wszUserProcedure, writerRestore, bRebootRequired) {
        wszService := wszService is String ? StrPtr(wszService) : wszService
        wszUserProcedure := wszUserProcedure is String ? StrPtr(wszUserProcedure) : wszUserProcedure

        result := ComCall(6, this, "int", method, "ptr", wszService, "ptr", wszUserProcedure, "int", writerRestore, "char", bRebootRequired, "HRESULT")
        return result
    }

    /**
     * Allows an express writer to indicate that a component it manages has an explicit writer-component dependency; that is, another component (possibly managed by another writer) must be backed up and restored with it.
     * @param {PWSTR} wszForLogicalPath A null-terminated wide character string containing the logical path of the component (managed by the express writer) that requires a dependency.
     * @param {PWSTR} wszForComponentName A null-terminated wide character string containing the component (managed by the express writer) that requires a dependency.
     * @param {Guid} onWriterId A 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/volume-shadow-copy-api-data-types">VSS_ID</a> (GUID) value that specifies the writer class of the express writer managing the component on which the current component depends.
     * @param {PWSTR} wszOnLogicalPath The logical path of the component (managed by the express writer identified by <i>onWriterId</i>) on which the current component depends.
     * @param {PWSTR} wszOnComponentName The name of the component (managed by the express writer identified by <i>onWriterId</i>) on which the current component depends.
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
     * The operation was successful.
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
     * The component specified by <i>wszForLogicalPath</i> and <i>wszForComponentName</i> does not exist.
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
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreateexpresswritermetadata-addcomponentdependency
     */
    AddComponentDependency(wszForLogicalPath, wszForComponentName, onWriterId, wszOnLogicalPath, wszOnComponentName) {
        wszForLogicalPath := wszForLogicalPath is String ? StrPtr(wszForLogicalPath) : wszForLogicalPath
        wszForComponentName := wszForComponentName is String ? StrPtr(wszForComponentName) : wszForComponentName
        wszOnLogicalPath := wszOnLogicalPath is String ? StrPtr(wszOnLogicalPath) : wszOnLogicalPath
        wszOnComponentName := wszOnComponentName is String ? StrPtr(wszOnComponentName) : wszOnComponentName

        result := ComCall(7, this, "ptr", wszForLogicalPath, "ptr", wszForComponentName, "ptr", onWriterId, "ptr", wszOnLogicalPath, "ptr", wszOnComponentName, "HRESULT")
        return result
    }

    /**
     * Used by an express writer to indicate in its Writer Metadata Document the types of backup operations it can participate in.
     * @param {Integer} dwSchemaMask A bitmask of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_backup_schema">VSS_BACKUP_SCHEMA</a> enumeration values that specify the types of backup operations this writer supports.
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
     * The backup schema argument is not valid.
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
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreateexpresswritermetadata-setbackupschema
     */
    SetBackupSchema(dwSchemaMask) {
        result := ComCall(8, this, "uint", dwSchemaMask, "HRESULT")
        return result
    }

    /**
     * Stores the Writer Metadata Document that contains an express writer's state information into a specified string.
     * @returns {BSTR} A pointer to a string to be used to store the Writer Metadata Document that contains a writer's state information.
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreateexpresswritermetadata-saveasxml
     */
    SaveAsXML() {
        pbstrXML := BSTR()
        result := ComCall(9, this, "ptr", pbstrXML, "HRESULT")
        return pbstrXML
    }
}
