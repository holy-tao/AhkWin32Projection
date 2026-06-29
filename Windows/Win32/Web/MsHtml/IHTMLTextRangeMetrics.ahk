#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLTextRangeMetrics extends IDispatch {
    /**
     * The interface identifier for IHTMLTextRangeMetrics
     * @type {Guid}
     */
    static IID := Guid("{3050f40b-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLTextRangeMetrics interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_offsetTop      : IntPtr
        get_offsetLeft     : IntPtr
        get_boundingTop    : IntPtr
        get_boundingLeft   : IntPtr
        get_boundingWidth  : IntPtr
        get_boundingHeight : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLTextRangeMetrics.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    offsetTop {
        get => this.get_offsetTop()
    }

    /**
     * @type {Integer} 
     */
    offsetLeft {
        get => this.get_offsetLeft()
    }

    /**
     * @type {Integer} 
     */
    boundingTop {
        get => this.get_boundingTop()
    }

    /**
     * @type {Integer} 
     */
    boundingLeft {
        get => this.get_boundingLeft()
    }

    /**
     * @type {Integer} 
     */
    boundingWidth {
        get => this.get_boundingWidth()
    }

    /**
     * @type {Integer} 
     */
    boundingHeight {
        get => this.get_boundingHeight()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_offsetTop() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_offsetLeft() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_boundingTop() {
        result := ComCall(9, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_boundingLeft() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_boundingWidth() {
        result := ComCall(11, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_boundingHeight() {
        result := ComCall(12, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLTextRangeMetrics.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_offsetTop := CallbackCreate(GetMethod(implObj, "get_offsetTop"), flags, 2)
        this.vtbl.get_offsetLeft := CallbackCreate(GetMethod(implObj, "get_offsetLeft"), flags, 2)
        this.vtbl.get_boundingTop := CallbackCreate(GetMethod(implObj, "get_boundingTop"), flags, 2)
        this.vtbl.get_boundingLeft := CallbackCreate(GetMethod(implObj, "get_boundingLeft"), flags, 2)
        this.vtbl.get_boundingWidth := CallbackCreate(GetMethod(implObj, "get_boundingWidth"), flags, 2)
        this.vtbl.get_boundingHeight := CallbackCreate(GetMethod(implObj, "get_boundingHeight"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_offsetTop)
        CallbackFree(this.vtbl.get_offsetLeft)
        CallbackFree(this.vtbl.get_boundingTop)
        CallbackFree(this.vtbl.get_boundingLeft)
        CallbackFree(this.vtbl.get_boundingWidth)
        CallbackFree(this.vtbl.get_boundingHeight)
    }
}
