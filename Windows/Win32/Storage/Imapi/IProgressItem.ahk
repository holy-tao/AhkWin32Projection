#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Description", "get_FirstBlock", "get_LastBlock", "get_BlockCount"]

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {Integer} 
     */
    FirstBlock {
        get => this.get_FirstBlock()
    }

    /**
     * @type {Integer} 
     */
    LastBlock {
        get => this.get_LastBlock()
    }

    /**
     * @type {Integer} 
     */
    BlockCount {
        get => this.get_BlockCount()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iprogressitem-get_description
     */
    get_Description() {
        desc := BSTR()
        result := ComCall(7, this, "ptr", desc, "HRESULT")
        return desc
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iprogressitem-get_firstblock
     */
    get_FirstBlock() {
        result := ComCall(8, this, "uint*", &block := 0, "HRESULT")
        return block
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iprogressitem-get_lastblock
     */
    get_LastBlock() {
        result := ComCall(9, this, "uint*", &block := 0, "HRESULT")
        return block
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iprogressitem-get_blockcount
     */
    get_BlockCount() {
        result := ComCall(10, this, "uint*", &blocks := 0, "HRESULT")
        return blocks
    }
}
