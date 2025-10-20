#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsiItem.ahk

/**
 * Use this interface to add items to or remove items from the file-system image.
 * @remarks
 * 
  * Each directory item contains an enumerable collection of child items within the directory.
  * 
  * You can add and remove files and directories only after the directory item has been added to the file system image.
  * 
  * 
  * This is an <b>FsiDirectoryItem</b> object in script.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-ifsidirectoryitem
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IFsiDirectoryItem extends IFsiItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsiDirectoryItem
     * @type {Guid}
     */
    static IID => Guid("{2c941fdc-975b-59be-a960-9a2a262853a5}")

    /**
     * The class identifier for FsiDirectoryItem
     * @type {Guid}
     */
    static CLSID => Guid("{2c941fc8-975b-59be-a960-9a2a262853a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "get_EnumFsiItems", "AddDirectory", "AddFile", "AddTree", "Add", "Remove", "RemoveTree"]

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} NewEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-get__newenum
     */
    get__NewEnum(NewEnum) {
        result := ComCall(19, this, "ptr*", NewEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Pointer<IFsiItem>} item 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-get_item
     */
    get_Item(path, item) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(20, this, "ptr", path, "ptr*", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-get_count
     */
    get_Count(Count) {
        result := ComCall(21, this, "int*", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumFsiItems>} NewEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-get_enumfsiitems
     */
    get_EnumFsiItems(NewEnum) {
        result := ComCall(22, this, "ptr*", NewEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-adddirectory
     */
    AddDirectory(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(23, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {IStream} fileData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-addfile
     */
    AddFile(path, fileData) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(24, this, "ptr", path, "ptr", fileData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} sourceDirectory 
     * @param {VARIANT_BOOL} includeBaseDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-addtree
     */
    AddTree(sourceDirectory, includeBaseDirectory) {
        sourceDirectory := sourceDirectory is String ? BSTR.Alloc(sourceDirectory).Value : sourceDirectory

        result := ComCall(25, this, "ptr", sourceDirectory, "short", includeBaseDirectory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFsiItem} item 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-add
     */
    Add(item) {
        result := ComCall(26, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-remove
     */
    Remove(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(27, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem-removetree
     */
    RemoveTree(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(28, this, "ptr", path, "HRESULT")
        return result
    }
}
