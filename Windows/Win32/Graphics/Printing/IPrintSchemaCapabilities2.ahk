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
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }
        if(bstrNamespaceUri is String) {
            pin := BSTR.Alloc(bstrNamespaceUri)
            bstrNamespaceUri := pin.Value
        }

        result := ComCall(17, this, "ptr", bstrName, "ptr", bstrNamespaceUri, "ptr*", &ppParameterDefinition := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPrintSchemaParameterDefinition(ppParameterDefinition)
    }
}
