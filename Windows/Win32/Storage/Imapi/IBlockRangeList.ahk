#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Use this interface to retrieve a list of continuous sector ranges on the media. This interface is used to describe the sectors that need to be updated on a rewritable disc when a new logical session is recorded.
 * @remarks
 * <b>IBlockRangeList</b> is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimageresult2-get_modifiedblocks">IFileSystemImageResult2::ModifiedBlocks</a> method. Alternatively, IUnknown::QueryInterface can be called on the object returned by <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifilesystemimageresult-get_imagestream">IFileSystemImageResult::get_ImageStream</a> to get the list of modified sectors in the result image represented by that object.
 * 
 * The order of sector ranges in <b>IBlockRangeList</b> is taken into account during burning. The sector ranges having lower indexes in the safe array returned by <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iblockrangelist-get_blockranges">IBlockRangeList::get_BlockRanges</a> are written before those with higher indexes.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-iblockrangelist
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IBlockRangeList extends IDispatch {
    /**
     * The interface identifier for IBlockRangeList
     * @type {Guid}
     */
    static IID := Guid("{b507ca26-2204-11dd-966a-001aa01bbc58}")

    /**
     * The class identifier for BlockRangeList
     * @type {Guid}
     */
    static CLSID := Guid("{b507ca28-2204-11dd-966a-001aa01bbc58}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBlockRangeList interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_BlockRanges : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBlockRangeList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    BlockRanges {
        get => this.get_BlockRanges()
    }

    /**
     * Returns the list of sector ranges in the form of a safe array of variants of type VT_Dispatch.
     * @remarks
     * The order of sector ranges in <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-iblockrangelist">IBlockRangeList</a> is taken into account during burning. The sector ranges having lower indexes in the safe array returned by <b>IBlockRangeList::get_BlockRanges</b> are written before those with higher indexes.
     * @returns {Pointer<SAFEARRAY>} List of sector ranges. Each element of the list is a VARIANT of type VT_Dispatch. Query the pdispVal member of the variant for the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-iblockrange">IBlockRange</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iblockrangelist-get_blockranges
     */
    get_BlockRanges() {
        result := ComCall(7, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IBlockRangeList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_BlockRanges := CallbackCreate(GetMethod(implObj, "get_BlockRanges"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_BlockRanges)
    }
}
