#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to receives notifications regarding the current file system import operation.
 * @remarks
 * This interface supports import notifications for ISO9660, Joliet and UDF file systems.
 * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nn-imapi2fs-dfilesystemimageimportevents
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class DFileSystemImageImportEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DFileSystemImageImportEvents
     * @type {Guid}
     */
    static IID => Guid("{d25c30f9-4087-4366-9e24-e55be286424b}")

    /**
     * The class identifier for DFileSystemImageImportEvents
     * @type {Guid}
     */
    static CLSID => Guid("{d25c30f9-4087-4366-9e24-e55be286424b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateImport"]

    /**
     * Receives import notification for every file and directory item imported from an optical medium.
     * @remarks
     * Notifications are sent in response to calling one of the following methods for importing a file system.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-importfilesystem">IFileSystemImage::ImportFileSystem</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-importspecificfilesystem">IFileSystemImage::ImportSpecificFileSystem</a>
     * </li>
     * </ul>
     * UpdateImport method receives import notifications from ISO9660, Joliet and UDF file systems. A notification is sent:
     * 
     * <ul>
     * <li>Once after every individual imported file.</li>
     * <li>Once before every directory import begins.</li>
     * </ul>
     * The <i>totalFileItems</i> parameter of an <b>UpdateImport</b> event is always set to (-1) for ISO9660 and Joliet file systems, because of the difficulty quickly and accurately determining the total number of files in an ISO9660/Joliet file system prior to import.
     * 
     * Import notifications are generated only for files and directories, and not for associated named streams.
     * 
     * If the <i>currentItem</i> is a directory, it contains a back slash '\' at the end.
     * @param {IDispatch} object_ Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage3">IFilesystemImage3</a> interface of a file system image object to which data is being imported.
     * @param {Integer} fileSystem Type of the file system currently being imported. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @param {BSTR} currentItem A string containing the name of the file or directory being imported at the moment.
     * @param {Integer} importedDirectoryItems The number of directories imported so far.
     * @param {Integer} totalDirectoryItems The total number of directories to be imported from the optical medium.
     * @param {Integer} importedFileItems The number of files imported so far.
     * @param {Integer} totalFileItems The total number of files to be imported from the optical medium.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2fs/nf-imapi2fs-dfilesystemimageimportevents-updateimport
     */
    UpdateImport(object_, fileSystem, currentItem, importedDirectoryItems, totalDirectoryItems, importedFileItems, totalFileItems) {
        if(currentItem is String) {
            pin := BSTR.Alloc(currentItem)
            currentItem := pin.Value
        }

        result := ComCall(7, this, "ptr", object_, "int", fileSystem, "ptr", currentItem, "int", importedDirectoryItems, "int", totalDirectoryItems, "int", importedFileItems, "int", totalFileItems, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
