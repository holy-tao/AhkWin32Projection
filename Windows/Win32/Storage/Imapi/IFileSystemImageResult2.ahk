#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IBlockRangeList.ahk" { IBlockRangeList }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFileSystemImageResult.ahk" { IFileSystemImageResult }

/**
 * The IFileSystemImageResult2 interface allows the data recorder object to retrieve information about modified blocks in images created for rewritable discs.
 * @remarks
 * When the file system image object is used to append data to a rewritable disc, the result image contains both the previous logical session and the new additions. The result image represents the binary data that must be recorded to disc starting from sector 0 to get a disc containing both old and new files. However, the previous logical session remains mostly intact during addition of new files, so the burn time can be substantially optimized by recording only the sectors that are new or have been modified.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nn-imapi2fs-ifilesystemimageresult2
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IFileSystemImageResult2 extends IFileSystemImageResult {
    /**
     * The interface identifier for IFileSystemImageResult2
     * @type {Guid}
     */
    static IID := Guid("{b507ca29-2204-11dd-966a-001aa01bbc58}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFileSystemImageResult2 interfaces
    */
    struct Vtbl extends IFileSystemImageResult.Vtbl {
        get_ModifiedBlocks : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFileSystemImageResult2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IBlockRangeList} 
     */
    ModifiedBlocks {
        get => this.get_ModifiedBlocks()
    }

    /**
     * Retrieves the list of modified blocks in the result image.
     * @remarks
     * This method returns <b>E_NOTIMPL</b> if the entire result image must be recorded. If this method returns a successful return code, it is sufficient to record only the sectors described by <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-iblockrangelist">IBlockRangeList</a> returned in <i>pVal</i>. It is highly recommended to record the sector ranges in exactly the same order as they are listed in <b>IBlockRangeList</b>.
     * @returns {IBlockRangeList} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-iblockrangelist">IBlockRangeList</a> interface representing the modified block ranges in the result image.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimageresult2-get_modifiedblocks
     */
    get_ModifiedBlocks() {
        result := ComCall(12, this, "ptr*", &pVal := 0, "HRESULT")
        return IBlockRangeList(pVal)
    }

    Query(iid) {
        if (IFileSystemImageResult2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ModifiedBlocks := CallbackCreate(GetMethod(implObj, "get_ModifiedBlocks"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ModifiedBlocks)
    }
}
