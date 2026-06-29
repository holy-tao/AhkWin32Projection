#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGSVGElement.ahk" { ISVGSVGElement }
#Import ".\ISVGAnimatedEnumeration.ahk" { ISVGAnimatedEnumeration }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGElement extends IDispatch {
    /**
     * The interface identifier for ISVGElement
     * @type {Guid}
     */
    static IID := Guid("{305104c5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGElement
     * @type {Guid}
     */
    static CLSID := Guid("{30510564-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_xmlbase            : IntPtr
        get_xmlbase            : IntPtr
        putref_ownerSVGElement : IntPtr
        get_ownerSVGElement    : IntPtr
        putref_viewportElement : IntPtr
        get_viewportElement    : IntPtr
        putref_focusable       : IntPtr
        get_focusable          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    xmlbase {
        get => this.get_xmlbase()
        set => this.put_xmlbase(value)
    }

    /**
     * @type {ISVGSVGElement} 
     */
    ownerSVGElement {
        get => this.get_ownerSVGElement()
    }

    /**
     * @type {ISVGElement} 
     */
    viewportElement {
        get => this.get_viewportElement()
    }

    /**
     * @type {ISVGAnimatedEnumeration} 
     */
    focusable {
        get => this.get_focusable()
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_xmlbase(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_xmlbase() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {ISVGSVGElement} v 
     * @returns {HRESULT} 
     */
    putref_ownerSVGElement(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGSVGElement} 
     */
    get_ownerSVGElement() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGSVGElement(p)
    }

    /**
     * 
     * @param {ISVGElement} v 
     * @returns {HRESULT} 
     */
    putref_viewportElement(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGElement} 
     */
    get_viewportElement() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElement(p)
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_focusable(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedEnumeration} 
     */
    get_focusable() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedEnumeration(p)
    }

    Query(iid) {
        if (ISVGElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_xmlbase := CallbackCreate(GetMethod(implObj, "put_xmlbase"), flags, 2)
        this.vtbl.get_xmlbase := CallbackCreate(GetMethod(implObj, "get_xmlbase"), flags, 2)
        this.vtbl.putref_ownerSVGElement := CallbackCreate(GetMethod(implObj, "putref_ownerSVGElement"), flags, 2)
        this.vtbl.get_ownerSVGElement := CallbackCreate(GetMethod(implObj, "get_ownerSVGElement"), flags, 2)
        this.vtbl.putref_viewportElement := CallbackCreate(GetMethod(implObj, "putref_viewportElement"), flags, 2)
        this.vtbl.get_viewportElement := CallbackCreate(GetMethod(implObj, "get_viewportElement"), flags, 2)
        this.vtbl.putref_focusable := CallbackCreate(GetMethod(implObj, "putref_focusable"), flags, 2)
        this.vtbl.get_focusable := CallbackCreate(GetMethod(implObj, "get_focusable"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_xmlbase)
        CallbackFree(this.vtbl.get_xmlbase)
        CallbackFree(this.vtbl.putref_ownerSVGElement)
        CallbackFree(this.vtbl.get_ownerSVGElement)
        CallbackFree(this.vtbl.putref_viewportElement)
        CallbackFree(this.vtbl.get_viewportElement)
        CallbackFree(this.vtbl.putref_focusable)
        CallbackFree(this.vtbl.get_focusable)
    }
}
