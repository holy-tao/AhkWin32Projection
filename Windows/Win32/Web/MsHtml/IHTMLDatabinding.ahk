#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDatabinding extends IDispatch {
    /**
     * The interface identifier for IHTMLDatabinding
     * @type {Guid}
     */
    static IID := Guid("{3050f3f2-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDatabinding interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_dataFld      : IntPtr
        get_dataFld      : IntPtr
        put_dataSrc      : IntPtr
        get_dataSrc      : IntPtr
        put_dataFormatAs : IntPtr
        get_dataFormatAs : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDatabinding.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    dataFld {
        get => this.get_dataFld()
        set => this.put_dataFld(value)
    }

    /**
     * @type {BSTR} 
     */
    dataSrc {
        get => this.get_dataSrc()
        set => this.put_dataSrc(value)
    }

    /**
     * @type {BSTR} 
     */
    dataFormatAs {
        get => this.get_dataFormatAs()
        set => this.put_dataFormatAs(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dataFld(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dataFld() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dataSrc(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dataSrc() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dataFormatAs(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dataFormatAs() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLDatabinding.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_dataFld := CallbackCreate(GetMethod(implObj, "put_dataFld"), flags, 2)
        this.vtbl.get_dataFld := CallbackCreate(GetMethod(implObj, "get_dataFld"), flags, 2)
        this.vtbl.put_dataSrc := CallbackCreate(GetMethod(implObj, "put_dataSrc"), flags, 2)
        this.vtbl.get_dataSrc := CallbackCreate(GetMethod(implObj, "get_dataSrc"), flags, 2)
        this.vtbl.put_dataFormatAs := CallbackCreate(GetMethod(implObj, "put_dataFormatAs"), flags, 2)
        this.vtbl.get_dataFormatAs := CallbackCreate(GetMethod(implObj, "get_dataFormatAs"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_dataFld)
        CallbackFree(this.vtbl.get_dataFld)
        CallbackFree(this.vtbl.put_dataSrc)
        CallbackFree(this.vtbl.get_dataSrc)
        CallbackFree(this.vtbl.put_dataFormatAs)
        CallbackFree(this.vtbl.get_dataFormatAs)
    }
}
