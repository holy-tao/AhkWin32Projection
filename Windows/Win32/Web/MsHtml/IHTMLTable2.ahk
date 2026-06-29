#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLElementCollection.ahk" { IHTMLElementCollection }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLTable2 extends IDispatch {
    /**
     * The interface identifier for IHTMLTable2
     * @type {Guid}
     */
    static IID := Guid("{3050f4ad-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLTable2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        firstPage : IntPtr
        lastPage  : IntPtr
        get_cells : IntPtr
        moveRow   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLTable2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    cells {
        get => this.get_cells()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    firstPage() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    lastPage() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_cells() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @param {Integer} indexFrom 
     * @param {Integer} indexTo 
     * @returns {IDispatch} 
     */
    moveRow(indexFrom, indexTo) {
        result := ComCall(10, this, "int", indexFrom, "int", indexTo, "ptr*", &row := 0, "HRESULT")
        return IDispatch(row)
    }

    Query(iid) {
        if (IHTMLTable2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.firstPage := CallbackCreate(GetMethod(implObj, "firstPage"), flags, 1)
        this.vtbl.lastPage := CallbackCreate(GetMethod(implObj, "lastPage"), flags, 1)
        this.vtbl.get_cells := CallbackCreate(GetMethod(implObj, "get_cells"), flags, 2)
        this.vtbl.moveRow := CallbackCreate(GetMethod(implObj, "moveRow"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.firstPage)
        CallbackFree(this.vtbl.lastPage)
        CallbackFree(this.vtbl.get_cells)
        CallbackFree(this.vtbl.moveRow)
    }
}
