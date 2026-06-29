#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDedupReadFileCallback.ahk" { IDedupReadFileCallback }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method for restoring a file from a backup store containing copies of Data Deduplication reparse points, metadata, and container files.
 * @remarks
 * A backup application uses the 
 *      <b>IDedupBackupSupport</b> interface to drive the restore 
 *      process for a select file from a backup store that contains the fully optimized version of the file (reparse 
 *      point) and the Data Deduplication store.
 * 
 * This interface is not useful when the backup store contains a copy of the original, non-optimized file.
 * 
 * Applications that use the <b>IDedupBackupSupport</b> 
 *      interface must also implement the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ddpbackup/nn-ddpbackup-idedupreadfilecallback">IDedupReadFileCallback</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/ddpbackup/nn-ddpbackup-idedupbackupsupport
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct IDedupBackupSupport extends IUnknown {
    /**
     * The interface identifier for IDedupBackupSupport
     * @type {Guid}
     */
    static IID := Guid("{c719d963-2b2d-415e-acf7-7eb7ca596ff4}")

    /**
     * The class identifier for DedupBackupSupport
     * @type {Guid}
     */
    static CLSID := Guid("{73d6b2ad-2984-4715-b2e3-924c149744dd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDedupBackupSupport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RestoreFiles : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDedupBackupSupport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reconstructs a set of files from a backup store that contains the fully optimized version of the files (reparse points) and the Data Deduplication store.
     * @remarks
     * The <i>Store</i> parameter is required because the restore engine (implemented by Data 
     *     Deduplication) can read data from the backup media only by calling the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ddpbackup/nf-ddpbackup-idedupreadfilecallback-readbackupfile">IDedupReadFileCallback::ReadBackupFile</a> 
     *     method.
     * @param {Integer} NumberOfFiles The number of files to restore. If this exceeds 10,000 then the method will fail with 
     *       <b>E_INVALIDARG</b> (0x80070057).
     * @param {Pointer<BSTR>} FileFullPaths For each file, this parameter contains the full path from the root directory of the volume to the reparse 
     *       point previously restored by the application.
     * @param {IDedupReadFileCallback} Store <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ddpbackup/nn-ddpbackup-idedupreadfilecallback">IDedupReadFileCallback</a> interface pointer 
     *       for the backup store. This parameter is required and cannot be <b>NULL</b>.
     * @param {Integer} Flags This parameter must be <b>DEDUP_RECONSTRUCT_UNOPTIMIZED</b> on input. For more 
     *       information, see the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/ddpbackup/ne-ddpbackup-dedup_backup_support_param_type">DEDUP_BACKUP_SUPPORT_PARAM_TYPE</a> 
     *        enumeration.
     * @returns {HRESULT} For each file, this parameter contains the results of the restore operation for that file. This parameter 
     *       is optional and can be <b>NULL</b> if the application doesn't need to know the results for each individual file.
     * @see https://learn.microsoft.com/windows/win32/api/ddpbackup/nf-ddpbackup-idedupbackupsupport-restorefiles
     */
    RestoreFiles(NumberOfFiles, FileFullPaths, Store, Flags) {
        result := ComCall(3, this, "uint", NumberOfFiles, BSTR.Ptr, FileFullPaths, "ptr", Store, "uint", Flags, "int*", &FileResults := 0, "HRESULT")
        return FileResults
    }

    Query(iid) {
        if (IDedupBackupSupport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RestoreFiles := CallbackCreate(GetMethod(implObj, "RestoreFiles"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RestoreFiles)
    }
}
