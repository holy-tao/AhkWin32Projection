#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPrintSchemaParameterDefinition.ahk
#Include .\IPrintSchemaCapabilities.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaCapabilities2 extends IPrintSchemaCapabilities{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSchemaCapabilities2
     * @type {Guid}
     */
    static IID => Guid("{b58845f4-9970-4d87-a636-169fb82ed642}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParameterDefinition"]

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrNamespaceUri 
     * @returns {IPrintSchemaParameterDefinition} 
     */
    GetParameterDefinition(bstrName, bstrNamespaceUri) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrNamespaceUri := bstrNamespaceUri is String ? BSTR.Alloc(bstrNamespaceUri).Value : bstrNamespaceUri

        result := ComCall(17, this, "ptr", bstrName, "ptr", bstrNamespaceUri, "ptr*", &ppParameterDefinition := 0, "HRESULT")
        return IPrintSchemaParameterDefinition(ppParameterDefinition)
    }
}
