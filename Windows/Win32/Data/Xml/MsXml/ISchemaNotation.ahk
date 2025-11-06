#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ISchemaItem.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchemaNotation extends ISchemaItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISchemaNotation
     * @type {Guid}
     */
    static IID => Guid("{50ea08be-dd1b-4664-9a50-c2f40f4bd79a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_systemIdentifier", "get_publicIdentifier"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_systemIdentifier() {
        uri := BSTR()
        result := ComCall(14, this, "ptr", uri, "HRESULT")
        return uri
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_publicIdentifier() {
        uri := BSTR()
        result := ComCall(15, this, "ptr", uri, "HRESULT")
        return uri
    }
}
