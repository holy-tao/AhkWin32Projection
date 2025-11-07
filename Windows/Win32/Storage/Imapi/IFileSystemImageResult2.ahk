#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBlockRangeList.ahk
#Include .\IFileSystemImageResult.ahk

/**
 * The IFileSystemImageResult2 interface allows the data recorder object to retrieve information about modified blocks in images created for rewritable discs.
 * @remarks
 * 
 * When the file system image object is used to append data to a rewritable disc, the result image contains both the previous logical session and the new additions. The result image represents the binary data that must be recorded to disc starting from sector 0 to get a disc containing both old and new files. However, the previous logical session remains mostly intact during addition of new files, so the burn time can be substantially optimized by recording only the sectors that are new or have been modified.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-ifilesystemimageresult2
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IFileSystemImageResult2 extends IFileSystemImageResult{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSystemImageResult2
     * @type {Guid}
     */
    static IID => Guid("{b507ca29-2204-11dd-966a-001aa01bbc58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ModifiedBlocks"]

    /**
     * 
     * @returns {IBlockRangeList} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimageresult2-get_modifiedblocks
     */
    get_ModifiedBlocks() {
        result := ComCall(12, this, "ptr*", &pVal := 0, "HRESULT")
        return IBlockRangeList(pVal)
    }
}
