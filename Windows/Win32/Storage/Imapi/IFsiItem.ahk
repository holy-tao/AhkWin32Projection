#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FsiFileSystems.ahk" { FsiFileSystems }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Base interface containing properties common to both file and directory items.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nn-imapi2fs-ifsiitem
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IFsiItem extends IDispatch {
    /**
     * The interface identifier for IFsiItem
     * @type {Guid}
     */
    static IID := Guid("{2c941fd9-975b-59be-a960-9a2a262853a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsiItem interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name             : IntPtr
        get_FullPath         : IntPtr
        get_CreationTime     : IntPtr
        put_CreationTime     : IntPtr
        get_LastAccessedTime : IntPtr
        put_LastAccessedTime : IntPtr
        get_LastModifiedTime : IntPtr
        put_LastModifiedTime : IntPtr
        get_IsHidden         : IntPtr
        put_IsHidden         : IntPtr
        FileSystemName       : IntPtr
        FileSystemPath       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsiItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @remarks
     * To get the full path to the item, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsiitem-get_fullpath">IFsiItem::get_FullPath</a> method.
     * @returns {BSTR} String that contains the name of the file or directory item in the file system image.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-get_name
     */
    get_Name() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the full path of the file or directory item in the file system image.
     * @returns {BSTR} String that contains the absolute path of the file or directory item in the file system image.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-get_fullpath
     */
    get_FullPath() {
        pVal := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the date and time that the directory or file item was created and added to the file system image.
     * @remarks
     * The creation date and time are propagated to the attributes that users see when listing the contents of a directory.
     * 
     * IMAPI does not support the extended attribute for <i>CreationTime</i>, and as a result, UDFS populates the <i>CreationTime</i> with the value expressed by the <i>LastAccessed</i> property from the file entry.
     * @returns {Float} Date and time that the  directory or file item was created and added to the file system image, according to UTC time.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-get_creationtime
     */
    get_CreationTime() {
        result := ComCall(9, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the date and time that the directory or file item was created and added to the file system image.
     * @remarks
     * IMAPI does not support the extended attribute for <i>CreationTime</i>, and as a result, UDFS populates the <i>CreationTime</i> with the value expressed by the <i>LastAccessed</i> property from the file entry.
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-put_creationtime
     */
    put_CreationTime(newVal) {
        result := ComCall(10, this, "double", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the date and time the directory or file item was last accessed in the file system image.
     * @remarks
     * UDFS (UDF) uses the <i>LastAccessedTime</i> value for the <i>CreationTime</i>, as IMAPI does not currently support the <i>CreationTime</i> extended attribute.
     * 
     * CDFS (ISO 9660) sets the <i>LastAccessedTime</i> value retrieved by this method to 0, as only the recording time is stored within the File/Directory descriptor.
     * @returns {Float} Date and time that the item directory or file was last accessed in the file system image, according to UTC time.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-get_lastaccessedtime
     */
    get_LastAccessedTime() {
        result := ComCall(11, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the date and time that the directory or file item was last accessed in the file system image.
     * @remarks
     * UDFS (UDF) uses the <i>LastAccessedTime</i> value for the <i>CreationTime</i>, as IMAPI does not currently support the <i>CreationTime</i> extended attribute.
     * 
     * CDFS (ISO 9660) sets the <i>LastAccessedTime</i> value to 0, as only the recording time is stored within the File/Directory descriptor.
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-put_lastaccessedtime
     */
    put_LastAccessedTime(newVal) {
        result := ComCall(12, this, "double", newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the date and time that the directory or file item was last modified in the file system image.
     * @remarks
     * When implementing this method, a few things should be taken into consideration:
     * 
     * UDFS (UDF) will use the value provided by <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsiitem-put_lastmodifiedtime">IFsiItem::put_LastModifiedTime</a> as both the <i>CreationTime</i> and <i>LastModifiedTime</i>.
     * 
     * CDFS (ISO 9660) uses the date/time of recording as the <i>CreationTime</i> and <i>LastModifiedTime</i>. As a result, CDFS sets the value of <i>LastModifiedTime</i> to 0.
     * @returns {Float} Date and time that the directory or file  item was last modified in the file system image, according to UTC time.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-get_lastmodifiedtime
     */
    get_LastModifiedTime() {
        result := ComCall(13, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Sets the date and time that the item was last modified in the file system image.
     * @remarks
     * The last modified time is propagated to the attribute  that users see when viewing the properties of a directory or a file.
     * 
     * When implementing this method, a few things should be taken into consideration:
     * 
     * UDFS (UDF) will use the value provided by <b>IFsiItem::put_LastModifiedTime</b> as both the <i>CreationTime</i> and <i>LastModifiedTime</i>.
     * 
     * CDFS (ISO 9660) uses the date/time of recording as the <i>CreationTime</i> and <i>LastModifiedTime</i>. As a result, CDFS sets the value of <i>LastModifiedTime</i> to 0.
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-put_lastmodifiedtime
     */
    put_LastModifiedTime(newVal) {
        result := ComCall(14, this, "double", newVal, "HRESULT")
        return result
    }

    /**
     * Determines if the item's hidden attribute is set in the file system image. (Get)
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the hidden attribute of the item is marked in the file system image; otherwise, VARIANT_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-get_ishidden
     */
    get_IsHidden() {
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Determines if the item's hidden attribute is set in the file system image. (Put)
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-put_ishidden
     */
    put_IsHidden(newVal) {
        result := ComCall(16, this, VARIANT_BOOL, newVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the item as modified to conform to the specified file system.
     * @param {FsiFileSystems} fileSystem File system to which the name should conform. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @returns {BSTR} String that contains the name of the item as it conforms to the specified file system. The name in the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsiitem-get_name">IFsiItem::get_Name</a> property is modified if the characters used and its length do not meet the requirements of the specified file system type.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-filesystemname
     */
    FileSystemName(fileSystem) {
        pVal := BSTR.Owned()
        result := ComCall(17, this, FsiFileSystems, fileSystem, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the full path of the item as modified to conform to the specified file system.
     * @param {FsiFileSystems} fileSystem File system to which the path should conform. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/ne-imapi2fs-fsifilesystems">FsiFileSystems</a> enumeration type.
     * @returns {BSTR} String that contains the full path of the item as it conforms to the specified file system. The path in the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsiitem-get_fullpath">IFsiItem::get_FullPath</a> property is modified if the characters used and its length do not meet the requirements of the specified file system type.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-filesystempath
     */
    FileSystemPath(fileSystem) {
        pVal := BSTR.Owned()
        result := ComCall(18, this, FsiFileSystems, fileSystem, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    Query(iid) {
        if (IFsiItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_FullPath := CallbackCreate(GetMethod(implObj, "get_FullPath"), flags, 2)
        this.vtbl.get_CreationTime := CallbackCreate(GetMethod(implObj, "get_CreationTime"), flags, 2)
        this.vtbl.put_CreationTime := CallbackCreate(GetMethod(implObj, "put_CreationTime"), flags, 2)
        this.vtbl.get_LastAccessedTime := CallbackCreate(GetMethod(implObj, "get_LastAccessedTime"), flags, 2)
        this.vtbl.put_LastAccessedTime := CallbackCreate(GetMethod(implObj, "put_LastAccessedTime"), flags, 2)
        this.vtbl.get_LastModifiedTime := CallbackCreate(GetMethod(implObj, "get_LastModifiedTime"), flags, 2)
        this.vtbl.put_LastModifiedTime := CallbackCreate(GetMethod(implObj, "put_LastModifiedTime"), flags, 2)
        this.vtbl.get_IsHidden := CallbackCreate(GetMethod(implObj, "get_IsHidden"), flags, 2)
        this.vtbl.put_IsHidden := CallbackCreate(GetMethod(implObj, "put_IsHidden"), flags, 2)
        this.vtbl.FileSystemName := CallbackCreate(GetMethod(implObj, "FileSystemName"), flags, 3)
        this.vtbl.FileSystemPath := CallbackCreate(GetMethod(implObj, "FileSystemPath"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_FullPath)
        CallbackFree(this.vtbl.get_CreationTime)
        CallbackFree(this.vtbl.put_CreationTime)
        CallbackFree(this.vtbl.get_LastAccessedTime)
        CallbackFree(this.vtbl.put_LastAccessedTime)
        CallbackFree(this.vtbl.get_LastModifiedTime)
        CallbackFree(this.vtbl.put_LastModifiedTime)
        CallbackFree(this.vtbl.get_IsHidden)
        CallbackFree(this.vtbl.put_IsHidden)
        CallbackFree(this.vtbl.FileSystemName)
        CallbackFree(this.vtbl.FileSystemPath)
    }
}
