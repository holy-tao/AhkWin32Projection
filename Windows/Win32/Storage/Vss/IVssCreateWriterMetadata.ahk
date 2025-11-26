#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Data\Xml\MsXml\IXMLDOMDocument.ahk

/**
 * The IVssCreateWriterMetadata interface is a C++ (not COM) interface containing methods to construct the Writer Metadata Document in response to an Identify event. It is used only in the CVssWriter::OnIdentify method.
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/nl-vswriter-ivsscreatewritermetadata
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssCreateWriterMetadata extends Win32ComInterface{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddIncludeFiles", "AddExcludeFiles", "AddComponent", "AddDatabaseFiles", "AddDatabaseLogFiles", "AddFilesToFileGroup", "SetRestoreMethod", "AddAlternateLocationMapping", "AddComponentDependency", "SetBackupSchema", "GetDocument", "SaveAsXML"]

    /**
     * Not supported.
     * @param {PWSTR} wszPath This parameter is reserved for system use.
     * @param {PWSTR} wszFilespec This parameter is reserved for system use.
     * @param {Integer} bRecursive This parameter is reserved for system use.
     * @param {PWSTR} wszAlternateLocation This parameter is reserved for system use.
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreatewritermetadata-addincludefiles
     */
    AddIncludeFiles(wszPath, wszFilespec, bRecursive, wszAlternateLocation) {
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilespec := wszFilespec is String ? StrPtr(wszFilespec) : wszFilespec
        wszAlternateLocation := wszAlternateLocation is String ? StrPtr(wszAlternateLocation) : wszAlternateLocation

        result := ComCall(0, this, "ptr", wszPath, "ptr", wszFilespec, "char", bRecursive, "ptr", wszAlternateLocation, "HRESULT")
        return result
    }

    /**
     * The AddExcludeFiles method is used to explicitly exclude a file set (a specified file or files) that might otherwise be implicitly included when a component of the current writer is backed up.
     * @param {PWSTR} wszPath Pointer to a null-terminated wide character string containing the root directory under which files are to be excluded. 
     * 
     * 
     * 
     * 
     * The directory can be a local directory on the VSS machine, or it can be a file share directory on a remote file server.
     * 
     * UNC paths are supported.
     * 
     * The path can contain environment variables (for example, %SystemRoot%) but cannot contain wildcard characters.
     * 
     * There is no requirement that the path end with a backslash ("\"). It is up to applications that retrieve this information to check.
     * @param {PWSTR} wszFilespec Pointer to a null-terminated wide character string containing the file specification of the files to be excluded. 
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
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreatewritermetadata-addexcludefiles
     */
    AddExcludeFiles(wszPath, wszFilespec, bRecursive) {
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilespec := wszFilespec is String ? StrPtr(wszFilespec) : wszFilespec

        result := ComCall(1, this, "ptr", wszPath, "ptr", wszFilespec, "char", bRecursive, "HRESULT")
        return result
    }

    /**
     * The AddComponent method adds a database or file group as a component to be backed up.
     * @param {Integer} ct A <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a> enumeration value specifying 
     *       the type of the component.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Before Windows Server 2003 with SP1, this parameter is reserved for system use, and the caller should not override the default value.
     * @param {PWSTR} wszLogicalPath A pointer to a <b>null</b>-terminated wide character string containing the logical path of the database or file group. 
     *       For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * A logical path is optional and can be <b>NULL</b>.
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
     * If the writer does not want to specify an icon, <i>pbIcon</i> should be set to <b>NULL</b>.
     * @param {Integer} cbIcon The size, in bytes, of the buffer. If 
     *      the <i>pbIcon</i> parameter is <b>NULL</b>, 
     *      <i>cbIcon</i> should be zero.
     * @param {Integer} bRestoreMetadata This parameter is reserved for future use and should always be set to <b>false</b>.
     * @param {Integer} bNotifyOnBackupComplete This parameter is reserved for future use and should always be set to <b>false</b>.
     * @param {Integer} bSelectable A Boolean that indicates whether the component can be optionally backed up (which means it can be excluded
     *       from the backup) or is always backed up when any of the writer's component is backed up. The Boolean is 
     *       <b>true</b> if the component can be selectively backed up and <b>false</b> if it is backed up when any of the components 
     *       is backed up.
     * @param {Integer} bSelectableForRestore A Boolean that determines whether a component can be individually restored when it has not been 
     *       <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-e">explicitly included</a> in 
     *       the backup document. If the component was explicitly added to the backup document, it can always be 
     *       individually selected for restore; in this case, this flag has no meaning. 
     *       
     * 
     * When <b>true</b>, the component can be restored by itself; when <b>false</b>, the component can be restored only if 
     *        the entire component set is being restored. (See 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/ns-vsbackup-vss_componentinfo">VSS_COMPONENTINFO</a> and 
     *        <a href="https://docs.microsoft.com/windows/desktop/VSS/working-with-selectability-and-logical-paths">Working with Selectability 
     *        and Logical Paths</a> for more information).
     *       
     * 
     * The default value for this parameter is <b>false</b>.
     * @param {Integer} dwComponentFlags A bit mask (or bitwise OR) of members of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_flags">VSS_COMPONENT_FLAGS</a> enumeration indicating the features that this component supports. 
     *       
     * 
     * The default value for this argument is zero.
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
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreatewritermetadata-addcomponent
     */
    AddComponent(ct, wszLogicalPath, wszComponentName, wszCaption, pbIcon, cbIcon, bRestoreMetadata, bNotifyOnBackupComplete, bSelectable, bSelectableForRestore, dwComponentFlags) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszCaption := wszCaption is String ? StrPtr(wszCaption) : wszCaption

        pbIconMarshal := pbIcon is VarRef ? "char*" : "ptr"

        result := ComCall(2, this, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "ptr", wszCaption, pbIconMarshal, pbIcon, "uint", cbIcon, "char", bRestoreMetadata, "char", bNotifyOnBackupComplete, "char", bSelectable, "char", bSelectableForRestore, "uint", dwComponentFlags, "HRESULT")
        return result
    }

    /**
     * The AddDatabaseFiles method indicates the file set (the specified file or files) that make up the database component to be backed up.
     * @param {PWSTR} wszLogicalPath Pointer to a <b>null</b>-terminated wide character string containing the logical path of the component to which the database will be added. 
     * 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * A logical path is not required and can be <b>NULL</b>.
     * @param {PWSTR} wszDatabaseName Pointer to a <b>null</b>-terminated wide character string containing the name of the database. 
     * 
     * 
     * 
     * 
     * This name is required and must match the name of the component to which the database is being added.
     * @param {PWSTR} wszPath Pointer to a <b>null</b>-terminated wide character string containing the path of the directory containing the database file. 
     * 
     * 
     * 
     * 
     * The path can contain environment variables (for example, %SystemRoot%) but cannot contain wildcard characters. 
     * 
     * UNC paths are supported.
     * 
     * There is no requirement that the path end with a backslash ("\"). It is up to applications that retrieve this information to check.
     * @param {PWSTR} wszFilespec Pointer to a <b>null</b>-terminated wide character string containing the file specification of the file or files associated with the database. 
     * 
     * 
     * 
     * 
     * A file specification cannot contain directory specifications (for example, no backslashes) but can contain the ? and * wildcard characters.
     * @param {Integer} dwBackupTypeMask A bit mask (or bitwise OR) of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_file_spec_backup_type">VSS_FILE_SPEC_BACKUP_TYPE</a> enumeration values to indicate whether a writer should evaluate the file for participation in certain types of backup operations. 
     * 
     * 
     * 
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
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreatewritermetadata-adddatabasefiles
     */
    AddDatabaseFiles(wszLogicalPath, wszDatabaseName, wszPath, wszFilespec, dwBackupTypeMask) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszDatabaseName := wszDatabaseName is String ? StrPtr(wszDatabaseName) : wszDatabaseName
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilespec := wszFilespec is String ? StrPtr(wszFilespec) : wszFilespec

        result := ComCall(3, this, "ptr", wszLogicalPath, "ptr", wszDatabaseName, "ptr", wszPath, "ptr", wszFilespec, "uint", dwBackupTypeMask, "HRESULT")
        return result
    }

    /**
     * The AddDatabaseLogFiles method indicates the log files that are associated with a database to be backed up, as well as their location.
     * @param {PWSTR} wszLogicalPath Pointer to a <b>null</b>-terminated wide character string containing the logical path of the database component to which the log files will be added. 
     * 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * 
     * A logical path is not required, and can be <b>NULL</b>.
     * @param {PWSTR} wszDatabaseName Pointer to a <b>null</b>-terminated wide character string containing the name of the database component associated with the log files. The type of this component must be VSS_CT_DATABASE; otherwise, the method will return an error.
     * @param {PWSTR} wszPath Pointer to a <b>null</b>-terminated wide character string containing the path of the directory containing the log files. 
     * 
     * 
     * 
     * 
     * The directory can be a local directory on the VSS machine, or it can be a file share directory on a remote file server.
     * 
     * UNC paths are supported.
     * 
     * The path can contain environment variables (for example, %SystemRoot%) but cannot contain wildcard characters.
     * 
     * There is no requirement that the path end with a backslash ("\"). It is up to applications that retrieve this information to check.
     * @param {PWSTR} wszFilespec Pointer to a <b>null</b>-terminated wide character string containing the file specification of the log file(s) associated with the database. 
     * 
     * 
     * 
     * 
     * A file specification cannot contain directory specifications (for example, no backslashes) but can contain the ? and * wildcard characters.
     * @param {Integer} dwBackupTypeMask A bit mask (or bitwise OR) of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_file_spec_backup_type">VSS_FILE_SPEC_BACKUP_TYPE</a> enumeration values to indicate if a writer should evaluate the file for participation in a certain type of backup operations. 
     * 
     * 
     * 
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
     * One of the parameter values is not valid, or the caller attempted to add database files to a non-database component.
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
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreatewritermetadata-adddatabaselogfiles
     */
    AddDatabaseLogFiles(wszLogicalPath, wszDatabaseName, wszPath, wszFilespec, dwBackupTypeMask) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszDatabaseName := wszDatabaseName is String ? StrPtr(wszDatabaseName) : wszDatabaseName
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilespec := wszFilespec is String ? StrPtr(wszFilespec) : wszFilespec

        result := ComCall(4, this, "ptr", wszLogicalPath, "ptr", wszDatabaseName, "ptr", wszPath, "ptr", wszFilespec, "uint", dwBackupTypeMask, "HRESULT")
        return result
    }

    /**
     * The AddFilesToFileGroup method adds a file set (a specified file or files) to a specified file group component.
     * @param {PWSTR} wszLogicalPath Pointer to a <b>null</b>-terminated wide character string containing the logical path (which may be <b>NULL</b>) of the component to which to add the files. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">Logical Pathing of Components</a>.
     * @param {PWSTR} wszGroupName Pointer to a <b>null</b>-terminated wide character string containing the name of the file group component. The type of this component must be VSS_CT_FILEGROUP; otherwise, the method will return an error.
     * @param {PWSTR} wszPath Pointer to a <b>null</b>-terminated wide character string containing the default root directory of the files to be added. 
     * 
     * 
     * 
     * 
     * The directory can be a local directory on the VSS machine, or it can be a file share directory on a remote file server.
     * 
     * UNC paths are supported.
     * 
     * The path can contain environment variables (for example, %SystemRoot%) but cannot contain wildcard characters.
     * 
     * There is no requirement that the path end with a backslash ("\"). It is up to applications that retrieve this information to check.
     * @param {PWSTR} wszFilespec Pointer to a <b>null</b>-terminated wide character string containing the file specification of the files to be included. 
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
     * @param {PWSTR} wszAlternateLocation Pointer to a <b>null</b>-terminated wide character string containing the alternate path, which actually contains the files to be backed up with this component.
     * 
     *  The directory can be a local directory on the VSS machine, or it can be a file share directory on a remote file server.
     * 
     * UNC paths are supported.
     * 
     * Specifying an alternate path is optional; if no alternate path is needed, <i>wszAlternatePath</i> should be <b>NULL</b>.
     * 
     * An alternate path should not be confused with an alternate location mapping.
     * @param {Integer} dwBackupTypeMask A bitmask of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_file_spec_backup_type">VSS_FILE_SPEC_BACKUP_TYPE</a> enumeration values to indicate if a writer should evaluate the file for participation in a certain type of backup operations. 
     * 
     * 
     * 
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
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057L</dt>
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * <dt>0x80042311L</dt>
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
     * <dt><b>VSS_E_NOT_SUPPORTED</b></dt>
     * <dt>0x8004232FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For express writers, the value of <i>wszAlternatePath</i> must be <b>NULL</b>, and the <i>dwBackupTypeMask</i> bitmask cannot include <b>VSS_FSBT_DIFFERENTIAL_BACKUP_REQUIRED</b>, <b>VSS_FSBT_INCREMENTAL_BACKUP_REQUIRED</b>, or <b>VSS_FSBT_LOG_BACKUP_REQUIRED</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreatewritermetadata-addfilestofilegroup
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
     * The SetRestoreMethod method indicates how the writer's data is to be restored.
     * @param {Integer} method <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_restoremethod_enum">VSS_RESTOREMETHOD_ENUM</a> value specifying the method that will be used in the restore operation.
     * @param {PWSTR} wszService A pointer to a wide character string containing the name of a service that must be stopped prior to a restore operation and then started after the restore operation takes place, if the value of <i>method</i> is VSS_RME_STOP_RESTORE_START or VSS_RME_RESTORE_STOP_START. 
     * 
     * 
     * 
     * 
     * If the value of <i>method</i> is not VSS_RME_STOP_RESTORE_START or VSS_RME_RESTORE_STOP_START, this argument is not used and should be set to <b>NULL</b>.
     * @param {PWSTR} wszUserProcedure Reserved for future use. The value of this parameter should always be set to <b>NULL</b>.
     * @param {Integer} writerRestore <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_writerrestore_enum">VSS_WRITERRESTORE_ENUM</a> value specifying whether the writer will be involved in restoring its data.
     * 
     * Express writers must set this parameter to <i>VSS_WRE_NEVER</i>.
     * @param {Integer} bRebootRequired Boolean indicating whether a reboot will be required after the restore operation is complete.
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
     * The operation was successful.
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
     * One of the parameter values is not valid.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * <dt>0x80042311L</dt>
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
     * <dt><b>VSS_E_NOT_SUPPORTED</b></dt>
     * <dt>0x8004232FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller specified a <a href="/windows/desktop/api/vswriter/ne-vswriter-vss_writerrestore_enum">VSS_WRITERRESTORE_ENUM</a> value that is not supported for express writers.
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
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreatewritermetadata-setrestoremethod
     */
    SetRestoreMethod(method, wszService, wszUserProcedure, writerRestore, bRebootRequired) {
        wszService := wszService is String ? StrPtr(wszService) : wszService
        wszUserProcedure := wszUserProcedure is String ? StrPtr(wszUserProcedure) : wszUserProcedure

        result := ComCall(6, this, "int", method, "ptr", wszService, "ptr", wszUserProcedure, "int", writerRestore, "char", bRebootRequired, "HRESULT")
        return result
    }

    /**
     * The AddAlternateLocationMapping method creates an alternate location mapping for a file set.
     * @param {PWSTR} wszSourcePath Null-terminated wide character string containing the name of the directory or directory hierarchy containing the files to be mapped. 
     * 
     * 
     * 
     * 
     * The directory can be a local directory on the VSS machine, or it can be a file share directory on a remote file server.
     * 
     * The path can contain environment variables (for example, %SystemRoot%) but cannot contain wildcard characters.
     * 
     * There is no requirement that the path end with a backslash ("\"). It is up to applications that retrieve this information to check.
     * @param {PWSTR} wszSourceFilespec Null-terminated wide character string containing the file specification of the files to be mapped. 
     * 
     * 
     * 
     * 
     * A file specification cannot contain directory specifications (for example, no backslashes) but can contain the ? and * wildcard characters.
     * @param {Integer} bRecursive A Boolean value specifying whether the path specified by the <i>wszPath</i> parameter identifies only a single directory or if it indicates a hierarchy of directories to be traversed recursively. This parameter should be set to  <b>true</b> if the path is treated as a hierarchy of directories to be traversed recursively, or <b>false</b> if not. 
     * 
     * 
     * 
     * 
     * For information on traversing mounted folders, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/working-with-reparse-and-mount-points">Working with Mounted Folders and Reparse Points</a>.
     * @param {PWSTR} wszDestination Null-terminated wide character string containing the fully qualified path to the directory where the files will be relocated.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057L</dt>
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * <dt>0x80042311L</dt>
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
     * <dt>0x80042308L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-setrestoremethod">IVssCreateWriterMetadata::SetRestoreMethod</a> method was not called before this method was called.
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
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreatewritermetadata-addalternatelocationmapping
     */
    AddAlternateLocationMapping(wszSourcePath, wszSourceFilespec, bRecursive, wszDestination) {
        wszSourcePath := wszSourcePath is String ? StrPtr(wszSourcePath) : wszSourcePath
        wszSourceFilespec := wszSourceFilespec is String ? StrPtr(wszSourceFilespec) : wszSourceFilespec
        wszDestination := wszDestination is String ? StrPtr(wszDestination) : wszDestination

        result := ComCall(7, this, "ptr", wszSourcePath, "ptr", wszSourceFilespec, "char", bRecursive, "ptr", wszDestination, "HRESULT")
        return result
    }

    /**
     * The AddComponentDependency method allows a writer to indicate that a component it manages has an explicit writer-component dependency; that is, another component in another writer must be backed up and restored with it.
     * @param {PWSTR} wszForLogicalPath A null-terminated wide character string containing the logical path of the component (managed by the current writer) that requires a dependency.
     * @param {PWSTR} wszForComponentName A null-terminated wide character string containing the component (managed by the current writer) that requires a dependency.
     * @param {Guid} onWriterId The class ID or 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/volume-shadow-copy-api-data-types">VSS_ID</a> (GUID) of the writer managing the component on which the current component depends.
     * @param {PWSTR} wszOnLogicalPath The logical path of the component (managed by the writer identified by <i>onWriterId</i>) on which the current component depends.
     * @param {PWSTR} wszOnComponentName The name of the component (managed by the writer identified by <i>onWriterId</i>) on which the current component depends.
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
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreatewritermetadata-addcomponentdependency
     */
    AddComponentDependency(wszForLogicalPath, wszForComponentName, onWriterId, wszOnLogicalPath, wszOnComponentName) {
        wszForLogicalPath := wszForLogicalPath is String ? StrPtr(wszForLogicalPath) : wszForLogicalPath
        wszForComponentName := wszForComponentName is String ? StrPtr(wszForComponentName) : wszForComponentName
        wszOnLogicalPath := wszOnLogicalPath is String ? StrPtr(wszOnLogicalPath) : wszOnLogicalPath
        wszOnComponentName := wszOnComponentName is String ? StrPtr(wszOnComponentName) : wszOnComponentName

        result := ComCall(8, this, "ptr", wszForLogicalPath, "ptr", wszForComponentName, "ptr", onWriterId, "ptr", wszOnLogicalPath, "ptr", wszOnComponentName, "HRESULT")
        return result
    }

    /**
     * The SetBackupSchema method is used by a writer to indicate in its Writer Metadata Document the types of backup operations it can participate in.
     * @param {Integer} dwSchemaMask The types of backup operations this writer supports expressed as a bitmask of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_backup_schema">VSS_BACKUP_SCHEMA</a> enumeration values.
     * 
     * For express writers, only the <b>VSS_BS_UNDEFINED</b>, <b>VSS_BS_COPY</b>, and <b>VSS_BS_INDEPENDENT_SYSTEM_STATE</b> values are supported.
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
     * Successfully set the failure message.
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
     * The backup schema argument is not valid.
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
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * <dt>0x80042311L</dt>
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
     * <dt><b>VSS_E_NOT_SUPPORTED</b></dt>
     * <dt>0x8004232FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller specified a <a href="/windows/desktop/api/vss/ne-vss-vss_backup_schema">VSS_BACKUP_SCHEMA</a> value that is not supported for express writers.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreatewritermetadata-setbackupschema
     */
    SetBackupSchema(dwSchemaMask) {
        result := ComCall(9, this, "uint", dwSchemaMask, "HRESULT")
        return result
    }

    /**
     * Not supported.
     * @returns {IXMLDOMDocument} This parameter is reserved for system use.
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreatewritermetadata-getdocument
     */
    GetDocument() {
        result := ComCall(10, this, "ptr*", &pDoc := 0, "HRESULT")
        return IXMLDOMDocument(pDoc)
    }

    /**
     * The SaveAsXML method saves the Writer Metadata Document that contains a writer's state information to a specified string.
     * @param {Pointer<BSTR>} pbstrXML Pointer to a string to be used to store the Writer Metadata Document that contains a writer's state information.
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
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsscreatewritermetadata-saveasxml
     */
    SaveAsXML(pbstrXML) {
        result := ComCall(11, this, "ptr", pbstrXML, "HRESULT")
        return result
    }
}
