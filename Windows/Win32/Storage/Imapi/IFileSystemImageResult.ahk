#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IStream>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_imagestream
     */
    get_ImageStream(pVal) {
        result := ComCall(7, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IProgressItems>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_progressitems
     */
    get_ProgressItems(pVal) {
        result := ComCall(8, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_totalblocks
     */
    get_TotalBlocks(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_blocksize
     */
    get_BlockSize(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_discid
     */
    get_DiscId(pVal) {
        result := ComCall(11, this, "ptr", pVal, "HRESULT")
        return result
    }
}
