#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VSS_SOURCE_TYPE.ahk" { VSS_SOURCE_TYPE }
#Import ".\IVssWMComponent.ahk" { IVssWMComponent }
#Import "..\..\Data\Xml\MsXml\IXMLDOMDocument.ahk" { IXMLDOMDocument }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VSS_WRITERRESTORE_ENUM.ahk" { VSS_WRITERRESTORE_ENUM }
#Import ".\VSS_USAGE_TYPE.ahk" { VSS_USAGE_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\VSS_RESTOREMETHOD_ENUM.ahk" { VSS_RESTOREMETHOD_ENUM }
#Import ".\IVssWMFiledesc.ahk" { IVssWMFiledesc }

/**
 * The IVssExamineWriterMetadata interface is a C++ (not COM) interface that allows a requester to examine the metadata of a specific writer instance.
 * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nl-vsbackup-ivssexaminewritermetadata
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct IVssExamineWriterMetadata extends IUnknown {
    /**
     * The interface identifier for IVssExamineWriterMetadata
     * @type {Guid}
     */
    static IID := Guid("{902fcf7f-b7fd-42f8-81f1-b2e400b1e5bd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVssExamineWriterMetadata interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIdentity                 : IntPtr
        GetFileCounts               : IntPtr
        GetIncludeFile              : IntPtr
        GetExcludeFile              : IntPtr
        GetComponent                : IntPtr
        GetRestoreMethod            : IntPtr
        GetAlternateLocationMapping : IntPtr
        GetBackupSchema             : IntPtr
        GetDocument                 : IntPtr
        SaveAsXML                   : IntPtr
        LoadFromXML                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVssExamineWriterMetadata.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetIdentity method obtains basic information about a specific writer instance.
     * @remarks
     * The caller must free the memory held by the <i>pbstrWriterName</i> parameter by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * 
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssexaminewritermetadata">IVssExamineWriterMetadata</a> interface might be from stored writer state information (created by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-createvssexaminewritermetadata">CreateVssExamineWriterMetadata</a>). If this is the case, then the following are true:
     * 
     * <ul>
     * <li><i>pidInstance</i> may not mean anything in terms of live writers.</li>
     * <li>If <i>pidWriter</i> does not match the writer class of any live writer, a requester should not use that writer's components.</li>
     * </ul>
     * @param {Pointer<Guid>} pidInstance The address of a caller-allocated variable that receives the instance identifier of the writer.
     * @param {Pointer<Guid>} pidWriter The address of a caller-allocated variable that receives the class identifier of the writer.
     * @param {Pointer<BSTR>} pbstrWriterName The address of a caller-allocated variable that receives a string that contains the name of the writer.
     * @param {Pointer<VSS_USAGE_TYPE>} pUsage The address of a caller-allocated variable that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_usage_type">VSS_USAGE_TYPE</a> enumeration value that specifies how the data managed by the writer is used on the host system.
     * @param {Pointer<VSS_SOURCE_TYPE>} pSource The address of a caller-allocated variable that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_source_type">VSS_SOURCE_TYPE</a> enumeration value that specifies the type of data managed by the writer.
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
     * Successfully returned the identity information.
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
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getidentity
     */
    GetIdentity(pidInstance, pidWriter, pbstrWriterName, pUsage, pSource) {
        pUsageMarshal := pUsage is VarRef ? "int*" : "ptr"
        pSourceMarshal := pSource is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, Guid.Ptr, pidInstance, Guid.Ptr, pidWriter, BSTR.Ptr, pbstrWriterName, pUsageMarshal, pUsage, pSourceMarshal, pSource, "HRESULT")
        return result
    }

    /**
     * The GetFileCounts method obtains excluded files and the number of components that a writer manages.
     * @param {Pointer<Integer>} pcIncludeFiles Reserved for system use.
     * @param {Pointer<Integer>} pcExcludeFiles The address of a caller-allocated variable that receives the number of file sets that are explicitly excluded from the backup.
     * @param {Pointer<Integer>} pcComponents The address of a caller-allocated variable that receives the total number of components that are managed by the current writer.
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
     * Successfully returned the number of files.
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
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getfilecounts
     */
    GetFileCounts(pcIncludeFiles, pcExcludeFiles, pcComponents) {
        pcIncludeFilesMarshal := pcIncludeFiles is VarRef ? "uint*" : "ptr"
        pcExcludeFilesMarshal := pcExcludeFiles is VarRef ? "uint*" : "ptr"
        pcComponentsMarshal := pcComponents is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pcIncludeFilesMarshal, pcIncludeFiles, pcExcludeFilesMarshal, pcExcludeFiles, pcComponentsMarshal, pcComponents, "HRESULT")
        return result
    }

    /**
     * Not supported. (IVssExamineWriterMetadata.GetIncludeFile)
     * @param {Integer} iFile This parameter is reserved for system use.
     * @returns {IVssWMFiledesc} This parameter is reserved for system use.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getincludefile
     */
    GetIncludeFile(iFile) {
        result := ComCall(5, this, "uint", iFile, "ptr*", &ppFiledesc := 0, "HRESULT")
        return IVssWMFiledesc(ppFiledesc)
    }

    /**
     * The GetExcludeFile method obtains information about files that have been explicitly excluded from backup for a given writer.
     * @remarks
     * For more information on excluding files, see 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/writer-metadata-document-contents">Exclude File List Specification</a>.
     * 
     * The caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> to release the resources of the returned 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object.
     * @param {Integer} iFile Index for an excluded file set. The value of this parameter is an integer from 0 
     *       to <i>n</i>–1 inclusive, where <i>n</i> is the total number of file sets explicitly excluded from the components of a given writer. The value of <i>n</i> is returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getfilecounts">IVssExamineWriterMetadata::GetFileCounts</a>.
     * @returns {IVssWMFiledesc} Doubly indirect pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object containing the file element information.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getexcludefile
     */
    GetExcludeFile(iFile) {
        result := ComCall(6, this, "uint", iFile, "ptr*", &ppFiledesc := 0, "HRESULT")
        return IVssWMFiledesc(ppFiledesc)
    }

    /**
     * The GetComponent method obtains a Writer Metadata Document for a specified backup component.
     * @remarks
     * The caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> to release the resources of the returned 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivsswmcomponent">IVssWMComponent</a> object.
     * @param {Integer} _iComponent Index for a component. The value of this parameter is an integer from 0 
     *       to <i>n</i>–1 inclusive, where <i>n</i> is the total number of components supported by a given writer. The value of <i>n</i> is returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getfilecounts">IVssExamineWriterMetadata::GetFileCounts</a>.
     * @returns {IVssWMComponent} Doubly indirect pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivsswmcomponent">IVssWMComponent</a> object containing the component information.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getcomponent
     */
    GetComponent(_iComponent) {
        result := ComCall(7, this, "uint", _iComponent, "ptr*", &ppComponent := 0, "HRESULT")
        return IVssWMComponent(ppComponent)
    }

    /**
     * The GetRestoreMethod method returns information about how a writer wants its data to be restored.
     * @remarks
     * The caller must free the memory used by the <i>pbstrUserProcedure</i> and <i>pbstrService</i> parameters by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * 
     * A file should always be restored to its alternate location mapping if either of the following is true:
     * 
     * <ul>
     * <li>The restore method (set at backup time) is VSS_RME_RESTORE_TO_ALTERNATE_LOCATION.</li>
     * <li>Its restore target was set (at restore time) to VSS_RT_ALTERNATE.</li>
     * </ul>
     * In either case, if no valid alternate location mapping is defined, this constitutes a writer error.
     * 
     * A file can be restored to an alternate location mapping if :
     * 
     * <ul>
     * <li>The restore method is VSS_RME_RESTORE_IF_NOT_THERE and a version of the file is already present on disk.</li>
     * <li>The restore method is VSS_RME_RESTORE_IF_CAN_REPLACE and a version of the file is present on disk and cannot be replaced.</li>
     * </ul>
     * Again, if no valid alternate location mapping is defined, this constitutes a writer error.
     * 
     * An alternate location mapping is used only during a restore operation and should not be confused with an alternate path, which is used only during a backup operation.
     * 
     * For more information about restore methods, see <a href="https://docs.microsoft.com/windows/desktop/VSS/setting-vss-restore-methods">Setting VSS Restore Methods</a>.
     * 
     * If the restore method is VSS_RME_STOP_RESTORE_START or VSS_RME_RESTORE_STOP_START, a requester uses the name returned by <i>pbstrService</i> to determine which service must be stopped during and then restarted after restore. See 
     * <a href="https://docs.microsoft.com/windows/desktop/VSS/stopping-services-for-restore-by-requestors">Stopping Services For Restore by Requesters</a> for information on writer participation in stopping and restarting services during a restore operation.
     * @param {Pointer<VSS_RESTOREMETHOD_ENUM>} pMethod Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_restoremethod_enum">VSS_RESTOREMETHOD_ENUM</a> value that specifies file overwriting, the use of alternate locations specifying the method that will be used in the restore operation.
     * @param {Pointer<BSTR>} pbstrService If the value of <i>pMethod</i> is VSS_RME_STOP_RESTORE_START or VSS_RME_RESTORE_STOP_START, a pointer to a string containing the name of the service that is started and stopped. Otherwise, the value is <b>NULL</b>.
     * @param {Pointer<BSTR>} pbstrUserProcedure Pointer to the URL of an HTML or XML document describing to the user how the restore is to be performed. The value may be <b>NULL</b>.
     * @param {Pointer<VSS_WRITERRESTORE_ENUM>} pwriterRestore Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_writerrestore_enum">VSS_WRITERRESTORE_ENUM</a> value specifying whether the writer will be involved in restoring its data.
     * @param {Pointer<Boolean>} pbRebootRequired Pointer to a Boolean value indicating whether a reboot will be required after the restore operation is complete. The value receives <b>true</b>  if a reboot will be required, or  <b>false</b> otherwise.
     * @param {Pointer<Integer>} pcMappings Pointer to the number of alternate mappings associated with the writer.
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
     * Successfully returned the restore method information.
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
     * A restore method does not exist.
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
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getrestoremethod
     */
    GetRestoreMethod(pMethod, pbstrService, pbstrUserProcedure, pwriterRestore, pbRebootRequired, pcMappings) {
        pMethodMarshal := pMethod is VarRef ? "int*" : "ptr"
        pwriterRestoreMarshal := pwriterRestore is VarRef ? "int*" : "ptr"
        pbRebootRequiredMarshal := pbRebootRequired is VarRef ? "int*" : "ptr"
        pcMappingsMarshal := pcMappings is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pMethodMarshal, pMethod, BSTR.Ptr, pbstrService, BSTR.Ptr, pbstrUserProcedure, pwriterRestoreMarshal, pwriterRestore, pbRebootRequiredMarshal, pbRebootRequired, pcMappingsMarshal, pcMappings, "HRESULT")
        return result
    }

    /**
     * The GetAlternateLocationMapping method obtains a specific alternate location mapping of a file set.
     * @remarks
     * The value returned by <b>IVssExamineWriterMetadata::GetAlternateLocationMapping</b> should not be confused with that returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getalternatelocationmapping">IVssComponent::GetAlternateLocationMapping</a>.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getalternatelocationmapping">IVssComponent::GetAlternateLocationMapping</a> is the alternate location to which a file was restored.
     * 
     * <b>IVssExamineWriterMetadata::GetAlternateLocationMapping</b> is the alternate location mapping to which a file may be restored if necessary.
     * 
     * A file should always be restored to its alternate location mapping if either of the following is true:
     * 
     * <ul>
     * <li>The restore method (set at backup time) is VSS_RME_RESTORE_TO_ALTERNATE_LOCATION.</li>
     * <li>Its restore target was set (at restore time) to VSS_RT_ALTERNATE.</li>
     * </ul>
     * In either case, if no valid alternate location mapping is defined, this constitutes a writer error.
     * 
     * A file may be restored to an alternate location mapping if either of the following is true:
     * 
     * <ul>
     * <li>The restore method is VSS_RME_RESTORE_IF_NOT_THERE and a version of the file is already present on disk.</li>
     * <li>The restore method is VSS_RME_RESTORE_IF_CAN_REPLACE and a version of the file is present on disk and cannot be replaced.</li>
     * </ul>
     * Again, if no valid alternate location mapping is defined, this constitutes a writer error.
     * 
     * An alternate location mapping is used only during a restore operation and should not be confused with an alternate path, which is used only during a backup operation.
     * 
     * The caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> to release the resources of the returned 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object.
     * @param {Integer} iMapping Index of a particular mapping. The value of this parameter is an integer from 0 
     *       to <i>n</i>–1 inclusive, where <i>n</i> is the total number of alternate location mappings associated with a given writer. The value of <i>n</i> is returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getrestoremethod">IVssExamineWriterMetadata::GetRestoreMethod</a>.
     * @returns {IVssWMFiledesc} Doubly indirect pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object containing the alternate location mapping information.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getalternatelocationmapping
     */
    GetAlternateLocationMapping(iMapping) {
        result := ComCall(9, this, "uint", iMapping, "ptr*", &ppFiledesc := 0, "HRESULT")
        return IVssWMFiledesc(ppFiledesc)
    }

    /**
     * The GetBackupSchema method is used by a requester to determine from the Writer Metadata Document the types of backup operations that a given writer can participate in.
     * @remarks
     * The default backup schema is VSS_BS_UNDEFINED: the writer supports only simple full backup and restoration of entire files (as defined by VSS_BT_FULL), there is no support for incremental or differential backups, and partial files are not supported.
     * 
     * The writer calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-setbackupschema">IVssCreateWriterMetadata::SetBackupSchema</a> to indicate its supported schema in its Writer Metadata Document.
     * @returns {Integer} The types of backup operations that a given writer supports, expressed as a bit mask (or bitwise OR) of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_backup_schema">VSS_BACKUP_SCHEMA</a> enumeration values.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getbackupschema
     */
    GetBackupSchema() {
        result := ComCall(10, this, "uint*", &pdwSchemaMask := 0, "HRESULT")
        return pdwSchemaMask
    }

    /**
     * Not supported. (IVssExamineWriterMetadata.GetDocument)
     * @returns {IXMLDOMDocument} This parameter is reserved for system use.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getdocument
     */
    GetDocument() {
        result := ComCall(11, this, "ptr*", &pDoc := 0, "HRESULT")
        return IXMLDOMDocument(pDoc)
    }

    /**
     * The SaveAsXML method saves the Writer Metadata Document that contains a writer's state information to a specified string. This string can be saved as part of a backup operation.
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
     * Successfully saved the contents of the XML document in the <i>pbstrXML</i> parameter value.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-saveasxml
     */
    SaveAsXML(pbstrXML) {
        result := ComCall(12, this, BSTR.Ptr, pbstrXML, "HRESULT")
        return result
    }

    /**
     * The LoadFromXML method loads an XML document that contains a writer's metadata document into an IVssExamineWriterMetadata interface.
     * @remarks
     * This method is used at restore time to load writer metadata that was saved by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-saveasxml">IVssExamineWriterMetadata::SaveAsXML</a> at the time of the backup operation.
     * 
     * Users should not tamper with this metadata document.
     * @param {BSTR} bstrXML String that contains an XML document that represents a writer's metadata document.
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
     * Successfully added the <i>bstrXML</i> parameter value to the XML document.
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
     * The XML document could not be loaded.
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
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-loadfromxml
     */
    LoadFromXML(bstrXML) {
        bstrXML := bstrXML is String ? BSTR.Alloc(bstrXML).Value : bstrXML

        result := ComCall(13, this, BSTR, bstrXML, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVssExamineWriterMetadata.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIdentity := CallbackCreate(GetMethod(implObj, "GetIdentity"), flags, 6)
        this.vtbl.GetFileCounts := CallbackCreate(GetMethod(implObj, "GetFileCounts"), flags, 4)
        this.vtbl.GetIncludeFile := CallbackCreate(GetMethod(implObj, "GetIncludeFile"), flags, 3)
        this.vtbl.GetExcludeFile := CallbackCreate(GetMethod(implObj, "GetExcludeFile"), flags, 3)
        this.vtbl.GetComponent := CallbackCreate(GetMethod(implObj, "GetComponent"), flags, 3)
        this.vtbl.GetRestoreMethod := CallbackCreate(GetMethod(implObj, "GetRestoreMethod"), flags, 7)
        this.vtbl.GetAlternateLocationMapping := CallbackCreate(GetMethod(implObj, "GetAlternateLocationMapping"), flags, 3)
        this.vtbl.GetBackupSchema := CallbackCreate(GetMethod(implObj, "GetBackupSchema"), flags, 2)
        this.vtbl.GetDocument := CallbackCreate(GetMethod(implObj, "GetDocument"), flags, 2)
        this.vtbl.SaveAsXML := CallbackCreate(GetMethod(implObj, "SaveAsXML"), flags, 2)
        this.vtbl.LoadFromXML := CallbackCreate(GetMethod(implObj, "LoadFromXML"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIdentity)
        CallbackFree(this.vtbl.GetFileCounts)
        CallbackFree(this.vtbl.GetIncludeFile)
        CallbackFree(this.vtbl.GetExcludeFile)
        CallbackFree(this.vtbl.GetComponent)
        CallbackFree(this.vtbl.GetRestoreMethod)
        CallbackFree(this.vtbl.GetAlternateLocationMapping)
        CallbackFree(this.vtbl.GetBackupSchema)
        CallbackFree(this.vtbl.GetDocument)
        CallbackFree(this.vtbl.SaveAsXML)
        CallbackFree(this.vtbl.LoadFromXML)
    }
}
