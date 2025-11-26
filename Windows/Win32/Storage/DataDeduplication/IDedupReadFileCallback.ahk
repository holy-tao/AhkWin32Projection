#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A callback interface, implemented by backup applications, that enables Data Deduplication to read content from metadata and container files residing in a backup store and optionally improve restore efficiency.
 * @remarks
 * 
 * The <b>IDedupReadFileCallback</b> interface is implemented by a backup application and passed as a parameter to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ddpbackup/nf-ddpbackup-idedupbackupsupport-restorefiles">IDedupBackupSupport::RestoreFiles</a> method. The callback is used by Data Deduplication to read data from Data Duplication store containers in the backup store.  <b>IDedupReadFileCallback</b> also includes methods that applications can optionally implement to increase the efficiency of the Data Deduplication file restore process.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ddpbackup/nn-ddpbackup-idedupreadfilecallback
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class IDedupReadFileCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDedupReadFileCallback
     * @type {Guid}
     */
    static IID => Guid("{7bacc67a-2f1d-42d0-897e-6ff62dd533bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadBackupFile", "OrderContainersRestore", "PreviewContainerRead"]

    /**
     * Reads data from a Data Deduplication store metadata or container file located in the backup store.
     * @param {BSTR} FileFullPath The full path from the root directory of the volume to the container file.
     * @param {Integer} FileOffset The offset, in bytes, from the beginning of the file to the beginning of the data to be read.
     * @param {Integer} SizeToRead The number of bytes to read from the file.
     * @param {Pointer<Integer>} FileBuffer A pointer to a buffer that receives the data that is read from the file. The size of the buffer must be greater than or equal to the number specified in the <i>SizeToRead</i> parameter.
     * @param {Pointer<Integer>} ReturnedSize Pointer to a ULONG variable that receives the number of bytes that were read from the backup store. If the call to <b>ReadBackupFile</b> is successful, this number is equal to the value that was specified in the <i>SizeToRead</i> parameter.
     * @param {Integer} Flags This parameter is reserved for future use.
     * @returns {HRESULT} This method can return standard <b>HRESULT</b> values, such as <b>S_OK</b>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Possible return values include the following.
     * @see https://docs.microsoft.com/windows/win32/api//ddpbackup/nf-ddpbackup-idedupreadfilecallback-readbackupfile
     */
    ReadBackupFile(FileFullPath, FileOffset, SizeToRead, FileBuffer, ReturnedSize, Flags) {
        FileFullPath := FileFullPath is String ? BSTR.Alloc(FileFullPath).Value : FileFullPath

        FileBufferMarshal := FileBuffer is VarRef ? "char*" : "ptr"
        ReturnedSizeMarshal := ReturnedSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", FileFullPath, "int64", FileOffset, "uint", SizeToRead, FileBufferMarshal, FileBuffer, ReturnedSizeMarshal, ReturnedSize, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * This method provides the application with the ability to influence the order of the pending reads that are required to retrieve the target file.
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
     *       <a href="/windows/desktop/Debug/system-error-codes">system error codes</a> using the 
     *       <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Possible return values 
     *       include the following.
     * @see https://docs.microsoft.com/windows/win32/api//ddpbackup/nf-ddpbackup-idedupreadfilecallback-ordercontainersrestore
     */
    OrderContainersRestore(NumberOfContainers, ContainerPaths, ReadPlanEntries, ReadPlan) {
        ReadPlanEntriesMarshal := ReadPlanEntries is VarRef ? "uint*" : "ptr"
        ReadPlanMarshal := ReadPlan is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", NumberOfContainers, "ptr", ContainerPaths, ReadPlanEntriesMarshal, ReadPlanEntries, ReadPlanMarshal, ReadPlan, "HRESULT")
        return result
    }

    /**
     * Provides the application with a preview of the sequence of reads that are pending for a given container file extent.
     * @param {BSTR} FileFullPath The full path from the root directory of the volume to the container file.
     * @param {Integer} NumberOfReads Number of <a href="https://docs.microsoft.com/windows/desktop/api/ddpbackup/ns-ddpbackup-ddp_file_extent">DDP_FILE_EXTENT</a> structures in the array that the <i>ReadOffsets</i> parameter points to.
     * @param {Pointer<DDP_FILE_EXTENT>} ReadOffsets Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ddpbackup/ns-ddpbackup-ddp_file_extent">DDP_FILE_EXTENT</a> structures.
     * @returns {HRESULT} This method can return standard <b>HRESULT</b> values, such as <b>S_OK</b>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Possible return values include the following.
     * @see https://docs.microsoft.com/windows/win32/api//ddpbackup/nf-ddpbackup-idedupreadfilecallback-previewcontainerread
     */
    PreviewContainerRead(FileFullPath, NumberOfReads, ReadOffsets) {
        FileFullPath := FileFullPath is String ? BSTR.Alloc(FileFullPath).Value : FileFullPath

        result := ComCall(5, this, "ptr", FileFullPath, "uint", NumberOfReads, "ptr", ReadOffsets, "HRESULT")
        return result
    }
}
