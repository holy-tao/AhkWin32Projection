#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\DDP_FILE_EXTENT.ahk" { DDP_FILE_EXTENT }
#Import ".\DEDUP_CONTAINER_EXTENT.ahk" { DEDUP_CONTAINER_EXTENT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A callback interface, implemented by backup applications, that enables Data Deduplication to read content from metadata and container files residing in a backup store and optionally improve restore efficiency.
 * @remarks
 * The <b>IDedupReadFileCallback</b> interface is implemented by a backup application and passed as a parameter to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ddpbackup/nf-ddpbackup-idedupbackupsupport-restorefiles">IDedupBackupSupport::RestoreFiles</a> method. The callback is used by Data Deduplication to read data from Data Duplication store containers in the backup store.  <b>IDedupReadFileCallback</b> also includes methods that applications can optionally implement to increase the efficiency of the Data Deduplication file restore process.
 * @see https://learn.microsoft.com/windows/win32/api/ddpbackup/nn-ddpbackup-idedupreadfilecallback
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct IDedupReadFileCallback extends IUnknown {
    /**
     * The interface identifier for IDedupReadFileCallback
     * @type {Guid}
     */
    static IID := Guid("{7bacc67a-2f1d-42d0-897e-6ff62dd533bb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDedupReadFileCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReadBackupFile         : IntPtr
        OrderContainersRestore : IntPtr
        PreviewContainerRead   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDedupReadFileCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reads data from a Data Deduplication store metadata or container file located in the backup store.
     * @param {BSTR} FileFullPath The full path from the root directory of the volume to the container file.
     * @param {Integer} FileOffset The offset, in bytes, from the beginning of the file to the beginning of the data to be read.
     * @param {Integer} SizeToRead The number of bytes to read from the file.
     * @param {Pointer<Integer>} FileBuffer A pointer to a buffer that receives the data that is read from the file. The size of the buffer must be greater than or equal to the number specified in the <i>SizeToRead</i> parameter.
     * @param {Pointer<Integer>} ReturnedSize Pointer to a ULONG variable that receives the number of bytes that were read from the backup store. If the call to <b>ReadBackupFile</b> is successful, this number is equal to the value that was specified in the <i>SizeToRead</i> parameter.
     * @param {Integer} Flags This parameter is reserved for future use.
     * @returns {HRESULT} This method can return standard <b>HRESULT</b> values, such as <b>S_OK</b>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Possible return values include the following.
     * @see https://learn.microsoft.com/windows/win32/api/ddpbackup/nf-ddpbackup-idedupreadfilecallback-readbackupfile
     */
    ReadBackupFile(FileFullPath, FileOffset, SizeToRead, FileBuffer, ReturnedSize, Flags) {
        FileFullPath := FileFullPath is String ? BSTR.Alloc(FileFullPath).Value : FileFullPath

        FileBufferMarshal := FileBuffer is VarRef ? "char*" : "ptr"
        ReturnedSizeMarshal := ReturnedSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, BSTR, FileFullPath, "int64", FileOffset, "uint", SizeToRead, FileBufferMarshal, FileBuffer, ReturnedSizeMarshal, ReturnedSize, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * This method provides the application with the ability to influence the order of the pending reads that are required to retrieve the target file.
     * @remarks
     * Given a list of container files that hold data for the restore target file, the application optionally 
     *     generates a list of container store file extents in a sorted order that results in an efficient cross-container 
     *     read plan. For a backup store located on tape, this would normally be in tape order.
     * 
     * In the case where a container is stored in multiple extents in the backup store—for 
     *     example, as a result of an incremental backup sequence—the application may also return 
     *     multiple container extents for each logical container file.
     * 
     * The application may return 
     *     <b>S_OK</b> and <b>NULL</b> output parameters to skip the read plan 
     *     optimizations. In this case, container read order will be chosen by Data Deduplication.
     * @param {Integer} NumberOfContainers Number of container paths in the <i>ContainerPaths</i> array.
     * @param {Pointer<BSTR>} ContainerPaths Array of paths to container files that must be read in order to restore the file specified in the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ddpbackup/nf-ddpbackup-idedupbackupsupport-restorefiles">IDedupBackupSupport::RestoreFiles</a> 
     *       call. Each element is a full path from the root directory of the volume to a container file.
     * @param {Pointer<Integer>} ReadPlanEntries Pointer to a ULONG variable that receives the number of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/ddpbackup/ns-ddpbackup-dedup_container_extent">DEDUP_CONTAINER_EXTENT</a> structures in the array 
     *       that the <i>ReadPlan</i> parameter points to.
     * @param {Pointer<Pointer<DEDUP_CONTAINER_EXTENT>>} ReadPlan Pointer to a buffer that receives an array of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/ddpbackup/ns-ddpbackup-dedup_container_extent">DEDUP_CONTAINER_EXTENT</a> structures.
     * @returns {HRESULT} This method can return standard <b>HRESULT</b> values, such as 
     *       <b>S_OK</b>. It can also return converted 
     *       <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a> using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Possible return values 
     *       include the following.
     * @see https://learn.microsoft.com/windows/win32/api/ddpbackup/nf-ddpbackup-idedupreadfilecallback-ordercontainersrestore
     */
    OrderContainersRestore(NumberOfContainers, ContainerPaths, ReadPlanEntries, ReadPlan) {
        ReadPlanEntriesMarshal := ReadPlanEntries is VarRef ? "uint*" : "ptr"
        ReadPlanMarshal := ReadPlan is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", NumberOfContainers, BSTR.Ptr, ContainerPaths, ReadPlanEntriesMarshal, ReadPlanEntries, ReadPlanMarshal, ReadPlan, "HRESULT")
        return result
    }

    /**
     * Provides the application with a preview of the sequence of reads that are pending for a given container file extent.
     * @remarks
     * <b>PreviewContainerRead</b> is called for each container file extent reported by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ddpbackup/nf-ddpbackup-idedupreadfilecallback-ordercontainersrestore">IDedupReadFileCallback::OrderContainersRestore</a>. The application may use this preview as a per-container extent read plan to increase the efficiency of the pending reads. For example, the application may choose to perform read-ahead to improve throughput or to cache read buffers to improve overall performance across parallel file restore operations.
     * @param {BSTR} FileFullPath The full path from the root directory of the volume to the container file.
     * @param {Integer} NumberOfReads Number of <a href="https://docs.microsoft.com/windows/desktop/api/ddpbackup/ns-ddpbackup-ddp_file_extent">DDP_FILE_EXTENT</a> structures in the array that the <i>ReadOffsets</i> parameter points to.
     * @param {Pointer<DDP_FILE_EXTENT>} ReadOffsets Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ddpbackup/ns-ddpbackup-ddp_file_extent">DDP_FILE_EXTENT</a> structures.
     * @returns {HRESULT} This method can return standard <b>HRESULT</b> values, such as <b>S_OK</b>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Possible return values include the following.
     * @see https://learn.microsoft.com/windows/win32/api/ddpbackup/nf-ddpbackup-idedupreadfilecallback-previewcontainerread
     */
    PreviewContainerRead(FileFullPath, NumberOfReads, ReadOffsets) {
        FileFullPath := FileFullPath is String ? BSTR.Alloc(FileFullPath).Value : FileFullPath

        result := ComCall(5, this, BSTR, FileFullPath, "uint", NumberOfReads, DDP_FILE_EXTENT.Ptr, ReadOffsets, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDedupReadFileCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReadBackupFile := CallbackCreate(GetMethod(implObj, "ReadBackupFile"), flags, 7)
        this.vtbl.OrderContainersRestore := CallbackCreate(GetMethod(implObj, "OrderContainersRestore"), flags, 5)
        this.vtbl.PreviewContainerRead := CallbackCreate(GetMethod(implObj, "PreviewContainerRead"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReadBackupFile)
        CallbackFree(this.vtbl.OrderContainersRestore)
        CallbackFree(this.vtbl.PreviewContainerRead)
    }
}
