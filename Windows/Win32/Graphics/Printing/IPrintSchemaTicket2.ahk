#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPrintSchemaTicket.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaTicket2 extends IPrintSchemaTicket{
    /**
     * The interface identifier for IPrintSchemaTicket2
     * @type {Guid}
     */
    static IID => Guid("{2ec1f844-766a-47a1-91f4-2eeb6190f80c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrNamespaceUri 
     * @param {Pointer<IPrintSchemaParameterInitializer>} ppParameterInitializer 
     * @returns {HRESULT} 
     */
    GetParameterInitializer(bstrName, bstrNamespaceUri, ppParameterInitializer) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrNamespaceUri := bstrNamespaceUri is String ? BSTR.Alloc(bstrNamespaceUri).Value : bstrNamespaceUri

        result := ComCall(18, this, "ptr", bstrName, "ptr", bstrNamespaceUri, "ptr", ppParameterInitializer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
