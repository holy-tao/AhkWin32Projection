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
     * 
     * @param {BSTR} FileFullPath 
     * @param {Integer} FileOffset 
     * @param {Integer} SizeToRead 
     * @param {Pointer<Byte>} FileBuffer 
     * @param {Pointer<UInt32>} ReturnedSize 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    ReadBackupFile(FileFullPath, FileOffset, SizeToRead, FileBuffer, ReturnedSize, Flags) {
        FileFullPath := FileFullPath is String ? BSTR.Alloc(FileFullPath).Value : FileFullPath

        result := ComCall(3, this, "ptr", FileFullPath, "int64", FileOffset, "uint", SizeToRead, "char*", FileBuffer, "uint*", ReturnedSize, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NumberOfContainers 
     * @param {Pointer<BSTR>} ContainerPaths 
     * @param {Pointer<UInt32>} ReadPlanEntries 
     * @param {Pointer<DEDUP_CONTAINER_EXTENT>} ReadPlan 
     * @returns {HRESULT} 
     */
    OrderContainersRestore(NumberOfContainers, ContainerPaths, ReadPlanEntries, ReadPlan) {
        result := ComCall(4, this, "uint", NumberOfContainers, "ptr", ContainerPaths, "uint*", ReadPlanEntries, "ptr", ReadPlan, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} FileFullPath 
     * @param {Integer} NumberOfReads 
     * @param {Pointer<DDP_FILE_EXTENT>} ReadOffsets 
     * @returns {HRESULT} 
     */
    PreviewContainerRead(FileFullPath, NumberOfReads, ReadOffsets) {
        FileFullPath := FileFullPath is String ? BSTR.Alloc(FileFullPath).Value : FileFullPath

        result := ComCall(5, this, "ptr", FileFullPath, "uint", NumberOfReads, "ptr", ReadOffsets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
