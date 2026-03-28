#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Implement this interface to receive notifications of the current write operation. (DFileSystemImageEvents)
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nn-imapi2fs-dfilesystemimageevents
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class DFileSystemImageEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DFileSystemImageEvents
     * @type {Guid}
     */
    static IID => Guid("{2c941fdf-975b-59be-a960-9a2a262853a5}")

    /**
     * The class identifier for DFileSystemImageEvents
     * @type {Guid}
     */
    static CLSID => Guid("{2c941fdf-975b-59be-a960-9a2a262853a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Update"]

    /**
     * Implement this method to receive progress notification of the current write operation. The notifications are sent when copying the content of a file or while adding directories or files to the file system image.
     * @remarks
     * Notifications are sent in response to calling one of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-add">IFsiDirectoryItem::Add</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-addfile">IFsiDirectoryItem::AddFile</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-addtree">IFsiDirectoryItem::AddTree</a>
     * </li>
     * </ul>
     * Notifications can also be sent when calling one of the following methods to import a UDF file system that was created using immediate allocation (immediate allocation means that the file data is contained within the file descriptor instead of having allocation descriptors in the file descriptor that point to sectors of data):
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-importfilesystem">IFileSystemImage::ImportFileSystem</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimage-importspecificfilesystem">IFileSystemImage::ImportSpecificFileSystem</a>
     * </li>
     * </ul>
     * Notification is sent:
     * 
     * <ul>
     * <li>Once before adding the first sector of a file (<i>copiedSectors</i> is 0)</li>
     * <li>For every megabyte that is written</li>
     * <li>Once after the final write if the file did not end on a megabyte boundary</li>
     * </ul>
     * @param {IDispatch} _object 
     * @param {BSTR} currentFile String that contains the full path of the file being written.
     * @param {Integer} copiedSectors Number of sectors copied.
     * @param {Integer} totalSectors Total number of sectors in the file.
     * @returns {HRESULT} Return values are ignored.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-dfilesystemimageevents-update
     */
    Update(_object, currentFile, copiedSectors, totalSectors) {
        currentFile := currentFile is String ? BSTR.Alloc(currentFile).Value : currentFile

        result := ComCall(7, this, "ptr", _object, "ptr", currentFile, "int", copiedSectors, "int", totalSectors, "HRESULT")
        return result
    }
}
