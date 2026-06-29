#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFsiItem.ahk" { IFsiItem }

/**
 * Use this interface to identify the file size and data stream of the file contents.
 * @remarks
 * Data streams for files contained within the file system image are read-only.  File data can only be replaced by overwriting an existing file item.
 * 
 * This is an <b>FsiFileItem</b> object in script.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nn-imapi2fs-ifsifileitem
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IFsiFileItem extends IFsiItem {
    /**
     * The interface identifier for IFsiFileItem
     * @type {Guid}
     */
    static IID := Guid("{2c941fdb-975b-59be-a960-9a2a262853a5}")

    /**
     * The class identifier for FsiFileItem
     * @type {Guid}
     */
    static CLSID := Guid("{2c941fc7-975b-59be-a960-9a2a262853a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsiFileItem interfaces
    */
    struct Vtbl extends IFsiItem.Vtbl {
        get_DataSize          : IntPtr
        get_DataSize32BitLow  : IntPtr
        get_DataSize32BitHigh : IntPtr
        get_Data              : IntPtr
        put_Data              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsiFileItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    DataSize {
        get => this.get_DataSize()
    }

    /**
     * @type {Integer} 
     */
    DataSize32BitLow {
        get => this.get_DataSize32BitLow()
    }

    /**
     * @type {Integer} 
     */
    DataSize32BitHigh {
        get => this.get_DataSize32BitHigh()
    }

    /**
     * @type {IStream} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * Retrieves the number of bytes in the file.
     * @returns {Integer} Size, in bytes, of the file.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsifileitem-get_datasize
     */
    get_DataSize() {
        result := ComCall(19, this, "int64*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the least significant 32 bits of the IFsiFileItem::get_DataSize property.
     * @remarks
     * This property and <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsifileitem-get_datasize32bithigh">IFsiFileItem::get_DataSize32BitHigh</a> together  provide the size of the file as two 32-bit numbers for languages that do not support 64-bit values, such as VBScript and Visual Basic 6.
     * @returns {Integer} Least significant 32 bits of the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsifileitem-get_datasize">IFsiFileItem::get_DataSize</a> property.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsifileitem-get_datasize32bitlow
     */
    get_DataSize32BitLow() {
        result := ComCall(20, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the most significant 32 bits of the IFsiFileItem::get_DataSize property.
     * @remarks
     * This property and <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsifileitem-get_datasize32bitlow">IFsiFileItem::get_DataSize32BitLow</a> together  provide the size of the file as two 32-bit numbers for languages that do not support 64-bit values, such as VBScript and Visual Basic 6.
     * @returns {Integer} Most significant 32 bits of the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsifileitem-get_datasize">IFsiFileItem::get_DataSize</a> property.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsifileitem-get_datasize32bithigh
     */
    get_DataSize32BitHigh() {
        result := ComCall(21, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the data stream of the file's content.
     * @remarks
     * The contents of the file becomes read-only once the file item is added to file system image.
     * @returns {IStream} An <b>IStream</b> interface of the contents of the file.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsifileitem-get_data
     */
    get_Data() {
        result := ComCall(22, this, "ptr*", &pVal := 0, "HRESULT")
        return IStream(pVal)
    }

    /**
     * Sets the data stream of the file's content.
     * @remarks
     * The contents of the file becomes read-only once the file item is added to file system image.
     * @param {IStream} newVal An <b>IStream</b> interface of the content of the file to add to the file system image.
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
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsifileitem-put_data
     */
    put_Data(newVal) {
        result := ComCall(23, this, "ptr", newVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsiFileItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DataSize := CallbackCreate(GetMethod(implObj, "get_DataSize"), flags, 2)
        this.vtbl.get_DataSize32BitLow := CallbackCreate(GetMethod(implObj, "get_DataSize32BitLow"), flags, 2)
        this.vtbl.get_DataSize32BitHigh := CallbackCreate(GetMethod(implObj, "get_DataSize32BitHigh"), flags, 2)
        this.vtbl.get_Data := CallbackCreate(GetMethod(implObj, "get_Data"), flags, 2)
        this.vtbl.put_Data := CallbackCreate(GetMethod(implObj, "put_Data"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DataSize)
        CallbackFree(this.vtbl.get_DataSize32BitLow)
        CallbackFree(this.vtbl.get_DataSize32BitHigh)
        CallbackFree(this.vtbl.get_Data)
        CallbackFree(this.vtbl.put_Data)
    }
}
