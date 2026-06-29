#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HACCESSOR.ahk" { HACCESSOR }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetFind extends IUnknown {
    /**
     * The interface identifier for IRowsetFind
     * @type {Guid}
     */
    static IID := Guid("{0c733a9d-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetFind interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindNextRow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetFind.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {HACCESSOR} _hAccessor 
     * @param {Pointer<Void>} pFindValue 
     * @param {Integer} CompareOp 
     * @param {Pointer} cbBookmark 
     * @param {Pointer<Integer>} pBookmark 
     * @param {Pointer} lRowsOffset 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} pcRowsObtained 
     * @returns {Pointer<Pointer>} 
     */
    FindNextRow(hChapter, _hAccessor, pFindValue, CompareOp, cbBookmark, pBookmark, lRowsOffset, cRows, pcRowsObtained) {
        pFindValueMarshal := pFindValue is VarRef ? "ptr" : "ptr"
        pBookmarkMarshal := pBookmark is VarRef ? "char*" : "ptr"
        pcRowsObtainedMarshal := pcRowsObtained is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hChapter, HACCESSOR, _hAccessor, pFindValueMarshal, pFindValue, "uint", CompareOp, "ptr", cbBookmark, pBookmarkMarshal, pBookmark, "ptr", lRowsOffset, "ptr", cRows, pcRowsObtainedMarshal, pcRowsObtained, "ptr*", &prghRows := 0, "HRESULT")
        return prghRows
    }

    Query(iid) {
        if (IRowsetFind.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindNextRow := CallbackCreate(GetMethod(implObj, "FindNextRow"), flags, 11)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindNextRow)
    }
}
