#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }
#Import ".\IXMLDOMNodeList.ahk" { IXMLDOMNodeList }
#Import ".\IXMLDOMAttribute.ahk" { IXMLDOMAttribute }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMElement extends IXMLDOMNode {
    /**
     * The interface identifier for IXMLDOMElement
     * @type {Guid}
     */
    static IID := Guid("{2933bf86-7b36-11d2-b20e-00c04f983e60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMElement interfaces
    */
    struct Vtbl extends IXMLDOMNode.Vtbl {
        get_tagName          : IntPtr
        getAttribute         : IntPtr
        setAttribute         : IntPtr
        removeAttribute      : IntPtr
        getAttributeNode     : IntPtr
        setAttributeNode     : IntPtr
        removeAttributeNode  : IntPtr
        getElementsByTagName : IntPtr
        normalize            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    tagName {
        get => this.get_tagName()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_tagName() {
        tagName := BSTR.Owned()
        result := ComCall(43, this, BSTR.Ptr, tagName, "HRESULT")
        return tagName
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {VARIANT} 
     */
    getAttribute(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        value := VARIANT()
        result := ComCall(44, this, BSTR, name, VARIANT.Ptr, value, "HRESULT")
        return value
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     */
    setAttribute(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(45, this, BSTR, name, VARIANT, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    removeAttribute(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(46, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IXMLDOMAttribute} 
     */
    getAttributeNode(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(47, this, BSTR, name, "ptr*", &attributeNode := 0, "HRESULT")
        return IXMLDOMAttribute(attributeNode)
    }

    /**
     * 
     * @param {IXMLDOMAttribute} DOMAttribute 
     * @returns {IXMLDOMAttribute} 
     */
    setAttributeNode(DOMAttribute) {
        result := ComCall(48, this, "ptr", DOMAttribute, "ptr*", &attributeNode := 0, "HRESULT")
        return IXMLDOMAttribute(attributeNode)
    }

    /**
     * 
     * @param {IXMLDOMAttribute} DOMAttribute 
     * @returns {IXMLDOMAttribute} 
     */
    removeAttributeNode(DOMAttribute) {
        result := ComCall(49, this, "ptr", DOMAttribute, "ptr*", &attributeNode := 0, "HRESULT")
        return IXMLDOMAttribute(attributeNode)
    }

    /**
     * 
     * @param {BSTR} tagName 
     * @returns {IXMLDOMNodeList} 
     */
    getElementsByTagName(tagName) {
        tagName := tagName is String ? BSTR.Alloc(tagName).Value : tagName

        result := ComCall(50, this, BSTR, tagName, "ptr*", &resultList := 0, "HRESULT")
        return IXMLDOMNodeList(resultList)
    }

    /**
     * Normalizes the specified floating-point vector according to x / length(x).
     * @remarks
     * The **normalize** HLSL intrinsic function uses the following formula: *x* / [**length**](dx-graphics-hlsl-length.md)(*x*).
     * @returns {HRESULT} | Item                                                   | Description                                            |
     * |--------------------------------------------------------|--------------------------------------------------------|
     * | <span id="x"></span><span id="X"></span>*x*<br/> | \[in\] The specified floating-point vector.<br/> |
     * 
     * 
     * 
     *  
     * 
     * 
     * The normalized *x* parameter. If the length of the *x* parameter is 0, the result is indefinite.
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/dx-graphics-hlsl-normalize
     */
    normalize() {
        result := ComCall(51, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXMLDOMElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_tagName := CallbackCreate(GetMethod(implObj, "get_tagName"), flags, 2)
        this.vtbl.getAttribute := CallbackCreate(GetMethod(implObj, "getAttribute"), flags, 3)
        this.vtbl.setAttribute := CallbackCreate(GetMethod(implObj, "setAttribute"), flags, 3)
        this.vtbl.removeAttribute := CallbackCreate(GetMethod(implObj, "removeAttribute"), flags, 2)
        this.vtbl.getAttributeNode := CallbackCreate(GetMethod(implObj, "getAttributeNode"), flags, 3)
        this.vtbl.setAttributeNode := CallbackCreate(GetMethod(implObj, "setAttributeNode"), flags, 3)
        this.vtbl.removeAttributeNode := CallbackCreate(GetMethod(implObj, "removeAttributeNode"), flags, 3)
        this.vtbl.getElementsByTagName := CallbackCreate(GetMethod(implObj, "getElementsByTagName"), flags, 3)
        this.vtbl.normalize := CallbackCreate(GetMethod(implObj, "normalize"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_tagName)
        CallbackFree(this.vtbl.getAttribute)
        CallbackFree(this.vtbl.setAttribute)
        CallbackFree(this.vtbl.removeAttribute)
        CallbackFree(this.vtbl.getAttributeNode)
        CallbackFree(this.vtbl.setAttributeNode)
        CallbackFree(this.vtbl.removeAttributeNode)
        CallbackFree(this.vtbl.getElementsByTagName)
        CallbackFree(this.vtbl.normalize)
    }
}
