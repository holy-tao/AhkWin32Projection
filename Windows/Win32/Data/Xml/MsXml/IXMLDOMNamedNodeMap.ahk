#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMNamedNodeMap extends IDispatch{
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
     * 
     * @param {BSTR} name 
     * @param {Pointer<IXMLDOMNode>} namedItem 
     * @returns {HRESULT} 
     */
    getNamedItem(name, namedItem) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(7, this, "ptr", name, "ptr", namedItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} newItem 
     * @param {Pointer<IXMLDOMNode>} nameItem 
     * @returns {HRESULT} 
     */
    setNamedItem(newItem, nameItem) {
        result := ComCall(8, this, "ptr", newItem, "ptr", nameItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IXMLDOMNode>} namedItem 
     * @returns {HRESULT} 
     */
    removeNamedItem(name, namedItem) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(9, this, "ptr", name, "ptr", namedItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IXMLDOMNode>} listItem 
     * @returns {HRESULT} 
     */
    get_item(index, listItem) {
        result := ComCall(10, this, "int", index, "ptr", listItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} listLength 
     * @returns {HRESULT} 
     */
    get_length(listLength) {
        result := ComCall(11, this, "int*", listLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} baseName 
     * @param {BSTR} namespaceURI 
     * @param {Pointer<IXMLDOMNode>} qualifiedItem 
     * @returns {HRESULT} 
     */
    getQualifiedItem(baseName, namespaceURI, qualifiedItem) {
        baseName := baseName is String ? BSTR.Alloc(baseName).Value : baseName
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(12, this, "ptr", baseName, "ptr", namespaceURI, "ptr", qualifiedItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} baseName 
     * @param {BSTR} namespaceURI 
     * @param {Pointer<IXMLDOMNode>} qualifiedItem 
     * @returns {HRESULT} 
     */
    removeQualifiedItem(baseName, namespaceURI, qualifiedItem) {
        baseName := baseName is String ? BSTR.Alloc(baseName).Value : baseName
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(13, this, "ptr", baseName, "ptr", namespaceURI, "ptr", qualifiedItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} nextItem 
     * @returns {HRESULT} 
     */
    nextNode(nextItem) {
        result := ComCall(14, this, "ptr", nextItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    reset() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get__newEnum(ppUnk) {
        result := ComCall(16, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
