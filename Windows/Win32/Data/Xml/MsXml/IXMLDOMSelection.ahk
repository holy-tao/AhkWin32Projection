#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }
#Import ".\IXMLDOMNodeList.ahk" { IXMLDOMNodeList }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMSelection extends IXMLDOMNodeList {
    /**
     * The interface identifier for IXMLDOMSelection
     * @type {Guid}
     */
    static IID := Guid("{aa634fc7-5888-44a7-a257-3a47150d3a0e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMSelection interfaces
    */
    struct Vtbl extends IXMLDOMNodeList.Vtbl {
        get_expr       : IntPtr
        put_expr       : IntPtr
        get_context    : IntPtr
        putref_context : IntPtr
        peekNode       : IntPtr
        matches        : IntPtr
        removeNext     : IntPtr
        removeAll      : IntPtr
        clone          : IntPtr
        getProperty    : IntPtr
        setProperty    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMSelection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    expr {
        get => this.get_expr()
        set => this.put_expr(value)
    }

    /**
     * @type {IXMLDOMNode} 
     */
    context {
        get => this.get_context()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_expr() {
        expression := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, expression, "HRESULT")
        return expression
    }

    /**
     * 
     * @param {BSTR} expression 
     * @returns {HRESULT} 
     */
    put_expr(expression) {
        expression := expression is String ? BSTR.Alloc(expression).Value : expression

        result := ComCall(13, this, BSTR, expression, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    get_context() {
        result := ComCall(14, this, "ptr*", &ppNode := 0, "HRESULT")
        return IXMLDOMNode(ppNode)
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @returns {HRESULT} 
     */
    putref_context(pNode) {
        result := ComCall(15, this, "ptr", pNode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    peekNode() {
        result := ComCall(16, this, "ptr*", &ppNode := 0, "HRESULT")
        return IXMLDOMNode(ppNode)
    }

    /**
     * 
     * @param {IXMLDOMNode} pNode 
     * @returns {IXMLDOMNode} 
     */
    matches(pNode) {
        result := ComCall(17, this, "ptr", pNode, "ptr*", &ppNode := 0, "HRESULT")
        return IXMLDOMNode(ppNode)
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    removeNext() {
        result := ComCall(18, this, "ptr*", &ppNode := 0, "HRESULT")
        return IXMLDOMNode(ppNode)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    removeAll() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXMLDOMSelection} 
     */
    clone() {
        result := ComCall(20, this, "ptr*", &ppNode := 0, "HRESULT")
        return IXMLDOMSelection(ppNode)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {VARIANT} 
     */
    getProperty(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        value := VARIANT()
        result := ComCall(21, this, BSTR, name, VARIANT.Ptr, value, "HRESULT")
        return value
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     */
    setProperty(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(22, this, BSTR, name, VARIANT, value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXMLDOMSelection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_expr := CallbackCreate(GetMethod(implObj, "get_expr"), flags, 2)
        this.vtbl.put_expr := CallbackCreate(GetMethod(implObj, "put_expr"), flags, 2)
        this.vtbl.get_context := CallbackCreate(GetMethod(implObj, "get_context"), flags, 2)
        this.vtbl.putref_context := CallbackCreate(GetMethod(implObj, "putref_context"), flags, 2)
        this.vtbl.peekNode := CallbackCreate(GetMethod(implObj, "peekNode"), flags, 2)
        this.vtbl.matches := CallbackCreate(GetMethod(implObj, "matches"), flags, 3)
        this.vtbl.removeNext := CallbackCreate(GetMethod(implObj, "removeNext"), flags, 2)
        this.vtbl.removeAll := CallbackCreate(GetMethod(implObj, "removeAll"), flags, 1)
        this.vtbl.clone := CallbackCreate(GetMethod(implObj, "clone"), flags, 2)
        this.vtbl.getProperty := CallbackCreate(GetMethod(implObj, "getProperty"), flags, 3)
        this.vtbl.setProperty := CallbackCreate(GetMethod(implObj, "setProperty"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_expr)
        CallbackFree(this.vtbl.put_expr)
        CallbackFree(this.vtbl.get_context)
        CallbackFree(this.vtbl.putref_context)
        CallbackFree(this.vtbl.peekNode)
        CallbackFree(this.vtbl.matches)
        CallbackFree(this.vtbl.removeNext)
        CallbackFree(this.vtbl.removeAll)
        CallbackFree(this.vtbl.clone)
        CallbackFree(this.vtbl.getProperty)
        CallbackFree(this.vtbl.setProperty)
    }
}
