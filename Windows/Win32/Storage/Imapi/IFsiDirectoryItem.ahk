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
     * 
     * @param {Pointer<IEnumVARIANT>} NewEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(NewEnum) {
        result := ComCall(19, this, "ptr", NewEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Pointer<IFsiItem>} item 
     * @returns {HRESULT} 
     */
    get_Item(path, item) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(20, this, "ptr", path, "ptr", item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        result := ComCall(21, this, "int*", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumFsiItems>} NewEnum 
     * @returns {HRESULT} 
     */
    get_EnumFsiItems(NewEnum) {
        result := ComCall(22, this, "ptr", NewEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     */
    AddDirectory(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(23, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {Pointer<IStream>} fileData 
     * @returns {HRESULT} 
     */
    AddFile(path, fileData) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(24, this, "ptr", path, "ptr", fileData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} sourceDirectory 
     * @param {VARIANT_BOOL} includeBaseDirectory 
     * @returns {HRESULT} 
     */
    AddTree(sourceDirectory, includeBaseDirectory) {
        sourceDirectory := sourceDirectory is String ? BSTR.Alloc(sourceDirectory).Value : sourceDirectory

        result := ComCall(25, this, "ptr", sourceDirectory, "short", includeBaseDirectory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsiItem>} item 
     * @returns {HRESULT} 
     */
    Add(item) {
        result := ComCall(26, this, "ptr", item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     */
    Remove(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(27, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     */
    RemoveTree(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(28, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
