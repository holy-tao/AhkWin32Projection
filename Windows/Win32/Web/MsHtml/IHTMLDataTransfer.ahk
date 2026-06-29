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
export default struct IHTMLDataTransfer extends IDispatch {
    /**
     * The interface identifier for IHTMLDataTransfer
     * @type {Guid}
     */
    static IID := Guid("{3050f4b3-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDataTransfer interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        setData           : IntPtr
        getData           : IntPtr
        clearData         : IntPtr
        put_dropEffect    : IntPtr
        get_dropEffect    : IntPtr
        put_effectAllowed : IntPtr
        get_effectAllowed : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDataTransfer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    dropEffect {
        get => this.get_dropEffect()
        set => this.put_dropEffect(value)
    }

    /**
     * @type {BSTR} 
     */
    effectAllowed {
        get => this.get_effectAllowed()
        set => this.put_effectAllowed(value)
    }

    /**
     * 
     * @param {BSTR} format 
     * @param {Pointer<VARIANT>} data 
     * @returns {VARIANT_BOOL} 
     */
    setData(format, data) {
        format := format is String ? BSTR.Alloc(format).Value : format

        result := ComCall(7, this, BSTR, format, VARIANT.Ptr, data, VARIANT_BOOL.Ptr, &pret := 0, "HRESULT")
        return pret
    }

    /**
     * 
     * @param {BSTR} format 
     * @returns {VARIANT} 
     */
    getData(format) {
        format := format is String ? BSTR.Alloc(format).Value : format

        pvarRet := VARIANT()
        result := ComCall(8, this, BSTR, format, VARIANT.Ptr, pvarRet, "HRESULT")
        return pvarRet
    }

    /**
     * 
     * @param {BSTR} format 
     * @returns {VARIANT_BOOL} 
     */
    clearData(format) {
        format := format is String ? BSTR.Alloc(format).Value : format

        result := ComCall(9, this, BSTR, format, VARIANT_BOOL.Ptr, &pret := 0, "HRESULT")
        return pret
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dropEffect(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(10, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dropEffect() {
        p := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_effectAllowed(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(12, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_effectAllowed() {
        p := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLDataTransfer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.setData := CallbackCreate(GetMethod(implObj, "setData"), flags, 4)
        this.vtbl.getData := CallbackCreate(GetMethod(implObj, "getData"), flags, 3)
        this.vtbl.clearData := CallbackCreate(GetMethod(implObj, "clearData"), flags, 3)
        this.vtbl.put_dropEffect := CallbackCreate(GetMethod(implObj, "put_dropEffect"), flags, 2)
        this.vtbl.get_dropEffect := CallbackCreate(GetMethod(implObj, "get_dropEffect"), flags, 2)
        this.vtbl.put_effectAllowed := CallbackCreate(GetMethod(implObj, "put_effectAllowed"), flags, 2)
        this.vtbl.get_effectAllowed := CallbackCreate(GetMethod(implObj, "get_effectAllowed"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.setData)
        CallbackFree(this.vtbl.getData)
        CallbackFree(this.vtbl.clearData)
        CallbackFree(this.vtbl.put_dropEffect)
        CallbackFree(this.vtbl.get_dropEffect)
        CallbackFree(this.vtbl.put_effectAllowed)
        CallbackFree(this.vtbl.get_effectAllowed)
    }
}
