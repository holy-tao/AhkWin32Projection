#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\VSS_USAGE_TYPE.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssExamineWriterMetadata.ahk
#Include .\VSS_SOURCE_TYPE.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * Provides a method to retrieve the writer instance name and other basic information for a specific writer instance.
 * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nl-vsbackup-ivssexaminewritermetadataex
 * @namespace Windows.Win32.Storage.Vss
 */
class IVssExamineWriterMetadataEx extends IVssExamineWriterMetadata {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssExamineWriterMetadataEx
     * @type {Guid}
     */
    static IID => Guid("{0c0e5ec0-ca44-472b-b702-e652db1c0451}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIdentityEx"]

    /**
     * The GetIdentityEx method obtains the writer instance name and other basic information about a specific writer instance.
     * @remarks
     * This method is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getidentity">IVssExamineWriterMetadata::GetIdentity</a> method except for the <i>pbstrInstanceName</i> parameter.
     * 
     * The <i>pbstrInstanceName</i> parameter is the writer instance name that was specified during writer initialization by <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-initialize">CVssWriter::Initialize</a>.
     * 
     * The writer instance name is useful for writers that support running multiple writer instances with the same writer class ID on a single computer. The writer instance name can be used to identify the specific instance. Therefore, the writer must make the instance name unique within the writer class. Also, the writer instance name is expected to persist between backup and restore, and it is used by VSS to correctly restore multiple-instance writers.
     * 
     * The caller must free the memory held by the <i>pbstrWriterName</i> and <i>pbstrInstanceName</i> parameters by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * 
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivssexaminewritermetadataex">IVssExamineWriterMetadataEx</a> interface might be from stored writer state information (created by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-createvssexaminewritermetadata">CreateVssExamineWriterMetadata</a>). If this is the case, then the following are true:
     * 
     * <ul>
     * <li><i>pidInstance</i> may not mean anything in terms of live writers.</li>
     * <li>If <i>pidWriter</i> does not match the writer class of any live writer, a requester should not use that writer's components.</li>
     * </ul>
     * @param {Pointer<Guid>} pidInstance Globally unique identifier (GUID) of the writer instance.
     * @param {Pointer<Guid>} pidWriter GUID of the writer class.
     * @param {Pointer<BSTR>} pbstrWriterName Pointer to a string specifying the name of the writer.
     * @param {Pointer<BSTR>} pbstrInstanceName Pointer to a string specifying the writer instance name.
     * @param {Pointer<VSS_USAGE_TYPE>} pUsage Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_usage_type">VSS_USAGE_TYPE</a> enumeration value indicating how the data managed by the writer is used on the host system.
     * @param {Pointer<VSS_SOURCE_TYPE>} pSource Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_source_type">VSS_SOURCE_TYPE</a> enumeration value indicating the type of data managed by the writer.
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
     * The XML document is  not valid. Check the event log for details. For more information, see 
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
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssexaminewritermetadataex-getidentityex
     */
    GetIdentityEx(pidInstance, pidWriter, pbstrWriterName, pbstrInstanceName, pUsage, pSource) {
        pUsageMarshal := pUsage is VarRef ? "int*" : "ptr"
        pSourceMarshal := pSource is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, "ptr", pidInstance, "ptr", pidWriter, "ptr", pbstrWriterName, "ptr", pbstrInstanceName, pUsageMarshal, pUsage, pSourceMarshal, pSource, "HRESULT")
        return result
    }
}
