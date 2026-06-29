#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLTableSection4 extends IDispatch {
    /**
     * The interface identifier for IHTMLTableSection4
     * @type {Guid}
     */
    static IID := Guid("{305106c5-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLTableSection4 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_ch    : IntPtr
        get_ch    : IntPtr
        put_chOff : IntPtr
        get_chOff : IntPtr
        insertRow : IntPtr
        deleteRow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLTableSection4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ch {
        get => this.get_ch()
        set => this.put_ch(value)
    }

    /**
     * @type {BSTR} 
     */
    chOff {
        get => this.get_chOff()
        set => this.put_chOff(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ch(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ch() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_chOff(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_chOff() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IDispatch} 
     */
    insertRow(index) {
        result := ComCall(11, this, "int", index, "ptr*", &row := 0, "HRESULT")
        return IDispatch(row)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    deleteRow(index) {
        result := ComCall(12, this, "int", index, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLTableSection4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_ch := CallbackCreate(GetMethod(implObj, "put_ch"), flags, 2)
        this.vtbl.get_ch := CallbackCreate(GetMethod(implObj, "get_ch"), flags, 2)
        this.vtbl.put_chOff := CallbackCreate(GetMethod(implObj, "put_chOff"), flags, 2)
        this.vtbl.get_chOff := CallbackCreate(GetMethod(implObj, "get_chOff"), flags, 2)
        this.vtbl.insertRow := CallbackCreate(GetMethod(implObj, "insertRow"), flags, 3)
        this.vtbl.deleteRow := CallbackCreate(GetMethod(implObj, "deleteRow"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_ch)
        CallbackFree(this.vtbl.get_ch)
        CallbackFree(this.vtbl.put_chOff)
        CallbackFree(this.vtbl.get_chOff)
        CallbackFree(this.vtbl.insertRow)
        CallbackFree(this.vtbl.deleteRow)
    }
}
