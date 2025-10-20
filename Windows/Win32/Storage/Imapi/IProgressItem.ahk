#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to retrieve block information for one segment of the result file image.
 * @remarks
 * 
  * This is a <b>ProgressItem</b> object in script.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-iprogressitem
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IProgressItem extends IDispatch{
    /**
     * The interface identifier for IProgressItem
     * @type {Guid}
     */
    static IID => Guid("{2c941fd5-975b-59be-a960-9a2a262853a5}")

    /**
     * The class identifier for ProgressItem
     * @type {Guid}
     */
    static CLSID => Guid("{2c941fcb-975b-59be-a960-9a2a262853a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} desc 
     * @returns {HRESULT} 
     */
    get_Description(desc) {
        result := ComCall(7, this, "ptr", desc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} block 
     * @returns {HRESULT} 
     */
    get_FirstBlock(block) {
        result := ComCall(8, this, "uint*", block, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} block 
     * @returns {HRESULT} 
     */
    get_LastBlock(block) {
        result := ComCall(9, this, "uint*", block, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} blocks 
     * @returns {HRESULT} 
     */
    get_BlockCount(blocks) {
        result := ComCall(10, this, "uint*", blocks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
