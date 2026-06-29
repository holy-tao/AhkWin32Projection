#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDOMAttribute extends IDispatch {
    /**
     * The interface identifier for IHTMLDOMAttribute
     * @type {Guid}
     */
    static IID := Guid("{3050f4b0-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLDOMAttribute
     * @type {Guid}
     */
    static CLSID := Guid("{3050f4b2-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDOMAttribute interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_nodeName  : IntPtr
        put_nodeValue : IntPtr
        get_nodeValue : IntPtr
        get_specified : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDOMAttribute.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    nodeName {
        get => this.get_nodeName()
    }

    /**
     * @type {VARIANT} 
     */
    nodeValue {
        get => this.get_nodeValue()
        set => this.put_nodeValue(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    specified {
        get => this.get_specified()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_nodeName() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_nodeValue(v) {
        result := ComCall(8, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_nodeValue() {
        p := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_specified() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLDOMAttribute.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_nodeName := CallbackCreate(GetMethod(implObj, "get_nodeName"), flags, 2)
        this.vtbl.put_nodeValue := CallbackCreate(GetMethod(implObj, "put_nodeValue"), flags, 2)
        this.vtbl.get_nodeValue := CallbackCreate(GetMethod(implObj, "get_nodeValue"), flags, 2)
        this.vtbl.get_specified := CallbackCreate(GetMethod(implObj, "get_specified"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_nodeName)
        CallbackFree(this.vtbl.put_nodeValue)
        CallbackFree(this.vtbl.get_nodeValue)
        CallbackFree(this.vtbl.get_specified)
    }
}
