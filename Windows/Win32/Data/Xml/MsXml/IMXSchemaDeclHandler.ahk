#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IMXSchemaDeclHandler extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMXSchemaDeclHandler
     * @type {Guid}
     */
    static IID => Guid("{fa4bb38c-faf9-4cca-9302-d1dd0fe520db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["schemaElementDecl"]

    /**
     * 
     * @param {ISchemaElement} oSchemaElement 
     * @returns {HRESULT} 
     */
    schemaElementDecl(oSchemaElement) {
        result := ComCall(7, this, "ptr", oSchemaElement, "HRESULT")
        return result
    }
}
