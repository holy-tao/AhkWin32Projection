#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchemaItem extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISchemaItem
     * @type {Guid}
     */
    static IID => Guid("{50ea08b3-dd1b-4664-9a50-c2f40f4bd79a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_name", "get_namespaceURI", "get_schema", "get_id", "get_itemType", "get_unhandledAttributes", "writeAnnotation"]

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_name(name) {
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} namespaceURI 
     * @returns {HRESULT} 
     */
    get_namespaceURI(namespaceURI) {
        result := ComCall(8, this, "ptr", namespaceURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchema>} schema 
     * @returns {HRESULT} 
     */
    get_schema(schema) {
        result := ComCall(9, this, "ptr*", schema, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} id 
     * @returns {HRESULT} 
     */
    get_id(id) {
        result := ComCall(10, this, "ptr", id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} itemType 
     * @returns {HRESULT} 
     */
    get_itemType(itemType) {
        itemTypeMarshal := itemType is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, itemTypeMarshal, itemType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVBSAXAttributes>} attributes 
     * @returns {HRESULT} 
     */
    get_unhandledAttributes(attributes) {
        result := ComCall(12, this, "ptr*", attributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} annotationSink 
     * @param {Pointer<VARIANT_BOOL>} isWritten 
     * @returns {HRESULT} 
     */
    writeAnnotation(annotationSink, isWritten) {
        result := ComCall(13, this, "ptr", annotationSink, "ptr", isWritten, "HRESULT")
        return result
    }
}
