#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Int64>} pVal 
     * @returns {HRESULT} 
     */
    get_DataSize(pVal) {
        result := ComCall(19, this, "int64*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_DataSize32BitLow(pVal) {
        result := ComCall(20, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_DataSize32BitHigh(pVal) {
        result := ComCall(21, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pVal 
     * @returns {HRESULT} 
     */
    get_Data(pVal) {
        result := ComCall(22, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} newVal 
     * @returns {HRESULT} 
     */
    put_Data(newVal) {
        result := ComCall(23, this, "ptr", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
