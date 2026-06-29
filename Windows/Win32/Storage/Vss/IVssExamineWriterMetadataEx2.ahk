#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IVssExamineWriterMetadataEx.ahk" { IVssExamineWriterMetadataEx }
#Import ".\IVssWMFiledesc.ahk" { IVssWMFiledesc }

/**
 * Defines methods to retrieve version information and other basic information for a specific writer instance.
 * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nl-vsbackup-ivssexaminewritermetadataex2
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct IVssExamineWriterMetadataEx2 extends IVssExamineWriterMetadataEx {
    /**
     * The interface identifier for IVssExamineWriterMetadataEx2
     * @type {Guid}
     */
    static IID := Guid("{ce115780-a611-431b-b57f-c38303ab6aee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVssExamineWriterMetadataEx2 interfaces
    */
    struct Vtbl extends IVssExamineWriterMetadataEx.Vtbl {
        GetVersion                  : IntPtr
        GetExcludeFromSnapshotCount : IntPtr
        GetExcludeFromSnapshotFile  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVssExamineWriterMetadataEx2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Obtains the version information for a writer application.
     * @remarks
     * The <b>GetVersion</b> method returns nonzero results only if the writer was initialized by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriterex-initializeex">CVssWriterEx::InitializeEx</a> method and explicit version information was specified. If the writer is initialized by calling the <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-initialize">CVssWriter::Initialize</a> method, or if no version information was specified in the call to the <b>CVssWriterEx::InitializeEx</b> method, the <b>GetVersion</b> method returns zero in the <i>pdwMajorVersion</i> and <i>pdwMinorVersion</i> parameters.
     * @param {Pointer<Integer>} pdwMajorVersion A pointer to the major version of the writer application.
     * @param {Pointer<Integer>} pdwMinorVersion A pointer to the minor version of the writer application.
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
     * The writer version information was successfully returned.
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
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssexaminewritermetadataex2-getversion
     */
    GetVersion(pdwMajorVersion, pdwMinorVersion) {
        pdwMajorVersionMarshal := pdwMajorVersion is VarRef ? "uint*" : "ptr"
        pdwMinorVersionMarshal := pdwMinorVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, pdwMajorVersionMarshal, pdwMajorVersion, pdwMinorVersionMarshal, pdwMinorVersion, "HRESULT")
        return result
    }

    /**
     * Obtains the number of file sets that have been explicitly excluded from a given shadow copy.
     * @returns {Integer} A pointer to the number of <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-f">file sets</a> explicitly excluded from the shadow copy.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssexaminewritermetadataex2-getexcludefromsnapshotcount
     */
    GetExcludeFromSnapshotCount() {
        result := ComCall(16, this, "uint*", &pcExcludedFromSnapshot := 0, "HRESULT")
        return pcExcludedFromSnapshot
    }

    /**
     * Obtains information about file sets that have been explicitly excluded from a given shadow copy.
     * @remarks
     * The caller is responsible for calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method to release the resources of the returned 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object.
     * 
     * The <b>GetExcludeFromSnapshotFile</b> method is intended to report information about <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-f">file sets</a> excluded from a shadow copy. Requesters should not exclude files from backup based on the information returned by this method.
     * @param {Integer} iFile An index for an excluded <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-f">file set</a>. The value of this parameter is an integer from 0 
     *       to <i>n</i>–1 inclusive, where <i>n</i> is the total number of <i>file sets</i> explicitly excluded from a given shadow copy. The value of <i>n</i> is returned by 
     * the <b>IVssExamineWriterMetadataEx2::GetExcludeFromSnapshotCount</b> method.
     * @returns {IVssWMFiledesc} A doubly indirect pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsswmfiledesc">IVssWMFiledesc</a> object containing the file element information.
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssexaminewritermetadataex2-getexcludefromsnapshotfile
     */
    GetExcludeFromSnapshotFile(iFile) {
        result := ComCall(17, this, "uint", iFile, "ptr*", &ppFiledesc := 0, "HRESULT")
        return IVssWMFiledesc(ppFiledesc)
    }

    Query(iid) {
        if (IVssExamineWriterMetadataEx2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetVersion := CallbackCreate(GetMethod(implObj, "GetVersion"), flags, 3)
        this.vtbl.GetExcludeFromSnapshotCount := CallbackCreate(GetMethod(implObj, "GetExcludeFromSnapshotCount"), flags, 2)
        this.vtbl.GetExcludeFromSnapshotFile := CallbackCreate(GetMethod(implObj, "GetExcludeFromSnapshotFile"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetVersion)
        CallbackFree(this.vtbl.GetExcludeFromSnapshotCount)
        CallbackFree(this.vtbl.GetExcludeFromSnapshotFile)
    }
}
