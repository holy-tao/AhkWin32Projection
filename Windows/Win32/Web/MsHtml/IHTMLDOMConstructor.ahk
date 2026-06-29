#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDOMConstructor extends IDispatch {
    /**
     * The interface identifier for IHTMLDOMConstructor
     * @type {Guid}
     */
    static IID := Guid("{3051049b-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDOMConstructor interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_constructor : IntPtr
        LookupGetter    : IntPtr
        LookupSetter    : IntPtr
        DefineGetter    : IntPtr
        DefineSetter    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDOMConstructor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IDispatch} 
     */
    constructor {
        get => this.get_constructor()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_constructor() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} propname 
     * @returns {VARIANT} 
     */
    LookupGetter(propname) {
        propname := propname is String ? BSTR.Alloc(propname).Value : propname

        ppDispHandler := VARIANT()
        result := ComCall(8, this, BSTR, propname, VARIANT.Ptr, ppDispHandler, "HRESULT")
        return ppDispHandler
    }

    /**
     * 
     * @param {BSTR} propname 
     * @returns {VARIANT} 
     */
    LookupSetter(propname) {
        propname := propname is String ? BSTR.Alloc(propname).Value : propname

        ppDispHandler := VARIANT()
        result := ComCall(9, this, BSTR, propname, VARIANT.Ptr, ppDispHandler, "HRESULT")
        return ppDispHandler
    }

    /**
     * 
     * @param {BSTR} propname 
     * @param {Pointer<VARIANT>} pdispHandler 
     * @returns {HRESULT} 
     */
    DefineGetter(propname, pdispHandler) {
        propname := propname is String ? BSTR.Alloc(propname).Value : propname

        result := ComCall(10, this, BSTR, propname, VARIANT.Ptr, pdispHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} propname 
     * @param {Pointer<VARIANT>} pdispHandler 
     * @returns {HRESULT} 
     */
    DefineSetter(propname, pdispHandler) {
        propname := propname is String ? BSTR.Alloc(propname).Value : propname

        result := ComCall(11, this, BSTR, propname, VARIANT.Ptr, pdispHandler, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLDOMConstructor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_constructor := CallbackCreate(GetMethod(implObj, "get_constructor"), flags, 2)
        this.vtbl.LookupGetter := CallbackCreate(GetMethod(implObj, "LookupGetter"), flags, 3)
        this.vtbl.LookupSetter := CallbackCreate(GetMethod(implObj, "LookupSetter"), flags, 3)
        this.vtbl.DefineGetter := CallbackCreate(GetMethod(implObj, "DefineGetter"), flags, 3)
        this.vtbl.DefineSetter := CallbackCreate(GetMethod(implObj, "DefineSetter"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_constructor)
        CallbackFree(this.vtbl.LookupGetter)
        CallbackFree(this.vtbl.LookupSetter)
        CallbackFree(this.vtbl.DefineGetter)
        CallbackFree(this.vtbl.DefineSetter)
    }
}
