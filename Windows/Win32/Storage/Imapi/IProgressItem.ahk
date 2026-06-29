#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Use this interface to retrieve block information for one segment of the result file image.
 * @remarks
 * This is a <b>ProgressItem</b> object in script.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nn-imapi2fs-iprogressitem
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IProgressItem extends IDispatch {
    /**
     * The interface identifier for IProgressItem
     * @type {Guid}
     */
    static IID := Guid("{2c941fd5-975b-59be-a960-9a2a262853a5}")

    /**
     * The class identifier for ProgressItem
     * @type {Guid}
     */
    static CLSID := Guid("{2c941fcb-975b-59be-a960-9a2a262853a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProgressItem interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Description : IntPtr
        get_FirstBlock  : IntPtr
        get_LastBlock   : IntPtr
        get_BlockCount  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProgressItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Retrieves the description in the progress item.
     * @returns {BSTR} String containing the description. The description contains the name of the file in the file system image.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iprogressitem-get_description
     */
    get_Description() {
        desc := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, desc, "HRESULT")
        return desc
    }

    /**
     * Retrieves the first block number in this segment of the result image.
     * @returns {Integer} First block number of this segment.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iprogressitem-get_firstblock
     */
    get_FirstBlock() {
        result := ComCall(8, this, "uint*", &block := 0, "HRESULT")
        return block
    }

    /**
     * Retrieves the last block in this segment of the result image.
     * @returns {Integer} Number of the last block of this segment.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iprogressitem-get_lastblock
     */
    get_LastBlock() {
        result := ComCall(9, this, "uint*", &block := 0, "HRESULT")
        return block
    }

    /**
     * Retrieves the number of blocks in the progress item.
     * @returns {Integer} Number of blocks in the segment.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-iprogressitem-get_blockcount
     */
    get_BlockCount() {
        result := ComCall(10, this, "uint*", &blocks := 0, "HRESULT")
        return blocks
    }

    Query(iid) {
        if (IProgressItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.get_FirstBlock := CallbackCreate(GetMethod(implObj, "get_FirstBlock"), flags, 2)
        this.vtbl.get_LastBlock := CallbackCreate(GetMethod(implObj, "get_LastBlock"), flags, 2)
        this.vtbl.get_BlockCount := CallbackCreate(GetMethod(implObj, "get_BlockCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.get_FirstBlock)
        CallbackFree(this.vtbl.get_LastBlock)
        CallbackFree(this.vtbl.get_BlockCount)
    }
}
