#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLDOMAttribute.ahk" { IHTMLDOMAttribute }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLElement4 extends IDispatch {
    /**
     * The interface identifier for IHTMLElement4
     * @type {Guid}
     */
    static IID := Guid("{3050f80f-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLElement4 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_onmousewheel     : IntPtr
        get_onmousewheel     : IntPtr
        normalize            : IntPtr
        getAttributeNode     : IntPtr
        setAttributeNode     : IntPtr
        removeAttributeNode  : IntPtr
        put_onbeforeactivate : IntPtr
        get_onbeforeactivate : IntPtr
        put_onfocusin        : IntPtr
        get_onfocusin        : IntPtr
        put_onfocusout       : IntPtr
        get_onfocusout       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLElement4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    onmousewheel {
        get => this.get_onmousewheel()
        set => this.put_onmousewheel(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforeactivate {
        get => this.get_onbeforeactivate()
        set => this.put_onbeforeactivate(value)
    }

    /**
     * @type {VARIANT} 
     */
    onfocusin {
        get => this.get_onfocusin()
        set => this.put_onfocusin(value)
    }

    /**
     * @type {VARIANT} 
     */
    onfocusout {
        get => this.get_onfocusout()
        set => this.put_onfocusout(value)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousewheel(v) {
        result := ComCall(7, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousewheel() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * Normalizes the specified floating-point vector according to x / length(x).
     * @remarks
     * The **normalize** HLSL intrinsic function uses the following formula: *x* / [**length**](dx-graphics-hlsl-length.md)(*x*).
     * @returns {HRESULT} | Item                                                   | Description                                            |
     * |--------------------------------------------------------|--------------------------------------------------------|
     * | <span id="x"></span><span id="X"></span>*x*<br/> | \[in\] The specified floating-point vector.<br/> |
     * 
     * 
     * 
     *  
     * 
     * 
     * The normalized *x* parameter. If the length of the *x* parameter is 0, the result is indefinite.
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/dx-graphics-hlsl-normalize
     */
    normalize() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrname 
     * @returns {IHTMLDOMAttribute} 
     */
    getAttributeNode(bstrname) {
        bstrname := bstrname is String ? BSTR.Alloc(bstrname).Value : bstrname

        result := ComCall(10, this, BSTR, bstrname, "ptr*", &ppAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute(ppAttribute)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute} pattr 
     * @returns {IHTMLDOMAttribute} 
     */
    setAttributeNode(pattr) {
        result := ComCall(11, this, "ptr", pattr, "ptr*", &ppretAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute(ppretAttribute)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute} pattr 
     * @returns {IHTMLDOMAttribute} 
     */
    removeAttributeNode(pattr) {
        result := ComCall(12, this, "ptr", pattr, "ptr*", &ppretAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute(ppretAttribute)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeactivate(v) {
        result := ComCall(13, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeactivate() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocusin(v) {
        result := ComCall(15, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocusin() {
        p := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocusout(v) {
        result := ComCall(17, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocusout() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLElement4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_onmousewheel := CallbackCreate(GetMethod(implObj, "put_onmousewheel"), flags, 2)
        this.vtbl.get_onmousewheel := CallbackCreate(GetMethod(implObj, "get_onmousewheel"), flags, 2)
        this.vtbl.normalize := CallbackCreate(GetMethod(implObj, "normalize"), flags, 1)
        this.vtbl.getAttributeNode := CallbackCreate(GetMethod(implObj, "getAttributeNode"), flags, 3)
        this.vtbl.setAttributeNode := CallbackCreate(GetMethod(implObj, "setAttributeNode"), flags, 3)
        this.vtbl.removeAttributeNode := CallbackCreate(GetMethod(implObj, "removeAttributeNode"), flags, 3)
        this.vtbl.put_onbeforeactivate := CallbackCreate(GetMethod(implObj, "put_onbeforeactivate"), flags, 2)
        this.vtbl.get_onbeforeactivate := CallbackCreate(GetMethod(implObj, "get_onbeforeactivate"), flags, 2)
        this.vtbl.put_onfocusin := CallbackCreate(GetMethod(implObj, "put_onfocusin"), flags, 2)
        this.vtbl.get_onfocusin := CallbackCreate(GetMethod(implObj, "get_onfocusin"), flags, 2)
        this.vtbl.put_onfocusout := CallbackCreate(GetMethod(implObj, "put_onfocusout"), flags, 2)
        this.vtbl.get_onfocusout := CallbackCreate(GetMethod(implObj, "get_onfocusout"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_onmousewheel)
        CallbackFree(this.vtbl.get_onmousewheel)
        CallbackFree(this.vtbl.normalize)
        CallbackFree(this.vtbl.getAttributeNode)
        CallbackFree(this.vtbl.setAttributeNode)
        CallbackFree(this.vtbl.removeAttributeNode)
        CallbackFree(this.vtbl.put_onbeforeactivate)
        CallbackFree(this.vtbl.get_onbeforeactivate)
        CallbackFree(this.vtbl.put_onfocusin)
        CallbackFree(this.vtbl.get_onfocusin)
        CallbackFree(this.vtbl.put_onfocusout)
        CallbackFree(this.vtbl.get_onfocusout)
    }
}
