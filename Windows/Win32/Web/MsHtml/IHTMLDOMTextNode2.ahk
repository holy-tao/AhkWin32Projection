#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDOMTextNode2 extends IDispatch {
    /**
     * The interface identifier for IHTMLDOMTextNode2
     * @type {Guid}
     */
    static IID := Guid("{3050f809-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDOMTextNode2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        substringData : IntPtr
        appendData    : IntPtr
        insertData    : IntPtr
        deleteData    : IntPtr
        replaceData   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDOMTextNode2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} Count 
     * @returns {BSTR} 
     */
    substringData(offset, Count) {
        pbstrsubString := BSTR.Owned()
        result := ComCall(7, this, "int", offset, "int", Count, BSTR.Ptr, pbstrsubString, "HRESULT")
        return pbstrsubString
    }

    /**
     * 
     * @param {BSTR} bstrstring 
     * @returns {HRESULT} 
     */
    appendData(bstrstring) {
        bstrstring := bstrstring is String ? BSTR.Alloc(bstrstring).Value : bstrstring

        result := ComCall(8, this, BSTR, bstrstring, "HRESULT")
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

        result := ComCall(9, this, "int", offset, BSTR, bstrstring, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    deleteData(offset, Count) {
        result := ComCall(10, this, "int", offset, "int", Count, "HRESULT")
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

        result := ComCall(11, this, "int", offset, "int", Count, BSTR, bstrstring, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLDOMTextNode2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
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
        CallbackFree(this.vtbl.substringData)
        CallbackFree(this.vtbl.appendData)
        CallbackFree(this.vtbl.insertData)
        CallbackFree(this.vtbl.deleteData)
        CallbackFree(this.vtbl.replaceData)
    }
}
