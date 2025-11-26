#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Implement this interface to receive notifications of the current write operation.
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-dfilesystemimageevents
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
     * @param {IDispatch} object An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage">IFileSystemImage</a> interface of the file system image that is being written. 
     * 
     * This parameter is a <b>CFileSystemImage</b> object in a script.
     * @param {BSTR} currentFile String that contains the full path of the file being written.
     * @param {Integer} copiedSectors Number of sectors copied.
     * @param {Integer} totalSectors Total number of sectors in the file.
     * @returns {HRESULT} Return values are ignored.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-dfilesystemimageevents-update
     */
    Update(object, currentFile, copiedSectors, totalSectors) {
        currentFile := currentFile is String ? BSTR.Alloc(currentFile).Value : currentFile

        result := ComCall(7, this, "ptr", object, "ptr", currentFile, "int", copiedSectors, "int", totalSectors, "HRESULT")
        return result
    }
}
