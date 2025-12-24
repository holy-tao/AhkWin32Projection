#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Ole\IEnumVARIANT.ahk
#Include .\IFsiItem.ahk
#Include .\IEnumFsiItems.ahk

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
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IEnumFsiItems} 
     */
    EnumFsiItems {
        get => this.get_EnumFsiItems()
    }

    /**
     * Retrieves a list of child items contained within the directory in the file system image.
     * @returns {IEnumVARIANT} An <b>IEnumVariant</b> interface that you use to enumerate the child items contained within the directory. The items of the enumeration are variants whose type is <b>VT_BSTR</b>. Use the <b>bstrVal</b> member to retrieve the path to the child item.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsidirectoryitem-get__newenum
     */
    get__NewEnum() {
        result := ComCall(19, this, "ptr*", &NewEnum := 0, "HRESULT")
        return IEnumVARIANT(NewEnum)
    }

    /**
     * Retrieves the specified directory or file item from file system image.
     * @param {BSTR} path String that contains the path to the item to retrieve.
     * @returns {IFsiItem} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifsiitem">IFsiItem</a> interface of the requested directory or file item.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsidirectoryitem-get_item
     */
    get_Item(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(20, this, "ptr", path, "ptr*", &item := 0, "HRESULT")
        return IFsiItem(item)
    }

    /**
     * Number of child items in the enumeration.
     * @returns {Integer} Number of directory and file items within the directory in the file system image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsidirectoryitem-get_count
     */
    get_Count() {
        result := ComCall(21, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * Retrieves a list of child items contained within the directory in the file system image.
     * @returns {IEnumFsiItems} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ienumfsiitems">IEnumFsiItems</a> interface that contains a collection of the child directory and file items contained within the directory.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsidirectoryitem-get_enumfsiitems
     */
    get_EnumFsiItems() {
        result := ComCall(22, this, "ptr*", &NewEnum := 0, "HRESULT")
        return IEnumFsiItems(NewEnum)
    }

    /**
     * Adds a directory to the file system image.
     * @param {BSTR} path String that contains the relative path of directory to create.   
     * 
     * Specify the full path when calling this method from the root directory item.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Path '%1!s!' is badly formed or contains invalid characters.
     * 
     * Value: 0xC0AAB110
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for parameter <i>%1!ls!</i> is not valid.
     * 
     * Value: 0xC0AAB101
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>	IMAPI_E_NOT_IN_FILE_SYSTEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>ls!'</i> is not part of the file system. It must be added to complete this operation.
     * 
     * Value: 0xC0AAB10B
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_READONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * FileSystemImage object is in read only mode.
     * 
     * Value: 0xC0AAB102
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsidirectoryitem-adddirectory
     */
    AddDirectory(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(23, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * Adds a file to the file system image.
     * @param {BSTR} path String that contains the relative path of the directory to contain the new file.
     * 
     * Specify the full path when calling this method from the root directory item.
     * @param {IStream} fileData An <b>IStream</b> interface of the file (data stream) to write to the media.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Path '%1!s!' is badly formed or contains invalid characters.
     * 
     * Value: 0xC0AAB110
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer is not valid.
     * 
     * Value: 0x80004003
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for parameter <i>%1!ls!</i> is not valid.
     * 
     * Value: 0xC0AAB101
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>	IMAPI_E_NOT_IN_FILE_SYSTEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>ls!'</i> is not part of the file system. It must be added to complete this operation.
     * 
     * Value: 0xC0AAB10B
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_READONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * FileSystemImage object is in read only mode.
     * 
     * Value: 0xC0AAB102
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsidirectoryitem-addfile
     */
    AddFile(path, fileData) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(24, this, "ptr", path, "ptr", fileData, "HRESULT")
        return result
    }

    /**
     * Adds the contents of a directory tree to the file system image.
     * @param {BSTR} sourceDirectory String that contains the relative path of the directory tree to create.
     * 
     * Specify the full path when calling this method from the root directory item.
     * @param {VARIANT_BOOL} includeBaseDirectory Set to VARIANT_TRUE to include the directory in <i>sourceDirectory</i> as a subdirectory in the file system image. Otherwise, VARIANT_FALSE.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate the required memory.
     * 
     * 
     * 
     * Value: 0x8007000E
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer is not valid.
     * 
     * Value: 0x80004003
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DIRECTORY_READ_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure enumerating files in the directory tree is inaccessible due to permissions.
     * 
     * Value: 0xC0AAB12BL
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DATA_STREAM_CREATE_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more  of the files in the directory tree is inaccessible due to permissions.
     * 
     * Value: 0xC0AAB12A
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DATA_STREAM_READ_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot read data from stream supplied for file '%1!ls!'.
     * 
     * Value: 0xC0AAB129
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for parameter <i>%1!ls!</i> is not valid.
     * 
     * Value: 0xC0AAB101
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>	IMAPI_E_NOT_IN_FILE_SYSTEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>ls!'</i> is not part of the file system. It must be added to complete this operation.
     * 
     * Value: 0xC0AAB10B
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_READONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * FileSystemImage object is in read only mode.
     * 
     * Value: 0xC0AAB102
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_IMAGE_SIZE_LIMIT
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Adding this file or directory would result in a result image having a size larger than the current configured limit.
     * 
     * 
     * Value: 0xC0AAB120
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Path '%1!s!' is badly formed or contains invalid characters.
     * 
     * Value: 0xC0AAB110
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DUP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ls!' name already exists.
     * 
     * Value: 0xC0AAB112
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_NO_UNIQUE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attempt to add '%1!ls!' failed:  cannot create a file-system-specific unique name for the %2!ls! file system.
     * 
     * Value: 0xC0AAB113
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_ISO9660_LEVELS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ISO9660 is limited to 8 levels of directories.
     * 
     * Value: 0xC0AAB131
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_TOO_MANY_DIRS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This file system image has too many directories for the %1!ls! file system.
     * 
     * Value: 0xC0AAB130
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DIR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The directory '%1!s!' not found in FileSystemImage hierarchy.
     * 
     * Value: 0xC0AAB11A
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  Values returned by the  <a href="/windows/desktop/api/fileapi/nf-fileapi-getfileattributesexa">GetFileAttributesEx</a> and <a href="/windows/desktop/api/fileapi/nf-fileapi-findfirstfilea">FindFirstFile</a> functions may also be returned here.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsidirectoryitem-addtree
     */
    AddTree(sourceDirectory, includeBaseDirectory) {
        sourceDirectory := sourceDirectory is String ? BSTR.Alloc(sourceDirectory).Value : sourceDirectory

        result := ComCall(25, this, "ptr", sourceDirectory, "short", includeBaseDirectory, "HRESULT")
        return result
    }

    /**
     * Adds a file or directory described by the IFsiItem object to the file system image.
     * @param {IFsiItem} item An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifsiitem">IFsiItem</a> interface of the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifsifileitem">IFsiFileItem</a>or <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifsidirectoryitem">IFsiDirectoryItem</a> to add to the file system  image.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer is not valid.
     * 
     * Value: 0x80004003
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Path '%1!s!' is badly formed or contains invalid characters.
     * 
     * Value: 0xC0AAB110
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DATA_STREAM_READ_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot read data from stream supplied for file '%1!ls!'.
     * 
     * Value: 0xC0AAB129
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DUP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ls!' name already exists.
     * 
     * Value: 0xC0AAB112
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_NO_UNIQUE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attempt to add '%1!ls!' failed:  cannot create a file-system-specific unique name for the %2!ls! file system.
     * 
     * Value: 0xC0AAB113
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_IMAGE_SIZE_LIMIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Adding '%1!ls!' would result in a result image having a size larger than the current configured limit.
     * 
     * Value: 0xC0AAB120
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_ISO9660_LEVELS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * ISO9660 is limited to 8 levels of directories.
     * 
     * Value: 0xC0AAB131
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_TOO_MANY_DIRS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This file system image has too many directories for the %1!ls! file system.
     * 
     * Value: 0xC0AAB130
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DIR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The directory '%1!s!' not found in FileSystemImage hierarchy.
     * 
     * Value: 0xC0AAB11A
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>	IMAPI_E_NOT_IN_FILE_SYSTEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This file or directory is not part of the file system. It must be added to complete this operation.
     * 
     * Value: 0xC0AAB10B
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_READONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * FileSystemImage object is in read only mode.
     * 
     * Value: 0xC0AAB102
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_IMAGE_SIZE_LIMIT
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Adding this file or directory would result in a result image having a size larger than the current configured limit.
     * 
     * 
     * Value: 0xC0AAB120
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate the required memory.
     * 
     * 
     * 
     * Value: 0x8007000E
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  Values returned by the  IUnknown::QueryInterface method may also be returned here.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsidirectoryitem-add
     */
    Add(item) {
        result := ComCall(26, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * Removes the specified item from the file system image.
     * @param {BSTR} path String that contains the relative path of the item to remove.
     * The path is relative to current directory item.
     * 
     * Specify the full path when calling this method from the root directory item.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Path '%1!s!' is badly formed or contains invalid characters.
     * 
     * Value: 0xC0AAB110
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate necessary memory.
     * 
     * Value: 0x8007000E
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for parameter <i>%1!ls!</i> is not valid.
     * 
     * Value: 0xC0AAB101
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>	IMAPI_E_NOT_IN_FILE_SYSTEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>ls!'</i> is not part of the file system. It must be added to complete this operation.
     * 
     * Value: 0xC0AAB10B
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_READONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * FileSystemImage object is in read only mode.
     * 
     * Value: 0xC0AAB102
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DIR_NOT_EMPTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The directory <i>%1!s!</i> is not empty.
     * 
     * Value: 0xC0AAB10A
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_FSI_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal error occurred: <i>%1!ls!</i>.
     * 
     * Value: 0xC0AAB100
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsidirectoryitem-remove
     */
    Remove(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(27, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * Remove the specified directory tree from the file system image.
     * @param {BSTR} path String that contains the name of directory to remove.
     * The path is relative to current directory item.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>path</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified for parameter <i>%1!ls!</i> is not valid.
     * 
     * Value: 0xC0AAB101
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_INVALID_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Path '%1!s!' is badly formed or contains invalid characters.
     * 
     * Value: 0xC0AAB110
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>	IMAPI_E_NOT_IN_FILE_SYSTEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>ls!'</i> is not part of the file system. It must be added to complete this operation.
     * 
     * Value: 0xC0AAB10B
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_READONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * FileSystemImage object is in read only mode.
     * 
     * Value: 0xC0AAB102
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DIR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified directory does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_DIR_NOT_EMPTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The directory <i>%1!s!</i> is not empty.
     * 
     * Value: 0xC0AAB10A
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_FSI_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal error occurred: <i>%1!ls!</i>.
     * 
     * Value: 0xC0AAB100
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IMAPI_E_NOT_DIR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified path <i>%1!ls!</i> does not identify a directory.
     * 
     * Value: 0xC0AAB109
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsidirectoryitem-removetree
     */
    RemoveTree(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(28, this, "ptr", path, "HRESULT")
        return result
    }
}
