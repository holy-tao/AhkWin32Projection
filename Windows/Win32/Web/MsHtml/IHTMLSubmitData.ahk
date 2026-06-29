#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLSubmitData extends IDispatch {
    /**
     * The interface identifier for IHTMLSubmitData
     * @type {Guid}
     */
    static IID := Guid("{3050f645-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLSubmitData interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        appendNameValuePair : IntPtr
        appendNameFilePair  : IntPtr
        appendItemSeparator : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLSubmitData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     */
    appendNameValuePair(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(7, this, BSTR, name, BSTR, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} filename 
     * @returns {HRESULT} 
     */
    appendNameFilePair(name, filename) {
        name := name is String ? BSTR.Alloc(name).Value : name
        filename := filename is String ? BSTR.Alloc(filename).Value : filename

        result := ComCall(8, this, BSTR, name, BSTR, filename, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    appendItemSeparator() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLSubmitData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.appendNameValuePair := CallbackCreate(GetMethod(implObj, "appendNameValuePair"), flags, 3)
        this.vtbl.appendNameFilePair := CallbackCreate(GetMethod(implObj, "appendNameFilePair"), flags, 3)
        this.vtbl.appendItemSeparator := CallbackCreate(GetMethod(implObj, "appendItemSeparator"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.appendNameValuePair)
        CallbackFree(this.vtbl.appendNameFilePair)
        CallbackFree(this.vtbl.appendItemSeparator)
    }
}
