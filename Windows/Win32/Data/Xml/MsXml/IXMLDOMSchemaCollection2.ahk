#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLDOMSchemaCollection.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMSchemaCollection2 extends IXMLDOMSchemaCollection{
    /**
     * The interface identifier for IXMLDOMSchemaCollection2
     * @type {Guid}
     */
    static IID => Guid("{50ea08b0-dd1b-4664-9a50-c2f40f4bd79a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @returns {HRESULT} 
     */
    validate() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} validateOnLoad 
     * @returns {HRESULT} 
     */
    put_validateOnLoad(validateOnLoad) {
        result := ComCall(15, this, "short", validateOnLoad, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} validateOnLoad 
     * @returns {HRESULT} 
     */
    get_validateOnLoad(validateOnLoad) {
        result := ComCall(16, this, "ptr", validateOnLoad, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} namespaceURI 
     * @param {Pointer<ISchema>} schema 
     * @returns {HRESULT} 
     */
    getSchema(namespaceURI, schema) {
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(17, this, "ptr", namespaceURI, "ptr", schema, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMNode>} node 
     * @param {Pointer<ISchemaItem>} item 
     * @returns {HRESULT} 
     */
    getDeclaration(node, item) {
        result := ComCall(18, this, "ptr", node, "ptr", item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
