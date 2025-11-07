#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to receives notifications regarding the current file system import operation.
 * @remarks
 * 
 * This interface supports import notifications for ISO9660, Joliet and UDF file systems.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-dfilesystemimageimportevents
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
     * 
     * @param {IDispatch} object 
     * @param {Integer} fileSystem 
     * @param {BSTR} currentItem 
     * @param {Integer} importedDirectoryItems 
     * @param {Integer} totalDirectoryItems 
     * @param {Integer} importedFileItems 
     * @param {Integer} totalFileItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-dfilesystemimageimportevents-updateimport
     */
    UpdateImport(object, fileSystem, currentItem, importedDirectoryItems, totalDirectoryItems, importedFileItems, totalFileItems) {
        currentItem := currentItem is String ? BSTR.Alloc(currentItem).Value : currentItem

        result := ComCall(7, this, "ptr", object, "int", fileSystem, "ptr", currentItem, "int", importedDirectoryItems, "int", totalDirectoryItems, "int", importedFileItems, "int", totalFileItems, "HRESULT")
        return result
    }
}
