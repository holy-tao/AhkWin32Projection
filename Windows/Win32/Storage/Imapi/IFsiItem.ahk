#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Base interface containing properties common to both file and directory items.
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-ifsiitem
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IFsiItem extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsiItem
     * @type {Guid}
     */
    static IID => Guid("{2c941fd9-975b-59be-a960-9a2a262853a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_FullPath", "get_CreationTime", "put_CreationTime", "get_LastAccessedTime", "put_LastAccessedTime", "get_LastModifiedTime", "put_LastModifiedTime", "get_IsHidden", "put_IsHidden", "FileSystemName", "FileSystemPath"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    FullPath {
        get => this.get_FullPath()
    }

    /**
     * @type {Float} 
     */
    CreationTime {
        get => this.get_CreationTime()
        set => this.put_CreationTime(value)
    }

    /**
     * @type {Float} 
     */
    LastAccessedTime {
        get => this.get_LastAccessedTime()
        set => this.put_LastAccessedTime(value)
    }

    /**
     * @type {Float} 
     */
    LastModifiedTime {
        get => this.get_LastModifiedTime()
        set => this.put_LastModifiedTime(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsHidden {
        get => this.get_IsHidden()
        set => this.put_IsHidden(value)
    }

    /**
     * Retrieves the name of the directory or file item in the file system image.
     * @returns {BSTR} String that contains the name of the file or directory item in the file system image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsiitem-get_name
     */
    get_Name() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the full path of the file or directory item in the file system image.
     * @returns {BSTR} String that contains the absolute path of the file or directory item in the file system image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsiitem-get_fullpath
     */
    get_FullPath() {
        pVal := BSTR()
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the date and time that the directory or file item was created and added to the file system image.
     * @returns {Float} Date and time that the  directory or file item was created and added to the file system image, according to UTC time.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsiitem-get_creationtime
     */
    get_CreationTime() {
        result := ComCall(9, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the date and time that the directory or file item was created and added to the file system image.
     * @param {Float} newVal Date and time that the directory or file item was created and added to the file system image, according to UTC time. Defaults to the time the item was added to the image.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsiitem-put_creationtime
     */
    put_CreationTime(newVal) {
        result := ComCall(10, this, "double", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the date and time the directory or file item was last accessed in the file system image.
     * @returns {Float} Date and time that the item directory or file was last accessed in the file system image, according to UTC time.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsiitem-get_lastaccessedtime
     */
    get_LastAccessedTime() {
        result := ComCall(11, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the date and time that the directory or file item was last accessed in the file system image.
     * @param {Float} newVal Date and time that the directory or file  item was last accessed in the file system image, according to UTC time. Defaults to the time the item was added to the image.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsiitem-put_lastaccessedtime
     */
    put_LastAccessedTime(newVal) {
        result := ComCall(12, this, "double", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the date and time that the directory or file item was last modified in the file system image.
     * @returns {Float} Date and time that the directory or file  item was last modified in the file system image, according to UTC time.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsiitem-get_lastmodifiedtime
     */
    get_LastModifiedTime() {
        result := ComCall(13, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the date and time that the item was last modified in the file system image.
     * @param {Float} newVal Date and time that the directory or file item was last modified in the file system image, according to UTC time.  Defaults to the time the item was added to the image.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsiitem-put_lastmodifiedtime
     */
    put_LastModifiedTime(newVal) {
        result := ComCall(14, this, "double", newVal, "HRESULT")
        return result
    }

    /**
     * Determines if the item's hidden attribute is set in the file system image.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the hidden attribute of the item is marked in the file system image; otherwise, VARIANT_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsiitem-get_ishidden
     */
    get_IsHidden() {
        result := ComCall(15, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Determines if the item's hidden attribute is set in the file system image.
     * @param {VARIANT_BOOL} newVal Set to VARIANT_TRUE to set the hidden attribute of the item in the file system image; otherwise, VARIANT_FALSE. The default is VARIANT_FALSE.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsiitem-put_ishidden
     */
    put_IsHidden(newVal) {
        result := ComCall(16, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the item as modified to conform to the specified file system.
     * @param {Integer} fileSystem File system to which the name should conform. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @returns {BSTR} String that contains the name of the item as it conforms to the specified file system. The name in the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsiitem-get_name">IFsiItem::get_Name</a> property is modified if the characters used and its length do not meet the requirements of the specified file system type.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsiitem-filesystemname
     */
    FileSystemName(fileSystem) {
        pVal := BSTR()
        result := ComCall(17, this, "int", fileSystem, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the full path of the item as modified to conform to the specified file system.
     * @param {Integer} fileSystem File system to which the path should conform. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @returns {BSTR} String that contains the full path of the item as it conforms to the specified file system. The path in the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsiitem-get_fullpath">IFsiItem::get_FullPath</a> property is modified if the characters used and its length do not meet the requirements of the specified file system type.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsiitem-filesystempath
     */
    FileSystemPath(fileSystem) {
        pVal := BSTR()
        result := ComCall(18, this, "int", fileSystem, "ptr", pVal, "HRESULT")
        return pVal
    }
}
