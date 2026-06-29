#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IXMLDOMNamedNodeMap.ahk" { IXMLDOMNamedNodeMap }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMDocumentType extends IXMLDOMNode {
    /**
     * The interface identifier for IXMLDOMDocumentType
     * @type {Guid}
     */
    static IID := Guid("{2933bf8b-7b36-11d2-b20e-00c04f983e60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMDocumentType interfaces
    */
    struct Vtbl extends IXMLDOMNode.Vtbl {
        get_name      : IntPtr
        get_entities  : IntPtr
        get_notations : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMDocumentType.Vtbl()
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
     * @type {IXMLDOMNamedNodeMap} 
     */
    entities {
        get => this.get_entities()
    }

    /**
     * @type {IXMLDOMNamedNodeMap} 
     */
    notations {
        get => this.get_notations()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        rootName := BSTR.Owned()
        result := ComCall(43, this, BSTR.Ptr, rootName, "HRESULT")
        return rootName
    }

    /**
     * 
     * @returns {IXMLDOMNamedNodeMap} 
     */
    get_entities() {
        result := ComCall(44, this, "ptr*", &entityMap := 0, "HRESULT")
        return IXMLDOMNamedNodeMap(entityMap)
    }

    /**
     * 
     * @returns {IXMLDOMNamedNodeMap} 
     */
    get_notations() {
        result := ComCall(45, this, "ptr*", &notationMap := 0, "HRESULT")
        return IXMLDOMNamedNodeMap(notationMap)
    }

    Query(iid) {
        if (IXMLDOMDocumentType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.get_entities := CallbackCreate(GetMethod(implObj, "get_entities"), flags, 2)
        this.vtbl.get_notations := CallbackCreate(GetMethod(implObj, "get_notations"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.get_entities)
        CallbackFree(this.vtbl.get_notations)
    }
}
