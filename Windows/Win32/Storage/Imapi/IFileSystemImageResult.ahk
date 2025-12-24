#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk
#Include .\IProgressItems.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to get information about the burn image, the image data stream, and progress information.
 * @remarks
 * 
 * This is an <b>FileSystemImageResult</b> object in script.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-ifilesystemimageresult
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IFileSystemImageResult extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSystemImageResult
     * @type {Guid}
     */
    static IID => Guid("{2c941fd8-975b-59be-a960-9a2a262853a5}")

    /**
     * The class identifier for FileSystemImageResult
     * @type {Guid}
     */
    static CLSID => Guid("{2c941fcc-975b-59be-a960-9a2a262853a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ImageStream", "get_ProgressItems", "get_TotalBlocks", "get_BlockSize", "get_DiscId"]

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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_imagestream
     */
    get_ImageStream() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IStream(pVal)
    }

    /**
     * Retrieves the progress item block mapping collection.
     * @returns {IProgressItems} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-iprogressitems">IProgressItems</a> interface that contains a collection of progress items. Each progress item identifies the blocks written since the previous progress status was taken.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_progressitems
     */
    get_ProgressItems() {
        result := ComCall(8, this, "ptr*", &pVal := 0, "HRESULT")
        return IProgressItems(pVal)
    }

    /**
     * Retrieves the number of blocks in the result image.
     * @returns {Integer} Number of blocks to burn on the disc.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_totalblocks
     */
    get_TotalBlocks() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the size, in bytes, of a block of data.
     * @returns {Integer} Number of bytes in a block.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_blocksize
     */
    get_BlockSize() {
        result := ComCall(10, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the disc volume name for this file system image.
     * @returns {BSTR} String that contains the volume name for this file system image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_discid
     */
    get_DiscId() {
        pVal := BSTR()
        result := ComCall(11, this, "ptr", pVal, "HRESULT")
        return pVal
    }
}
