#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IXMLElementCollection.ahk" { IXMLElementCollection }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLElement extends IDispatch {
    /**
     * The interface identifier for IXMLElement
     * @type {Guid}
     */
    static IID := Guid("{3f7f31ac-e15f-11d0-9c25-00c04fc99c8e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_tagName     : IntPtr
        put_tagName     : IntPtr
        get_parent      : IntPtr
        setAttribute    : IntPtr
        getAttribute    : IntPtr
        removeAttribute : IntPtr
        get_children    : IntPtr
        get_type        : IntPtr
        get_text        : IntPtr
        put_text        : IntPtr
        addChild        : IntPtr
        removeChild     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    tagName {
        get => this.get_tagName()
        set => this.put_tagName(value)
    }

    /**
     * @type {IXMLElement} 
     */
    parent {
        get => this.get_parent()
    }

    /**
     * @type {IXMLElementCollection} 
     */
    children {
        get => this.get_children()
    }

    /**
     * @type {Integer} 
     */
    type {
        get => this.get_type()
    }

    /**
     * @type {BSTR} 
     */
    text {
        get => this.get_text()
        set => this.put_text(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_tagName() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} p 
     * @returns {HRESULT} 
     */
    put_tagName(p) {
        p := p is String ? BSTR.Alloc(p).Value : p

        result := ComCall(8, this, BSTR, p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXMLElement} 
     */
    get_parent() {
        result := ComCall(9, this, "ptr*", &ppParent := 0, "HRESULT")
        return IXMLElement(ppParent)
    }

    /**
     * 
     * @param {BSTR} strPropertyName 
     * @param {VARIANT} _PropertyValue 
     * @returns {HRESULT} 
     */
    setAttribute(strPropertyName, _PropertyValue) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        result := ComCall(10, this, BSTR, strPropertyName, VARIANT, _PropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strPropertyName 
     * @returns {VARIANT} 
     */
    getAttribute(strPropertyName) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        _PropertyValue := VARIANT()
        result := ComCall(11, this, BSTR, strPropertyName, VARIANT.Ptr, _PropertyValue, "HRESULT")
        return _PropertyValue
    }

    /**
     * 
     * @param {BSTR} strPropertyName 
     * @returns {HRESULT} 
     */
    removeAttribute(strPropertyName) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        result := ComCall(12, this, BSTR, strPropertyName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXMLElementCollection} 
     */
    get_children() {
        result := ComCall(13, this, "ptr*", &pp := 0, "HRESULT")
        return IXMLElementCollection(pp)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_type() {
        result := ComCall(14, this, "int*", &plType := 0, "HRESULT")
        return plType
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_text() {
        p := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} p 
     * @returns {HRESULT} 
     */
    put_text(p) {
        p := p is String ? BSTR.Alloc(p).Value : p

        result := ComCall(16, this, BSTR, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLElement} pChildElem 
     * @param {Integer} lIndex 
     * @param {Integer} lReserved 
     * @returns {HRESULT} 
     */
    addChild(pChildElem, lIndex, lReserved) {
        result := ComCall(17, this, "ptr", pChildElem, "int", lIndex, "int", lReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLElement} pChildElem 
     * @returns {HRESULT} 
     */
    removeChild(pChildElem) {
        result := ComCall(18, this, "ptr", pChildElem, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXMLElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_tagName := CallbackCreate(GetMethod(implObj, "get_tagName"), flags, 2)
        this.vtbl.put_tagName := CallbackCreate(GetMethod(implObj, "put_tagName"), flags, 2)
        this.vtbl.get_parent := CallbackCreate(GetMethod(implObj, "get_parent"), flags, 2)
        this.vtbl.setAttribute := CallbackCreate(GetMethod(implObj, "setAttribute"), flags, 3)
        this.vtbl.getAttribute := CallbackCreate(GetMethod(implObj, "getAttribute"), flags, 3)
        this.vtbl.removeAttribute := CallbackCreate(GetMethod(implObj, "removeAttribute"), flags, 2)
        this.vtbl.get_children := CallbackCreate(GetMethod(implObj, "get_children"), flags, 2)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.get_text := CallbackCreate(GetMethod(implObj, "get_text"), flags, 2)
        this.vtbl.put_text := CallbackCreate(GetMethod(implObj, "put_text"), flags, 2)
        this.vtbl.addChild := CallbackCreate(GetMethod(implObj, "addChild"), flags, 4)
        this.vtbl.removeChild := CallbackCreate(GetMethod(implObj, "removeChild"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_tagName)
        CallbackFree(this.vtbl.put_tagName)
        CallbackFree(this.vtbl.get_parent)
        CallbackFree(this.vtbl.setAttribute)
        CallbackFree(this.vtbl.getAttribute)
        CallbackFree(this.vtbl.removeAttribute)
        CallbackFree(this.vtbl.get_children)
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.get_text)
        CallbackFree(this.vtbl.put_text)
        CallbackFree(this.vtbl.addChild)
        CallbackFree(this.vtbl.removeChild)
    }
}
