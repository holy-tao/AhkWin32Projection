#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPrintSchemaOption.ahk
#Include .\IPrintSchemaDisplayableElement.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaFeature extends IPrintSchemaDisplayableElement{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSchemaFeature
     * @type {Guid}
     */
    static IID => Guid("{ef189461-5d62-4626-8e57-ff83583c4826}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedOption", "put_SelectedOption", "get_SelectionType", "GetOption", "get_DisplayUI"]

    /**
     * 
     * @returns {IPrintSchemaOption} 
     */
    get_SelectedOption() {
        result := ComCall(11, this, "ptr*", &ppOption := 0, "HRESULT")
        return IPrintSchemaOption(ppOption)
    }

    /**
     * 
     * @param {IPrintSchemaOption} pOption 
     * @returns {HRESULT} 
     */
    put_SelectedOption(pOption) {
        result := ComCall(12, this, "ptr", pOption, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionType() {
        result := ComCall(13, this, "int*", &pSelectionType := 0, "HRESULT")
        return pSelectionType
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrNamespaceUri 
     * @returns {IPrintSchemaOption} 
     */
    GetOption(bstrName, bstrNamespaceUri) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrNamespaceUri := bstrNamespaceUri is String ? BSTR.Alloc(bstrNamespaceUri).Value : bstrNamespaceUri

        result := ComCall(14, this, "ptr", bstrName, "ptr", bstrNamespaceUri, "ptr*", &ppOption := 0, "HRESULT")
        return IPrintSchemaOption(ppOption)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_DisplayUI() {
        result := ComCall(15, this, "int*", &pbShow := 0, "HRESULT")
        return pbShow
    }
}
