#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRowsetScroll.ahk" { IRowsetScroll }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetExactScroll extends IRowsetScroll {
    /**
     * The interface identifier for IRowsetExactScroll
     * @type {Guid}
     */
    static IID := Guid("{0c733a7f-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetExactScroll interfaces
    */
    struct Vtbl extends IRowsetScroll.Vtbl {
        GetExactPosition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetExactScroll.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Pointer} cbBookmark 
     * @param {Pointer<Integer>} pBookmark 
     * @param {Pointer<Pointer>} pulPosition 
     * @param {Pointer<Pointer>} pcRows 
     * @returns {HRESULT} 
     */
    GetExactPosition(hChapter, cbBookmark, pBookmark, pulPosition, pcRows) {
        pBookmarkMarshal := pBookmark is VarRef ? "char*" : "ptr"
        pulPositionMarshal := pulPosition is VarRef ? "ptr*" : "ptr"
        pcRowsMarshal := pcRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, "ptr", hChapter, "ptr", cbBookmark, pBookmarkMarshal, pBookmark, pulPositionMarshal, pulPosition, pcRowsMarshal, pcRows, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowsetExactScroll.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetExactPosition := CallbackCreate(GetMethod(implObj, "GetExactPosition"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetExactPosition)
    }
}
