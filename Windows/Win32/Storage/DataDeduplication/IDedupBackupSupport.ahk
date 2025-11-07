#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method for restoring a file from a backup store containing copies of Data Deduplication reparse points, metadata, and container files.
 * @remarks
 * 
 *  A backup application uses the 
 *      <b>IDedupBackupSupport</b> interface to drive the restore 
 *      process for a select file from a backup store that contains the fully optimized version of the file (reparse 
 *      point) and the Data Deduplication store.
 * 
 * This interface is not useful when the backup store contains a copy of the original, non-optimized file.
 * 
 * Applications that use the <b>IDedupBackupSupport</b> 
 *      interface must also implement the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/ddpbackup/nn-ddpbackup-idedupreadfilecallback">IDedupReadFileCallback</a> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ddpbackup/nn-ddpbackup-idedupbackupsupport
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class IDedupBackupSupport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDedupBackupSupport
     * @type {Guid}
     */
    static IID => Guid("{c719d963-2b2d-415e-acf7-7eb7ca596ff4}")

    /**
     * The class identifier for DedupBackupSupport
     * @type {Guid}
     */
    static CLSID => Guid("{73d6b2ad-2984-4715-b2e3-924c149744dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RestoreFiles"]

    /**
     * 
     * @param {Integer} NumberOfFiles 
     * @param {Pointer<BSTR>} FileFullPaths 
     * @param {IDedupReadFileCallback} Store 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddpbackup/nf-ddpbackup-idedupbackupsupport-restorefiles
     */
    RestoreFiles(NumberOfFiles, FileFullPaths, Store, Flags) {
        result := ComCall(3, this, "uint", NumberOfFiles, "ptr", FileFullPaths, "ptr", Store, "uint", Flags, "int*", &FileResults := 0, "HRESULT")
        return FileResults
    }
}
