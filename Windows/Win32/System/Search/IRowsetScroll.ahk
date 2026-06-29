#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRowsetLocate.ahk" { IRowsetLocate }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetScroll extends IRowsetLocate {
    /**
     * The interface identifier for IRowsetScroll
     * @type {Guid}
     */
    static IID := Guid("{0c733a7e-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetScroll interfaces
    */
    struct Vtbl extends IRowsetLocate.Vtbl {
        GetApproximatePosition : IntPtr
        GetRowsAtRatio         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetScroll.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cbBookmark 
     * @param {Pointer<Integer>} pBookmark 
     * @param {Pointer<Pointer>} pulPosition 
     * @param {Pointer<Pointer>} pcRows 
     * @returns {HRESULT} 
     */
    GetApproximatePosition(hReserved, cbBookmark, pBookmark, pulPosition, pcRows) {
        pBookmarkMarshal := pBookmark is VarRef ? "char*" : "ptr"
        pulPositionMarshal := pulPosition is VarRef ? "ptr*" : "ptr"
        pcRowsMarshal := pcRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, "ptr", hReserved, "ptr", cbBookmark, pBookmarkMarshal, pBookmark, pulPositionMarshal, pulPosition, pcRowsMarshal, pcRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hReserved1 
     * @param {Pointer} hReserved2 
     * @param {Pointer} ulNumerator 
     * @param {Pointer} ulDenominator 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} pcRowsObtained 
     * @param {Pointer<Pointer<Pointer>>} prghRows 
     * @returns {HRESULT} 
     */
    GetRowsAtRatio(hReserved1, hReserved2, ulNumerator, ulDenominator, cRows, pcRowsObtained, prghRows) {
        pcRowsObtainedMarshal := pcRowsObtained is VarRef ? "ptr*" : "ptr"
        prghRowsMarshal := prghRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "ptr", hReserved1, "ptr", hReserved2, "ptr", ulNumerator, "ptr", ulDenominator, "ptr", cRows, pcRowsObtainedMarshal, pcRowsObtained, prghRowsMarshal, prghRows, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowsetScroll.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetApproximatePosition := CallbackCreate(GetMethod(implObj, "GetApproximatePosition"), flags, 6)
        this.vtbl.GetRowsAtRatio := CallbackCreate(GetMethod(implObj, "GetRowsAtRatio"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetApproximatePosition)
        CallbackFree(this.vtbl.GetRowsAtRatio)
    }
}
