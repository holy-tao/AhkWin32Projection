#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMNamedNodeMap extends IDispatch {
    /**
     * The interface identifier for IXMLDOMNamedNodeMap
     * @type {Guid}
     */
    static IID := Guid("{2933bf83-7b36-11d2-b20e-00c04f983e60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMNamedNodeMap interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        getNamedItem        : IntPtr
        setNamedItem        : IntPtr
        removeNamedItem     : IntPtr
        get_item            : IntPtr
        get_length          : IntPtr
        getQualifiedItem    : IntPtr
        removeQualifiedItem : IntPtr
        nextNode            : IntPtr
        reset               : IntPtr
        get__newEnum        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMNamedNodeMap.Vtbl()
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
     * @param {BSTR} name 
     * @returns {IXMLDOMNode} 
     */
    getNamedItem(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(7, this, BSTR, name, "ptr*", &namedItem := 0, "HRESULT")
        return IXMLDOMNode(namedItem)
    }

    /**
     * 
     * @param {IXMLDOMNode} newItem 
     * @returns {IXMLDOMNode} 
     */
    setNamedItem(newItem) {
        result := ComCall(8, this, "ptr", newItem, "ptr*", &nameItem := 0, "HRESULT")
        return IXMLDOMNode(nameItem)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IXMLDOMNode} 
     */
    removeNamedItem(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(9, this, BSTR, name, "ptr*", &namedItem := 0, "HRESULT")
        return IXMLDOMNode(namedItem)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IXMLDOMNode} 
     */
    get_item(index) {
        result := ComCall(10, this, "int", index, "ptr*", &listItem := 0, "HRESULT")
        return IXMLDOMNode(listItem)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(11, this, "int*", &listLength := 0, "HRESULT")
        return listLength
    }

    /**
     * 
     * @param {BSTR} baseName 
     * @param {BSTR} namespaceURI 
     * @returns {IXMLDOMNode} 
     */
    getQualifiedItem(baseName, namespaceURI) {
        baseName := baseName is String ? BSTR.Alloc(baseName).Value : baseName
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(12, this, BSTR, baseName, BSTR, namespaceURI, "ptr*", &qualifiedItem := 0, "HRESULT")
        return IXMLDOMNode(qualifiedItem)
    }

    /**
     * 
     * @param {BSTR} baseName 
     * @param {BSTR} namespaceURI 
     * @returns {IXMLDOMNode} 
     */
    removeQualifiedItem(baseName, namespaceURI) {
        baseName := baseName is String ? BSTR.Alloc(baseName).Value : baseName
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(13, this, BSTR, baseName, BSTR, namespaceURI, "ptr*", &qualifiedItem := 0, "HRESULT")
        return IXMLDOMNode(qualifiedItem)
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    nextNode() {
        result := ComCall(14, this, "ptr*", &nextItem := 0, "HRESULT")
        return IXMLDOMNode(nextItem)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    reset() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(16, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    Query(iid) {
        if (IXMLDOMNamedNodeMap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getNamedItem := CallbackCreate(GetMethod(implObj, "getNamedItem"), flags, 3)
        this.vtbl.setNamedItem := CallbackCreate(GetMethod(implObj, "setNamedItem"), flags, 3)
        this.vtbl.removeNamedItem := CallbackCreate(GetMethod(implObj, "removeNamedItem"), flags, 3)
        this.vtbl.get_item := CallbackCreate(GetMethod(implObj, "get_item"), flags, 3)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.getQualifiedItem := CallbackCreate(GetMethod(implObj, "getQualifiedItem"), flags, 4)
        this.vtbl.removeQualifiedItem := CallbackCreate(GetMethod(implObj, "removeQualifiedItem"), flags, 4)
        this.vtbl.nextNode := CallbackCreate(GetMethod(implObj, "nextNode"), flags, 2)
        this.vtbl.reset := CallbackCreate(GetMethod(implObj, "reset"), flags, 1)
        this.vtbl.get__newEnum := CallbackCreate(GetMethod(implObj, "get__newEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getNamedItem)
        CallbackFree(this.vtbl.setNamedItem)
        CallbackFree(this.vtbl.removeNamedItem)
        CallbackFree(this.vtbl.get_item)
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.getQualifiedItem)
        CallbackFree(this.vtbl.removeQualifiedItem)
        CallbackFree(this.vtbl.nextNode)
        CallbackFree(this.vtbl.reset)
        CallbackFree(this.vtbl.get__newEnum)
    }
}
