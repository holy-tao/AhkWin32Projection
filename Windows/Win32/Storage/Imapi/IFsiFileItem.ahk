#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk
#Include .\IFsiItem.ahk

/**
 * Use this interface to identify the file size and data stream of the file contents.
 * @remarks
 * 
 * Data streams for files contained within the file system image are read-only.  File data can only be replaced by overwriting an existing file item.
 * 
 * This is an <b>FsiFileItem</b> object in script.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-ifsifileitem
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IFsiFileItem extends IFsiItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsiFileItem
     * @type {Guid}
     */
    static IID => Guid("{2c941fdb-975b-59be-a960-9a2a262853a5}")

    /**
     * The class identifier for FsiFileItem
     * @type {Guid}
     */
    static CLSID => Guid("{2c941fc7-975b-59be-a960-9a2a262853a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DataSize", "get_DataSize32BitLow", "get_DataSize32BitHigh", "get_Data", "put_Data"]

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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsifileitem-get_datasize
     */
    get_DataSize() {
        result := ComCall(19, this, "int64*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the least significant 32 bits of the IFsiFileItem::get_DataSize property.
     * @returns {Integer} Least significant 32 bits of the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsifileitem-get_datasize">IFsiFileItem::get_DataSize</a> property.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsifileitem-get_datasize32bitlow
     */
    get_DataSize32BitLow() {
        result := ComCall(20, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the most significant 32 bits of the IFsiFileItem::get_DataSize property.
     * @returns {Integer} Most significant 32 bits of the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsifileitem-get_datasize">IFsiFileItem::get_DataSize</a> property.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsifileitem-get_datasize32bithigh
     */
    get_DataSize32BitHigh() {
        result := ComCall(21, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the data stream of the file's content.
     * @returns {IStream} An <b>IStream</b> interface of the contents of the file.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsifileitem-get_data
     */
    get_Data() {
        result := ComCall(22, this, "ptr*", &pVal := 0, "HRESULT")
        return IStream(pVal)
    }

    /**
     * Sets the data stream of the file's content.
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsifileitem-put_data
     */
    put_Data(newVal) {
        result := ComCall(23, this, "ptr", newVal, "HRESULT")
        return result
    }
}
