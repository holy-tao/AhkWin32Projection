#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRowset.ahk" { IRowset }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetLocate extends IRowset {
    /**
     * The interface identifier for IRowsetLocate
     * @type {Guid}
     */
    static IID := Guid("{0c733a7d-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetLocate interfaces
    */
    struct Vtbl extends IRowset.Vtbl {
        Compare           : IntPtr
        GetRowsAt         : IntPtr
        GetRowsByBookmark : IntPtr
        Hash              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetLocate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cbBookmark1 
     * @param {Pointer<Integer>} pBookmark1 
     * @param {Pointer} cbBookmark2 
     * @param {Pointer<Integer>} pBookmark2 
     * @returns {Integer} 
     */
    Compare(hReserved, cbBookmark1, pBookmark1, cbBookmark2, pBookmark2) {
        pBookmark1Marshal := pBookmark1 is VarRef ? "char*" : "ptr"
        pBookmark2Marshal := pBookmark2 is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "ptr", hReserved, "ptr", cbBookmark1, pBookmark1Marshal, pBookmark1, "ptr", cbBookmark2, pBookmark2Marshal, pBookmark2, "uint*", &pComparison := 0, "HRESULT")
        return pComparison
    }

    /**
     * 
     * @param {Pointer} hReserved1 
     * @param {Pointer} hReserved2 
     * @param {Pointer} cbBookmark 
     * @param {Pointer<Integer>} pBookmark 
     * @param {Pointer} lRowsOffset 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} pcRowsObtained 
     * @param {Pointer<Pointer<Pointer>>} prghRows 
     * @returns {HRESULT} 
     */
    GetRowsAt(hReserved1, hReserved2, cbBookmark, pBookmark, lRowsOffset, cRows, pcRowsObtained, prghRows) {
        pBookmarkMarshal := pBookmark is VarRef ? "char*" : "ptr"
        pcRowsObtainedMarshal := pcRowsObtained is VarRef ? "ptr*" : "ptr"
        prghRowsMarshal := prghRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", hReserved1, "ptr", hReserved2, "ptr", cbBookmark, pBookmarkMarshal, pBookmark, "ptr", lRowsOffset, "ptr", cRows, pcRowsObtainedMarshal, pcRowsObtained, prghRowsMarshal, prghRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rgcbBookmarks 
     * @param {Pointer<Pointer<Integer>>} rgpBookmarks 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Pointer<Integer>} rgRowStatus 
     * @returns {HRESULT} 
     */
    GetRowsByBookmark(hReserved, cRows, rgcbBookmarks, rgpBookmarks, rghRows, rgRowStatus) {
        rgcbBookmarksMarshal := rgcbBookmarks is VarRef ? "ptr*" : "ptr"
        rgpBookmarksMarshal := rgpBookmarks is VarRef ? "ptr*" : "ptr"
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"
        rgRowStatusMarshal := rgRowStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", hReserved, "ptr", cRows, rgcbBookmarksMarshal, rgcbBookmarks, rgpBookmarksMarshal, rgpBookmarks, rghRowsMarshal, rghRows, rgRowStatusMarshal, rgRowStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cBookmarks 
     * @param {Pointer<Pointer>} rgcbBookmarks 
     * @param {Pointer<Pointer<Integer>>} rgpBookmarks 
     * @param {Pointer<Pointer>} rgHashedValues 
     * @param {Pointer<Integer>} rgBookmarkStatus 
     * @returns {HRESULT} 
     */
    Hash(hReserved, cBookmarks, rgcbBookmarks, rgpBookmarks, rgHashedValues, rgBookmarkStatus) {
        rgcbBookmarksMarshal := rgcbBookmarks is VarRef ? "ptr*" : "ptr"
        rgpBookmarksMarshal := rgpBookmarks is VarRef ? "ptr*" : "ptr"
        rgHashedValuesMarshal := rgHashedValues is VarRef ? "ptr*" : "ptr"
        rgBookmarkStatusMarshal := rgBookmarkStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", hReserved, "ptr", cBookmarks, rgcbBookmarksMarshal, rgcbBookmarks, rgpBookmarksMarshal, rgpBookmarks, rgHashedValuesMarshal, rgHashedValues, rgBookmarkStatusMarshal, rgBookmarkStatus, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowsetLocate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Compare := CallbackCreate(GetMethod(implObj, "Compare"), flags, 7)
        this.vtbl.GetRowsAt := CallbackCreate(GetMethod(implObj, "GetRowsAt"), flags, 9)
        this.vtbl.GetRowsByBookmark := CallbackCreate(GetMethod(implObj, "GetRowsByBookmark"), flags, 7)
        this.vtbl.Hash := CallbackCreate(GetMethod(implObj, "Hash"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Compare)
        CallbackFree(this.vtbl.GetRowsAt)
        CallbackFree(this.vtbl.GetRowsByBookmark)
        CallbackFree(this.vtbl.Hash)
    }
}
