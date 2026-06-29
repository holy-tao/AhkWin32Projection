#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLTableRowMetrics extends IDispatch {
    /**
     * The interface identifier for IHTMLTableRowMetrics
     * @type {Guid}
     */
    static IID := Guid("{3050f413-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLTableRowMetrics interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_clientHeight : IntPtr
        get_clientWidth  : IntPtr
        get_clientTop    : IntPtr
        get_clientLeft   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLTableRowMetrics.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    clientHeight {
        get => this.get_clientHeight()
    }

    /**
     * @type {Integer} 
     */
    clientWidth {
        get => this.get_clientWidth()
    }

    /**
     * @type {Integer} 
     */
    clientTop {
        get => this.get_clientTop()
    }

    /**
     * @type {Integer} 
     */
    clientLeft {
        get => this.get_clientLeft()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientHeight() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientWidth() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientTop() {
        result := ComCall(9, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientLeft() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLTableRowMetrics.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_clientHeight := CallbackCreate(GetMethod(implObj, "get_clientHeight"), flags, 2)
        this.vtbl.get_clientWidth := CallbackCreate(GetMethod(implObj, "get_clientWidth"), flags, 2)
        this.vtbl.get_clientTop := CallbackCreate(GetMethod(implObj, "get_clientTop"), flags, 2)
        this.vtbl.get_clientLeft := CallbackCreate(GetMethod(implObj, "get_clientLeft"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_clientHeight)
        CallbackFree(this.vtbl.get_clientWidth)
        CallbackFree(this.vtbl.get_clientTop)
        CallbackFree(this.vtbl.get_clientLeft)
    }
}
