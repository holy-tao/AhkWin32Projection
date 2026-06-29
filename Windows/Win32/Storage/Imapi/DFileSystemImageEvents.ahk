#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Implement this interface to receive notifications of the current write operation. (DFileSystemImageEvents)
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nn-imapi2fs-dfilesystemimageevents
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct DFileSystemImageEvents extends IDispatch {
    /**
     * The interface identifier for DFileSystemImageEvents
     * @type {Guid}
     */
    static IID := Guid("{2c941fdf-975b-59be-a960-9a2a262853a5}")

    /**
     * The class identifier for DFileSystemImageEvents
     * @type {Guid}
     */
    static CLSID := Guid("{2c941fdf-975b-59be-a960-9a2a262853a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for DFileSystemImageEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Update : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := DFileSystemImageEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {IDispatch} _object An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage">IFileSystemImage</a> interface of the file system image that is being written. 
     * 
     * This parameter is a <b>CFileSystemImage</b> object in a script.
     * @param {BSTR} currentFile String that contains the full path of the file being written.
     * @param {Integer} copiedSectors Number of sectors copied.
     * @param {Integer} totalSectors Total number of sectors in the file.
     * @returns {HRESULT} Return values are ignored.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-dfilesystemimageevents-update
     */
    Update(_object, currentFile, copiedSectors, totalSectors) {
        currentFile := currentFile is String ? BSTR.Alloc(currentFile).Value : currentFile

        result := ComCall(7, this, "ptr", _object, BSTR, currentFile, "int", copiedSectors, "int", totalSectors, "HRESULT")
        return result
    }

    Query(iid) {
        if (DFileSystemImageEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Update := CallbackCreate(GetMethod(implObj, "Update"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Update)
    }
}
