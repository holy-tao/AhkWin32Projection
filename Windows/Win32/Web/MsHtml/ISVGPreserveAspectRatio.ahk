#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGPreserveAspectRatio extends IDispatch {
    /**
     * The interface identifier for ISVGPreserveAspectRatio
     * @type {Guid}
     */
    static IID := Guid("{305104fa-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPreserveAspectRatio
     * @type {Guid}
     */
    static CLSID := Guid("{305105d0-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGPreserveAspectRatio interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_align       : IntPtr
        get_align       : IntPtr
        put_meetOrSlice : IntPtr
        get_meetOrSlice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGPreserveAspectRatio.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    align {
        get => this.get_align()
        set => this.put_align(value)
    }

    /**
     * @type {Integer} 
     */
    meetOrSlice {
        get => this.get_meetOrSlice()
        set => this.put_meetOrSlice(value)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_align(v) {
        result := ComCall(7, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_align() {
        result := ComCall(8, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_meetOrSlice(v) {
        result := ComCall(9, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_meetOrSlice() {
        result := ComCall(10, this, "short*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (ISVGPreserveAspectRatio.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_align := CallbackCreate(GetMethod(implObj, "put_align"), flags, 2)
        this.vtbl.get_align := CallbackCreate(GetMethod(implObj, "get_align"), flags, 2)
        this.vtbl.put_meetOrSlice := CallbackCreate(GetMethod(implObj, "put_meetOrSlice"), flags, 2)
        this.vtbl.get_meetOrSlice := CallbackCreate(GetMethod(implObj, "get_meetOrSlice"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_align)
        CallbackFree(this.vtbl.get_align)
        CallbackFree(this.vtbl.put_meetOrSlice)
        CallbackFree(this.vtbl.get_meetOrSlice)
    }
}
