#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLTextContainer extends IDispatch {
    /**
     * The interface identifier for IHTMLTextContainer
     * @type {Guid}
     */
    static IID := Guid("{3050f230-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLTextContainer interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        createControlRange : IntPtr
        get_scrollHeight   : IntPtr
        get_scrollWidth    : IntPtr
        put_scrollTop      : IntPtr
        get_scrollTop      : IntPtr
        put_scrollLeft     : IntPtr
        get_scrollLeft     : IntPtr
        put_onscroll       : IntPtr
        get_onscroll       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLTextContainer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    scrollHeight {
        get => this.get_scrollHeight()
    }

    /**
     * @type {Integer} 
     */
    scrollWidth {
        get => this.get_scrollWidth()
    }

    /**
     * @type {Integer} 
     */
    scrollTop {
        get => this.get_scrollTop()
        set => this.put_scrollTop(value)
    }

    /**
     * @type {Integer} 
     */
    scrollLeft {
        get => this.get_scrollLeft()
        set => this.put_scrollLeft(value)
    }

    /**
     * @type {VARIANT} 
     */
    onscroll {
        get => this.get_onscroll()
        set => this.put_onscroll(value)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    createControlRange() {
        result := ComCall(7, this, "ptr*", &range := 0, "HRESULT")
        return IDispatch(range)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_scrollHeight() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_scrollWidth() {
        result := ComCall(9, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_scrollTop(v) {
        result := ComCall(10, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_scrollTop() {
        result := ComCall(11, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_scrollLeft(v) {
        result := ComCall(12, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_scrollLeft() {
        result := ComCall(13, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onscroll(v) {
        result := ComCall(14, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onscroll() {
        p := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLTextContainer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.createControlRange := CallbackCreate(GetMethod(implObj, "createControlRange"), flags, 2)
        this.vtbl.get_scrollHeight := CallbackCreate(GetMethod(implObj, "get_scrollHeight"), flags, 2)
        this.vtbl.get_scrollWidth := CallbackCreate(GetMethod(implObj, "get_scrollWidth"), flags, 2)
        this.vtbl.put_scrollTop := CallbackCreate(GetMethod(implObj, "put_scrollTop"), flags, 2)
        this.vtbl.get_scrollTop := CallbackCreate(GetMethod(implObj, "get_scrollTop"), flags, 2)
        this.vtbl.put_scrollLeft := CallbackCreate(GetMethod(implObj, "put_scrollLeft"), flags, 2)
        this.vtbl.get_scrollLeft := CallbackCreate(GetMethod(implObj, "get_scrollLeft"), flags, 2)
        this.vtbl.put_onscroll := CallbackCreate(GetMethod(implObj, "put_onscroll"), flags, 2)
        this.vtbl.get_onscroll := CallbackCreate(GetMethod(implObj, "get_onscroll"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.createControlRange)
        CallbackFree(this.vtbl.get_scrollHeight)
        CallbackFree(this.vtbl.get_scrollWidth)
        CallbackFree(this.vtbl.put_scrollTop)
        CallbackFree(this.vtbl.get_scrollTop)
        CallbackFree(this.vtbl.put_scrollLeft)
        CallbackFree(this.vtbl.get_scrollLeft)
        CallbackFree(this.vtbl.put_onscroll)
        CallbackFree(this.vtbl.get_onscroll)
    }
}
