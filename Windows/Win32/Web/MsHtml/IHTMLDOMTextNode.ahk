#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLDOMNode.ahk" { IHTMLDOMNode }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDOMTextNode extends IDispatch {
    /**
     * The interface identifier for IHTMLDOMTextNode
     * @type {Guid}
     */
    static IID := Guid("{3050f4b1-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLDOMTextNode
     * @type {Guid}
     */
    static CLSID := Guid("{3050f4ba-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDOMTextNode interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_data   : IntPtr
        get_data   : IntPtr
        toString   : IntPtr
        get_length : IntPtr
        splitText  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDOMTextNode.Vtbl()
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
     * @returns {BSTR} 
     */
    toString() {
        _String := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, _String, "HRESULT")
        return _String
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} offset 
     * @returns {IHTMLDOMNode} 
     */
    splitText(offset) {
        result := ComCall(11, this, "int", offset, "ptr*", &pRetNode := 0, "HRESULT")
        return IHTMLDOMNode(pRetNode)
    }

    Query(iid) {
        if (IHTMLDOMTextNode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_data := CallbackCreate(GetMethod(implObj, "put_data"), flags, 2)
        this.vtbl.get_data := CallbackCreate(GetMethod(implObj, "get_data"), flags, 2)
        this.vtbl.toString := CallbackCreate(GetMethod(implObj, "toString"), flags, 2)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.splitText := CallbackCreate(GetMethod(implObj, "splitText"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_data)
        CallbackFree(this.vtbl.get_data)
        CallbackFree(this.vtbl.toString)
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.splitText)
    }
}
