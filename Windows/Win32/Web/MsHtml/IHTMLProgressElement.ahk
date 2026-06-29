#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLFormElement.ahk" { IHTMLFormElement }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLProgressElement extends IDispatch {
    /**
     * The interface identifier for IHTMLProgressElement
     * @type {Guid}
     */
    static IID := Guid("{3050f2d6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLProgressElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f2d5-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLProgressElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_value    : IntPtr
        get_value    : IntPtr
        put_max      : IntPtr
        get_max      : IntPtr
        get_position : IntPtr
        get_form     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLProgressElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Float} 
     */
    value {
        get => this.get_value()
        set => this.put_value(value)
    }

    /**
     * @type {Float} 
     */
    max {
        get => this.get_max()
        set => this.put_max(value)
    }

    /**
     * @type {Float} 
     */
    position {
        get => this.get_position()
    }

    /**
     * @type {IHTMLFormElement} 
     */
    form {
        get => this.get_form()
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        result := ComCall(7, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_value() {
        result := ComCall(8, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_max(v) {
        result := ComCall(9, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_max() {
        result := ComCall(10, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Float} 
     */
    get_position() {
        result := ComCall(11, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLFormElement} 
     */
    get_form() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFormElement(p)
    }

    Query(iid) {
        if (IHTMLProgressElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_value := CallbackCreate(GetMethod(implObj, "put_value"), flags, 2)
        this.vtbl.get_value := CallbackCreate(GetMethod(implObj, "get_value"), flags, 2)
        this.vtbl.put_max := CallbackCreate(GetMethod(implObj, "put_max"), flags, 2)
        this.vtbl.get_max := CallbackCreate(GetMethod(implObj, "get_max"), flags, 2)
        this.vtbl.get_position := CallbackCreate(GetMethod(implObj, "get_position"), flags, 2)
        this.vtbl.get_form := CallbackCreate(GetMethod(implObj, "get_form"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_value)
        CallbackFree(this.vtbl.get_value)
        CallbackFree(this.vtbl.put_max)
        CallbackFree(this.vtbl.get_max)
        CallbackFree(this.vtbl.get_position)
        CallbackFree(this.vtbl.get_form)
    }
}
