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
export default struct IHTMLAttributeCollection2 extends IDispatch {
    /**
     * The interface identifier for IHTMLAttributeCollection2
     * @type {Guid}
     */
    static IID := Guid("{3050f80a-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLAttributeCollection2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        getNamedItem    : IntPtr
        setNamedItem    : IntPtr
        removeNamedItem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLAttributeCollection2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IHTMLDOMAttribute} 
     */
    getNamedItem(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, BSTR, bstrName, "ptr*", &newretNode := 0, "HRESULT")
        return IHTMLDOMAttribute(newretNode)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute} ppNode 
     * @returns {IHTMLDOMAttribute} 
     */
    setNamedItem(ppNode) {
        result := ComCall(8, this, "ptr", ppNode, "ptr*", &newretNode := 0, "HRESULT")
        return IHTMLDOMAttribute(newretNode)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IHTMLDOMAttribute} 
     */
    removeNamedItem(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, BSTR, bstrName, "ptr*", &newretNode := 0, "HRESULT")
        return IHTMLDOMAttribute(newretNode)
    }

    Query(iid) {
        if (IHTMLAttributeCollection2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getNamedItem := CallbackCreate(GetMethod(implObj, "getNamedItem"), flags, 3)
        this.vtbl.setNamedItem := CallbackCreate(GetMethod(implObj, "setNamedItem"), flags, 3)
        this.vtbl.removeNamedItem := CallbackCreate(GetMethod(implObj, "removeNamedItem"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getNamedItem)
        CallbackFree(this.vtbl.setNamedItem)
        CallbackFree(this.vtbl.removeNamedItem)
    }
}
