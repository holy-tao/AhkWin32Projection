#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLDOMNode.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMSchemaCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMSchemaCollection
     * @type {Guid}
     */
    static IID => Guid("{373984c8-b845-449b-91e7-45ac83036ade}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add", "get", "remove", "get_length", "get_namespaceURI", "addCollection", "get__newEnum"]

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
     * @param {BSTR} namespaceURI 
     * @param {VARIANT} var 
     * @returns {HRESULT} 
     */
    add(namespaceURI, var) {
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(7, this, "ptr", namespaceURI, "ptr", var, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} namespaceURI 
     * @returns {IXMLDOMNode} 
     */
    get(namespaceURI) {
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(8, this, "ptr", namespaceURI, "ptr*", &schemaNode := 0, "HRESULT")
        return IXMLDOMNode(schemaNode)
    }

    /**
     * 
     * @param {BSTR} namespaceURI 
     * @returns {HRESULT} 
     */
    remove(namespaceURI) {
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(9, this, "ptr", namespaceURI, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(10, this, "int*", &length := 0, "HRESULT")
        return length
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    get_namespaceURI(index) {
        length := BSTR()
        result := ComCall(11, this, "int", index, "ptr", length, "HRESULT")
        return length
    }

    /**
     * 
     * @param {IXMLDOMSchemaCollection} otherCollection 
     * @returns {HRESULT} 
     */
    addCollection(otherCollection) {
        result := ComCall(12, this, "ptr", otherCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(13, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }
}
