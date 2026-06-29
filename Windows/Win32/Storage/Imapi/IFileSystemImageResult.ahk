#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IProgressItems.ahk" { IProgressItems }

/**
 * Use this interface to get information about the burn image, the image data stream, and progress information.
 * @remarks
 * This is an <b>FileSystemImageResult</b> object in script.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nn-imapi2fs-ifilesystemimageresult
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IFileSystemImageResult extends IDispatch {
    /**
     * The interface identifier for IFileSystemImageResult
     * @type {Guid}
     */
    static IID := Guid("{2c941fd8-975b-59be-a960-9a2a262853a5}")

    /**
     * The class identifier for FileSystemImageResult
     * @type {Guid}
     */
    static CLSID := Guid("{2c941fcc-975b-59be-a960-9a2a262853a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFileSystemImageResult interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ImageStream   : IntPtr
        get_ProgressItems : IntPtr
        get_TotalBlocks   : IntPtr
        get_BlockSize     : IntPtr
        get_DiscId        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFileSystemImageResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IStream} 
     */
    ImageStream {
        get => this.get_ImageStream()
    }

    /**
     * @type {IProgressItems} 
     */
    ProgressItems {
        get => this.get_ProgressItems()
    }

    /**
     * @type {Integer} 
     */
    TotalBlocks {
        get => this.get_TotalBlocks()
    }

    /**
     * @type {Integer} 
     */
    BlockSize {
        get => this.get_BlockSize()
    }

    /**
     * @type {BSTR} 
     */
    DiscId {
        get => this.get_DiscId()
    }

    /**
     * Retrieves the burn image stream.
     * @returns {IStream} An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface of the burn image.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_imagestream
     */
    get_ImageStream() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IStream(pVal)
    }

    /**
     * Retrieves the progress item block mapping collection.
     * @returns {IProgressItems} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-iprogressitems">IProgressItems</a> interface that contains a collection of progress items. Each progress item identifies the blocks written since the previous progress status was taken.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_progressitems
     */
    get_ProgressItems() {
        result := ComCall(8, this, "ptr*", &pVal := 0, "HRESULT")
        return IProgressItems(pVal)
    }

    /**
     * Retrieves the number of blocks in the result image.
     * @returns {Integer} Number of blocks to burn on the disc.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_totalblocks
     */
    get_TotalBlocks() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the size, in bytes, of a block of data.
     * @returns {Integer} Number of bytes in a block.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_blocksize
     */
    get_BlockSize() {
        result := ComCall(10, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the disc volume name for this file system image.
     * @returns {BSTR} String that contains the volume name for this file system image.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_discid
     */
    get_DiscId() {
        pVal := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    Query(iid) {
        if (IFileSystemImageResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ImageStream := CallbackCreate(GetMethod(implObj, "get_ImageStream"), flags, 2)
        this.vtbl.get_ProgressItems := CallbackCreate(GetMethod(implObj, "get_ProgressItems"), flags, 2)
        this.vtbl.get_TotalBlocks := CallbackCreate(GetMethod(implObj, "get_TotalBlocks"), flags, 2)
        this.vtbl.get_BlockSize := CallbackCreate(GetMethod(implObj, "get_BlockSize"), flags, 2)
        this.vtbl.get_DiscId := CallbackCreate(GetMethod(implObj, "get_DiscId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ImageStream)
        CallbackFree(this.vtbl.get_ProgressItems)
        CallbackFree(this.vtbl.get_TotalBlocks)
        CallbackFree(this.vtbl.get_BlockSize)
        CallbackFree(this.vtbl.get_DiscId)
    }
}
