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
class IXMLDOMNamedNodeMap extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMNamedNodeMap
     * @type {Guid}
     */
    static IID => Guid("{2933bf83-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getNamedItem", "setNamedItem", "removeNamedItem", "get_item", "get_length", "getQualifiedItem", "removeQualifiedItem", "nextNode", "reset", "get__newEnum"]

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
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(7, this, "ptr", name, "ptr*", &namedItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMNode(namedItem)
    }

    /**
     * 
     * @param {IXMLDOMNode} newItem 
     * @returns {IXMLDOMNode} 
     */
    setNamedItem(newItem) {
        result := ComCall(8, this, "ptr", newItem, "ptr*", &nameItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMNode(nameItem)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IXMLDOMNode} 
     */
    removeNamedItem(name) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(9, this, "ptr", name, "ptr*", &namedItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMNode(namedItem)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IXMLDOMNode} 
     */
    get_item(index) {
        result := ComCall(10, this, "int", index, "ptr*", &listItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMNode(listItem)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(11, this, "int*", &listLength := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return listLength
    }

    /**
     * 
     * @param {BSTR} baseName 
     * @param {BSTR} namespaceURI 
     * @returns {IXMLDOMNode} 
     */
    getQualifiedItem(baseName, namespaceURI) {
        if(baseName is String) {
            pin := BSTR.Alloc(baseName)
            baseName := pin.Value
        }
        if(namespaceURI is String) {
            pin := BSTR.Alloc(namespaceURI)
            namespaceURI := pin.Value
        }

        result := ComCall(12, this, "ptr", baseName, "ptr", namespaceURI, "ptr*", &qualifiedItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMNode(qualifiedItem)
    }

    /**
     * 
     * @param {BSTR} baseName 
     * @param {BSTR} namespaceURI 
     * @returns {IXMLDOMNode} 
     */
    removeQualifiedItem(baseName, namespaceURI) {
        if(baseName is String) {
            pin := BSTR.Alloc(baseName)
            baseName := pin.Value
        }
        if(namespaceURI is String) {
            pin := BSTR.Alloc(namespaceURI)
            namespaceURI := pin.Value
        }

        result := ComCall(13, this, "ptr", baseName, "ptr", namespaceURI, "ptr*", &qualifiedItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMNode(qualifiedItem)
    }

    /**
     * 
     * @returns {IXMLDOMNode} 
     */
    nextNode() {
        result := ComCall(14, this, "ptr*", &nextItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXMLDOMNode(nextItem)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    reset() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(16, this, "ptr*", &ppUnk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppUnk)
    }
}
