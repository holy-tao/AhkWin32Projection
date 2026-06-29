#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLCommentElement2 extends IDispatch {
    /**
     * The interface identifier for IHTMLCommentElement2
     * @type {Guid}
     */
    static IID := Guid("{3050f813-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCommentElement2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_data      : IntPtr
        get_data      : IntPtr
        get_length    : IntPtr
        substringData : IntPtr
        appendData    : IntPtr
        insertData    : IntPtr
        deleteData    : IntPtr
        replaceData   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCommentElement2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    data {
        get => this.get_data()
        set => this.put_data(value)
    }

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_data(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_data() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(9, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} Count 
     * @returns {BSTR} 
     */
    substringData(offset, Count) {
        pbstrsubString := BSTR.Owned()
        result := ComCall(10, this, "int", offset, "int", Count, BSTR.Ptr, pbstrsubString, "HRESULT")
        return pbstrsubString
    }

    /**
     * 
     * @param {BSTR} bstrstring 
     * @returns {HRESULT} 
     */
    appendData(bstrstring) {
        bstrstring := bstrstring is String ? BSTR.Alloc(bstrstring).Value : bstrstring

        result := ComCall(11, this, BSTR, bstrstring, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {BSTR} bstrstring 
     * @returns {HRESULT} 
     */
    insertData(offset, bstrstring) {
        bstrstring := bstrstring is String ? BSTR.Alloc(bstrstring).Value : bstrstring

        result := ComCall(12, this, "int", offset, BSTR, bstrstring, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    deleteData(offset, Count) {
        result := ComCall(13, this, "int", offset, "int", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} Count 
     * @param {BSTR} bstrstring 
     * @returns {HRESULT} 
     */
    replaceData(offset, Count, bstrstring) {
        bstrstring := bstrstring is String ? BSTR.Alloc(bstrstring).Value : bstrstring

        result := ComCall(14, this, "int", offset, "int", Count, BSTR, bstrstring, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLCommentElement2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_data := CallbackCreate(GetMethod(implObj, "put_data"), flags, 2)
        this.vtbl.get_data := CallbackCreate(GetMethod(implObj, "get_data"), flags, 2)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.substringData := CallbackCreate(GetMethod(implObj, "substringData"), flags, 4)
        this.vtbl.appendData := CallbackCreate(GetMethod(implObj, "appendData"), flags, 2)
        this.vtbl.insertData := CallbackCreate(GetMethod(implObj, "insertData"), flags, 3)
        this.vtbl.deleteData := CallbackCreate(GetMethod(implObj, "deleteData"), flags, 3)
        this.vtbl.replaceData := CallbackCreate(GetMethod(implObj, "replaceData"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_data)
        CallbackFree(this.vtbl.get_data)
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.substringData)
        CallbackFree(this.vtbl.appendData)
        CallbackFree(this.vtbl.insertData)
        CallbackFree(this.vtbl.deleteData)
        CallbackFree(this.vtbl.replaceData)
    }
}
