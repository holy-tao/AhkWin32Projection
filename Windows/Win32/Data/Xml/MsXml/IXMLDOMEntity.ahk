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
export default struct IXMLDOMEntity extends IXMLDOMNode {
    /**
     * The interface identifier for IXMLDOMEntity
     * @type {Guid}
     */
    static IID := Guid("{2933bf8d-7b36-11d2-b20e-00c04f983e60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMEntity interfaces
    */
    struct Vtbl extends IXMLDOMNode.Vtbl {
        get_publicId     : IntPtr
        get_systemId     : IntPtr
        get_notationName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMEntity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    publicId {
        get => this.get_publicId()
    }

    /**
     * @type {VARIANT} 
     */
    systemId {
        get => this.get_systemId()
    }

    /**
     * @type {BSTR} 
     */
    notationName {
        get => this.get_notationName()
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_publicId() {
        publicID := VARIANT()
        result := ComCall(43, this, VARIANT.Ptr, publicID, "HRESULT")
        return publicID
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_systemId() {
        systemID := VARIANT()
        result := ComCall(44, this, VARIANT.Ptr, systemID, "HRESULT")
        return systemID
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_notationName() {
        name := BSTR.Owned()
        result := ComCall(45, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    Query(iid) {
        if (IXMLDOMEntity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_publicId := CallbackCreate(GetMethod(implObj, "get_publicId"), flags, 2)
        this.vtbl.get_systemId := CallbackCreate(GetMethod(implObj, "get_systemId"), flags, 2)
        this.vtbl.get_notationName := CallbackCreate(GetMethod(implObj, "get_notationName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_publicId)
        CallbackFree(this.vtbl.get_systemId)
        CallbackFree(this.vtbl.get_notationName)
    }
}
