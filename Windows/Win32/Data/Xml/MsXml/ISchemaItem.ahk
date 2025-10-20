#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchemaItem extends IDispatch{
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
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_name(name) {
        result := ComCall(7, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} namespaceURI 
     * @returns {HRESULT} 
     */
    get_namespaceURI(namespaceURI) {
        result := ComCall(8, this, "ptr", namespaceURI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISchema>} schema 
     * @returns {HRESULT} 
     */
    get_schema(schema) {
        result := ComCall(9, this, "ptr", schema, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} id 
     * @returns {HRESULT} 
     */
    get_id(id) {
        result := ComCall(10, this, "ptr", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} itemType 
     * @returns {HRESULT} 
     */
    get_itemType(itemType) {
        result := ComCall(11, this, "int*", itemType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVBSAXAttributes>} attributes 
     * @returns {HRESULT} 
     */
    get_unhandledAttributes(attributes) {
        result := ComCall(12, this, "ptr", attributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} annotationSink 
     * @param {Pointer<VARIANT_BOOL>} isWritten 
     * @returns {HRESULT} 
     */
    writeAnnotation(annotationSink, isWritten) {
        result := ComCall(13, this, "ptr", annotationSink, "ptr", isWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
