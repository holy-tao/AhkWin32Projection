#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLFontNamesCollection extends IDispatch {
    /**
     * The interface identifier for IHTMLFontNamesCollection
     * @type {Guid}
     */
    static IID := Guid("{3050f376-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLFontNamesCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_length   : IntPtr
        get__newEnum : IntPtr
        item         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLFontNamesCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * @type {IUnknown} 
     */
    _newEnum {
        get => this.get__newEnum()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IUnknown(p)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    item(index) {
        pBstr := BSTR.Owned()
        result := ComCall(9, this, "int", index, BSTR.Ptr, pBstr, "HRESULT")
        return pBstr
    }

    Query(iid) {
        if (IHTMLFontNamesCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.get__newEnum := CallbackCreate(GetMethod(implObj, "get__newEnum"), flags, 2)
        this.vtbl.item := CallbackCreate(GetMethod(implObj, "item"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.get__newEnum)
        CallbackFree(this.vtbl.item)
    }
}
