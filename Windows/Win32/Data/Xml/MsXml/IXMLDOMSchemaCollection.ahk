#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<IXMLDOMNode>} schemaNode 
     * @returns {HRESULT} 
     */
    get(namespaceURI, schemaNode) {
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(8, this, "ptr", namespaceURI, "ptr*", schemaNode, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} length 
     * @returns {HRESULT} 
     */
    get_length(length) {
        result := ComCall(10, this, "int*", length, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} length 
     * @returns {HRESULT} 
     */
    get_namespaceURI(index, length) {
        result := ComCall(11, this, "int", index, "ptr", length, "HRESULT")
        return result
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
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get__newEnum(ppUnk) {
        result := ComCall(13, this, "ptr*", ppUnk, "HRESULT")
        return result
    }
}
