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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsifileitem-get_datasize
     */
    get_DataSize() {
        result := ComCall(19, this, "int64*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsifileitem-get_datasize32bitlow
     */
    get_DataSize32BitLow() {
        result := ComCall(20, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsifileitem-get_datasize32bithigh
     */
    get_DataSize32BitHigh() {
        result := ComCall(21, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsifileitem-get_data
     */
    get_Data() {
        result := ComCall(22, this, "ptr*", &pVal := 0, "HRESULT")
        return IStream(pVal)
    }

    /**
     * 
     * @param {IStream} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsifileitem-put_data
     */
    put_Data(newVal) {
        result := ComCall(23, this, "ptr", newVal, "HRESULT")
        return result
    }
}
