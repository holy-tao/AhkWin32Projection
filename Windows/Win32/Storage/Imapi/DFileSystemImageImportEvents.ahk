#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FsiFileSystems.ahk" { FsiFileSystems }

/**
 * Use this interface to receives notifications regarding the current file system import operation.
 * @remarks
 * This interface supports import notifications for ISO9660, Joliet and UDF file systems.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nn-imapi2fs-dfilesystemimageimportevents
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct DFileSystemImageImportEvents extends IDispatch {
    /**
     * The interface identifier for DFileSystemImageImportEvents
     * @type {Guid}
     */
    static IID := Guid("{d25c30f9-4087-4366-9e24-e55be286424b}")

    /**
     * The class identifier for DFileSystemImageImportEvents
     * @type {Guid}
     */
    static CLSID := Guid("{d25c30f9-4087-4366-9e24-e55be286424b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for DFileSystemImageImportEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        UpdateImport : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := DFileSystemImageImportEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {IDispatch} _object Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage3">IFilesystemImage3</a> interface of a file system image object to which data is being imported.
     * @param {FsiFileSystems} fileSystem Type of the file system currently being imported. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @param {BSTR} currentItem A string containing the name of the file or directory being imported at the moment.
     * @param {Integer} importedDirectoryItems The number of directories imported so far.
     * @param {Integer} totalDirectoryItems The total number of directories to be imported from the optical medium.
     * @param {Integer} importedFileItems The number of files imported so far.
     * @param {Integer} totalFileItems The total number of files to be imported from the optical medium.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-dfilesystemimageimportevents-updateimport
     */
    UpdateImport(_object, fileSystem, currentItem, importedDirectoryItems, totalDirectoryItems, importedFileItems, totalFileItems) {
        currentItem := currentItem is String ? BSTR.Alloc(currentItem).Value : currentItem

        result := ComCall(7, this, "ptr", _object, FsiFileSystems, fileSystem, BSTR, currentItem, "int", importedDirectoryItems, "int", totalDirectoryItems, "int", importedFileItems, "int", totalFileItems, "HRESULT")
        return result
    }

    Query(iid) {
        if (DFileSystemImageImportEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UpdateImport := CallbackCreate(GetMethod(implObj, "UpdateImport"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UpdateImport)
    }
}
