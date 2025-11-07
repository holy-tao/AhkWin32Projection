#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPrintSchemaParameterInitializer.ahk
#Include .\IPrintSchemaTicket.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaTicket2 extends IPrintSchemaTicket{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParameterInitializer"]

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrNamespaceUri 
     * @returns {IPrintSchemaParameterInitializer} 
     */
    GetParameterInitializer(bstrName, bstrNamespaceUri) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrNamespaceUri := bstrNamespaceUri is String ? BSTR.Alloc(bstrNamespaceUri).Value : bstrNamespaceUri

        result := ComCall(18, this, "ptr", bstrName, "ptr", bstrNamespaceUri, "ptr*", &ppParameterInitializer := 0, "HRESULT")
        return IPrintSchemaParameterInitializer(ppParameterInitializer)
    }
}
