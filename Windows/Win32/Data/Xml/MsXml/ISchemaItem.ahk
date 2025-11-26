#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ISchema.ahk
#Include .\IVBSAXAttributes.ahk
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
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
    }

    /**
     * @type {BSTR} 
     */
    namespaceURI {
        get => this.get_namespaceURI()
    }

    /**
     * @type {ISchema} 
     */
    schema {
        get => this.get_schema()
    }

    /**
     * @type {BSTR} 
     */
    id {
        get => this.get_id()
    }

    /**
     * @type {Integer} 
     */
    itemType {
        get => this.get_itemType()
    }

    /**
     * @type {IVBSAXAttributes} 
     */
    unhandledAttributes {
        get => this.get_unhandledAttributes()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        name := BSTR()
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_namespaceURI() {
        namespaceURI := BSTR()
        result := ComCall(8, this, "ptr", namespaceURI, "HRESULT")
        return namespaceURI
    }

    /**
     * 
     * @returns {ISchema} 
     */
    get_schema() {
        result := ComCall(9, this, "ptr*", &schema := 0, "HRESULT")
        return ISchema(schema)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_id() {
        id := BSTR()
        result := ComCall(10, this, "ptr", id, "HRESULT")
        return id
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_itemType() {
        result := ComCall(11, this, "int*", &itemType := 0, "HRESULT")
        return itemType
    }

    /**
     * 
     * @returns {IVBSAXAttributes} 
     */
    get_unhandledAttributes() {
        result := ComCall(12, this, "ptr*", &attributes := 0, "HRESULT")
        return IVBSAXAttributes(attributes)
    }

    /**
     * 
     * @param {IUnknown} annotationSink 
     * @returns {VARIANT_BOOL} 
     */
    writeAnnotation(annotationSink) {
        result := ComCall(13, this, "ptr", annotationSink, "short*", &isWritten := 0, "HRESULT")
        return isWritten
    }
}
