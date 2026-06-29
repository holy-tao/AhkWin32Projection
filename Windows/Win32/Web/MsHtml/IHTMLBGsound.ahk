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
export default struct IHTMLBGsound extends IDispatch {
    /**
     * The interface identifier for IHTMLBGsound
     * @type {Guid}
     */
    static IID := Guid("{3050f369-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLBGsound
     * @type {Guid}
     */
    static CLSID := Guid("{3050f370-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLBGsound interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_src     : IntPtr
        get_src     : IntPtr
        put_loop    : IntPtr
        get_loop    : IntPtr
        put_volume  : IntPtr
        get_volume  : IntPtr
        put_balance : IntPtr
        get_balance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLBGsound.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    src {
        get => this.get_src()
        set => this.put_src(value)
    }

    /**
     * @type {VARIANT} 
     */
    loop {
        get => this.get_loop()
        set => this.put_loop(value)
    }

    /**
     * @type {VARIANT} 
     */
    volume {
        get => this.get_volume()
        set => this.put_volume(value)
    }

    /**
     * @type {VARIANT} 
     */
    balance {
        get => this.get_balance()
        set => this.put_balance(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_src(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_src() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_loop(v) {
        result := ComCall(9, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_loop() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_volume(v) {
        result := ComCall(11, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_volume() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_balance(v) {
        result := ComCall(13, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_balance() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLBGsound.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_src := CallbackCreate(GetMethod(implObj, "put_src"), flags, 2)
        this.vtbl.get_src := CallbackCreate(GetMethod(implObj, "get_src"), flags, 2)
        this.vtbl.put_loop := CallbackCreate(GetMethod(implObj, "put_loop"), flags, 2)
        this.vtbl.get_loop := CallbackCreate(GetMethod(implObj, "get_loop"), flags, 2)
        this.vtbl.put_volume := CallbackCreate(GetMethod(implObj, "put_volume"), flags, 2)
        this.vtbl.get_volume := CallbackCreate(GetMethod(implObj, "get_volume"), flags, 2)
        this.vtbl.put_balance := CallbackCreate(GetMethod(implObj, "put_balance"), flags, 2)
        this.vtbl.get_balance := CallbackCreate(GetMethod(implObj, "get_balance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_src)
        CallbackFree(this.vtbl.get_src)
        CallbackFree(this.vtbl.put_loop)
        CallbackFree(this.vtbl.get_loop)
        CallbackFree(this.vtbl.put_volume)
        CallbackFree(this.vtbl.get_volume)
        CallbackFree(this.vtbl.put_balance)
        CallbackFree(this.vtbl.get_balance)
    }
}
