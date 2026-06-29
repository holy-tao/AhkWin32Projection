#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISchemaStringCollection.ahk
#Include .\ISchemaParticle.ahk
#Include ..\..\..\Foundation\HRESULT.ahk
#Include .\SCHEMAPROCESSCONTENTS.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class ISchemaAny extends ISchemaParticle {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISchemaAny
     * @type {Guid}
     */
    static IID => Guid("{50ea08bc-dd1b-4664-9a50-c2f40f4bd79a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_namespaces", "get_processContents"]

    /**
     * @type {ISchemaStringCollection} 
     */
    namespaces {
        get => this.get_namespaces()
    }

    /**
     * @type {SCHEMAPROCESSCONTENTS} 
     */
    processContents {
        get => this.get_processContents()
    }

    /**
     * 
     * @returns {ISchemaStringCollection} 
     */
    get_namespaces() {
        result := ComCall(16, this, "ptr*", &namespaces := 0, "HRESULT")
        return ISchemaStringCollection(namespaces)
    }

    /**
     * 
     * @returns {SCHEMAPROCESSCONTENTS} 
     */
    get_processContents() {
        result := ComCall(17, this, "int*", &processContents := 0, "HRESULT")
        return processContents
    }
}
