#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLDOMAttribute2.ahk" { IHTMLDOMAttribute2 }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLAttributeCollection4 extends IDispatch {
    /**
     * The interface identifier for IHTMLAttributeCollection4
     * @type {Guid}
     */
    static IID := Guid("{305106fa-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLAttributeCollection4 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        getNamedItemNS    : IntPtr
        setNamedItemNS    : IntPtr
        removeNamedItemNS : IntPtr
        getNamedItem      : IntPtr
        setNamedItem      : IntPtr
        removeNamedItem   : IntPtr
        item              : IntPtr
        get_length        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLAttributeCollection4.Vtbl()
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
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} bstrName 
     * @returns {IHTMLDOMAttribute2} 
     */
    getNamedItemNS(pvarNS, bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, VARIANT.Ptr, pvarNS, BSTR, bstrName, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppNodeOut)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute2} pNodeIn 
     * @returns {IHTMLDOMAttribute2} 
     */
    setNamedItemNS(pNodeIn) {
        result := ComCall(8, this, "ptr", pNodeIn, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppNodeOut)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} bstrName 
     * @returns {IHTMLDOMAttribute2} 
     */
    removeNamedItemNS(pvarNS, bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, VARIANT.Ptr, pvarNS, BSTR, bstrName, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppNodeOut)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IHTMLDOMAttribute2} 
     */
    getNamedItem(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(10, this, BSTR, bstrName, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppNodeOut)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute2} pNodeIn 
     * @returns {IHTMLDOMAttribute2} 
     */
    setNamedItem(pNodeIn) {
        result := ComCall(11, this, "ptr", pNodeIn, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppNodeOut)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IHTMLDOMAttribute2} 
     */
    removeNamedItem(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(12, this, BSTR, bstrName, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppNodeOut)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IHTMLDOMAttribute2} 
     */
    item(index) {
        result := ComCall(13, this, "int", index, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppNodeOut)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(14, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLAttributeCollection4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getNamedItemNS := CallbackCreate(GetMethod(implObj, "getNamedItemNS"), flags, 4)
        this.vtbl.setNamedItemNS := CallbackCreate(GetMethod(implObj, "setNamedItemNS"), flags, 3)
        this.vtbl.removeNamedItemNS := CallbackCreate(GetMethod(implObj, "removeNamedItemNS"), flags, 4)
        this.vtbl.getNamedItem := CallbackCreate(GetMethod(implObj, "getNamedItem"), flags, 3)
        this.vtbl.setNamedItem := CallbackCreate(GetMethod(implObj, "setNamedItem"), flags, 3)
        this.vtbl.removeNamedItem := CallbackCreate(GetMethod(implObj, "removeNamedItem"), flags, 3)
        this.vtbl.item := CallbackCreate(GetMethod(implObj, "item"), flags, 3)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getNamedItemNS)
        CallbackFree(this.vtbl.setNamedItemNS)
        CallbackFree(this.vtbl.removeNamedItemNS)
        CallbackFree(this.vtbl.getNamedItem)
        CallbackFree(this.vtbl.setNamedItem)
        CallbackFree(this.vtbl.removeNamedItem)
        CallbackFree(this.vtbl.item)
        CallbackFree(this.vtbl.get_length)
    }
}
