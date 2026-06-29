#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLScreen3 extends IDispatch {
    /**
     * The interface identifier for IHTMLScreen3
     * @type {Guid}
     */
    static IID := Guid("{305104a1-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLScreen3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_systemXDPI : IntPtr
        get_systemYDPI : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLScreen3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    systemXDPI {
        get => this.get_systemXDPI()
    }

    /**
     * @type {Integer} 
     */
    systemYDPI {
        get => this.get_systemYDPI()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_systemXDPI() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_systemYDPI() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLScreen3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_systemXDPI := CallbackCreate(GetMethod(implObj, "get_systemXDPI"), flags, 2)
        this.vtbl.get_systemYDPI := CallbackCreate(GetMethod(implObj, "get_systemYDPI"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_systemXDPI)
        CallbackFree(this.vtbl.get_systemYDPI)
    }
}
