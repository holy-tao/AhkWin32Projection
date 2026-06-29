#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLDOMAttribute.ahk" { IHTMLDOMAttribute }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLAttributeCollection3 extends IDispatch {
    /**
     * The interface identifier for IHTMLAttributeCollection3
     * @type {Guid}
     */
    static IID := Guid("{30510469-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLAttributeCollection3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        getNamedItem    : IntPtr
        setNamedItem    : IntPtr
        removeNamedItem : IntPtr
        item            : IntPtr
        get_length      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLAttributeCollection3.Vtbl()
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
     * @param {BSTR} bstrName 
     * @returns {IHTMLDOMAttribute} 
     */
    getNamedItem(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, BSTR, bstrName, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute(ppNodeOut)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute} pNodeIn 
     * @returns {IHTMLDOMAttribute} 
     */
    setNamedItem(pNodeIn) {
        result := ComCall(8, this, "ptr", pNodeIn, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute(ppNodeOut)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IHTMLDOMAttribute} 
     */
    removeNamedItem(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, BSTR, bstrName, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute(ppNodeOut)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IHTMLDOMAttribute} 
     */
    item(index) {
        result := ComCall(10, this, "int", index, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute(ppNodeOut)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(11, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLAttributeCollection3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
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
        CallbackFree(this.vtbl.getNamedItem)
        CallbackFree(this.vtbl.setNamedItem)
        CallbackFree(this.vtbl.removeNamedItem)
        CallbackFree(this.vtbl.item)
        CallbackFree(this.vtbl.get_length)
    }
}
