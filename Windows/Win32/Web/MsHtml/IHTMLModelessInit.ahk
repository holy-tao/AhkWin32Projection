#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLModelessInit extends IDispatch {
    /**
     * The interface identifier for IHTMLModelessInit
     * @type {Guid}
     */
    static IID := Guid("{3050f5e4-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLModelessInit interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_parameters   : IntPtr
        get_optionString : IntPtr
        get_moniker      : IntPtr
        get_document     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLModelessInit.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    parameters {
        get => this.get_parameters()
    }

    /**
     * @type {VARIANT} 
     */
    optionString {
        get => this.get_optionString()
    }

    /**
     * @type {IUnknown} 
     */
    moniker {
        get => this.get_moniker()
    }

    /**
     * @type {IUnknown} 
     */
    document {
        get => this.get_document()
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_parameters() {
        p := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_optionString() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_moniker() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IUnknown(p)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_document() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IUnknown(p)
    }

    Query(iid) {
        if (IHTMLModelessInit.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_parameters := CallbackCreate(GetMethod(implObj, "get_parameters"), flags, 2)
        this.vtbl.get_optionString := CallbackCreate(GetMethod(implObj, "get_optionString"), flags, 2)
        this.vtbl.get_moniker := CallbackCreate(GetMethod(implObj, "get_moniker"), flags, 2)
        this.vtbl.get_document := CallbackCreate(GetMethod(implObj, "get_document"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_parameters)
        CallbackFree(this.vtbl.get_optionString)
        CallbackFree(this.vtbl.get_moniker)
        CallbackFree(this.vtbl.get_document)
    }
}
