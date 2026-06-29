#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IHTMLElement2.ahk" { IHTMLElement2 }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDOMAttribute3 extends IDispatch {
    /**
     * The interface identifier for IHTMLDOMAttribute3
     * @type {Guid}
     */
    static IID := Guid("{30510468-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDOMAttribute3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_nodeValue    : IntPtr
        get_nodeValue    : IntPtr
        put_value        : IntPtr
        get_value        : IntPtr
        get_specified    : IntPtr
        get_ownerElement : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDOMAttribute3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    nodeValue {
        get => this.get_nodeValue()
        set => this.put_nodeValue(value)
    }

    /**
     * @type {BSTR} 
     */
    value {
        get => this.get_value()
        set => this.put_value(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    specified {
        get => this.get_specified()
    }

    /**
     * @type {IHTMLElement2} 
     */
    ownerElement {
        get => this.get_ownerElement()
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_nodeValue(v) {
        result := ComCall(7, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_nodeValue() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_value() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_specified() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLElement2} 
     */
    get_ownerElement() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement2(p)
    }

    Query(iid) {
        if (IHTMLDOMAttribute3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_nodeValue := CallbackCreate(GetMethod(implObj, "put_nodeValue"), flags, 2)
        this.vtbl.get_nodeValue := CallbackCreate(GetMethod(implObj, "get_nodeValue"), flags, 2)
        this.vtbl.put_value := CallbackCreate(GetMethod(implObj, "put_value"), flags, 2)
        this.vtbl.get_value := CallbackCreate(GetMethod(implObj, "get_value"), flags, 2)
        this.vtbl.get_specified := CallbackCreate(GetMethod(implObj, "get_specified"), flags, 2)
        this.vtbl.get_ownerElement := CallbackCreate(GetMethod(implObj, "get_ownerElement"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_nodeValue)
        CallbackFree(this.vtbl.get_nodeValue)
        CallbackFree(this.vtbl.put_value)
        CallbackFree(this.vtbl.get_value)
        CallbackFree(this.vtbl.get_specified)
        CallbackFree(this.vtbl.get_ownerElement)
    }
}
