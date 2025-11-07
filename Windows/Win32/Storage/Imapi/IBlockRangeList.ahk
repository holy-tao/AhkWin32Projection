#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to retrieve a list of continuous sector ranges on the media. This interface is used to describe the sectors that need to be updated on a rewritable disc when a new logical session is recorded.
 * @remarks
 * 
 * <b>IBlockRangeList</b> is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimageresult2-get_modifiedblocks">IFileSystemImageResult2::ModifiedBlocks</a> method. Alternatively, IUnknown::QueryInterface can be called on the object returned by <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_imagestream">IFileSystemImageResult::get_ImageStream</a> to get the list of modified sectors in the result image represented by that object.
 * 
 * The order of sector ranges in <b>IBlockRangeList</b> is taken into account during burning. The sector ranges having lower indexes in the safe array returned by <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iblockrangelist-get_blockranges">IBlockRangeList::get_BlockRanges</a> are written before those with higher indexes.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-iblockrangelist
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IBlockRangeList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBlockRangeList
     * @type {Guid}
     */
    static IID => Guid("{b507ca26-2204-11dd-966a-001aa01bbc58}")

    /**
     * The class identifier for BlockRangeList
     * @type {Guid}
     */
    static CLSID => Guid("{b507ca28-2204-11dd-966a-001aa01bbc58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BlockRanges"]

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iblockrangelist-get_blockranges
     */
    get_BlockRanges() {
        result := ComCall(7, this, "ptr*", &value := 0, "HRESULT")
        return value
    }
}
