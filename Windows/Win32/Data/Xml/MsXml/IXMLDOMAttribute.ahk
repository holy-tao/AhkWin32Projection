#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMAttribute extends IXMLDOMNode {
    /**
     * The interface identifier for IXMLDOMAttribute
     * @type {Guid}
     */
    static IID := Guid("{2933bf85-7b36-11d2-b20e-00c04f983e60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMAttribute interfaces
    */
    struct Vtbl extends IXMLDOMNode.Vtbl {
        get_name  : IntPtr
        get_value : IntPtr
        put_value : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMAttribute.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
    }

    /**
     * @type {VARIANT} 
     */
    value {
        get => this.get_value()
        set => this.put_value(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        attributeName := BSTR.Owned()
        result := ComCall(43, this, BSTR.Ptr, attributeName, "HRESULT")
        return attributeName
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_value() {
        attributeValue := VARIANT()
        result := ComCall(44, this, VARIANT.Ptr, attributeValue, "HRESULT")
        return attributeValue
    }

    /**
     * 
     * @param {VARIANT} attributeValue 
     * @returns {HRESULT} 
     */
    put_value(attributeValue) {
        result := ComCall(45, this, VARIANT, attributeValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXMLDOMAttribute.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.get_value := CallbackCreate(GetMethod(implObj, "get_value"), flags, 2)
        this.vtbl.put_value := CallbackCreate(GetMethod(implObj, "put_value"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.get_value)
        CallbackFree(this.vtbl.put_value)
    }
}
