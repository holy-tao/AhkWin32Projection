#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPrintSchemaElement.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaCapabilities extends IPrintSchemaElement{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSchemaCapabilities
     * @type {Guid}
     */
    static IID => Guid("{5a577640-501d-4927-bcd0-5ef57a7ed175}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFeatureByKeyName", "GetFeature", "get_PageImageableSize", "get_JobCopiesAllDocumentsMinValue", "get_JobCopiesAllDocumentsMaxValue", "GetSelectedOptionInPrintTicket", "GetOptions"]

    /**
     * 
     * @param {BSTR} bstrKeyName 
     * @param {Pointer<IPrintSchemaFeature>} ppFeature 
     * @returns {HRESULT} 
     */
    GetFeatureByKeyName(bstrKeyName, ppFeature) {
        bstrKeyName := bstrKeyName is String ? BSTR.Alloc(bstrKeyName).Value : bstrKeyName

        result := ComCall(10, this, "ptr", bstrKeyName, "ptr*", ppFeature, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrNamespaceUri 
     * @param {Pointer<IPrintSchemaFeature>} ppFeature 
     * @returns {HRESULT} 
     */
    GetFeature(bstrName, bstrNamespaceUri, ppFeature) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrNamespaceUri := bstrNamespaceUri is String ? BSTR.Alloc(bstrNamespaceUri).Value : bstrNamespaceUri

        result := ComCall(11, this, "ptr", bstrName, "ptr", bstrNamespaceUri, "ptr*", ppFeature, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPrintSchemaPageImageableSize>} ppPageImageableSize 
     * @returns {HRESULT} 
     */
    get_PageImageableSize(ppPageImageableSize) {
        result := ComCall(12, this, "ptr*", ppPageImageableSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulJobCopiesAllDocumentsMinValue 
     * @returns {HRESULT} 
     */
    get_JobCopiesAllDocumentsMinValue(pulJobCopiesAllDocumentsMinValue) {
        pulJobCopiesAllDocumentsMinValueMarshal := pulJobCopiesAllDocumentsMinValue is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pulJobCopiesAllDocumentsMinValueMarshal, pulJobCopiesAllDocumentsMinValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulJobCopiesAllDocumentsMaxValue 
     * @returns {HRESULT} 
     */
    get_JobCopiesAllDocumentsMaxValue(pulJobCopiesAllDocumentsMaxValue) {
        pulJobCopiesAllDocumentsMaxValueMarshal := pulJobCopiesAllDocumentsMaxValue is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pulJobCopiesAllDocumentsMaxValueMarshal, pulJobCopiesAllDocumentsMaxValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPrintSchemaFeature} pFeature 
     * @param {Pointer<IPrintSchemaOption>} ppOption 
     * @returns {HRESULT} 
     */
    GetSelectedOptionInPrintTicket(pFeature, ppOption) {
        result := ComCall(15, this, "ptr", pFeature, "ptr*", ppOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPrintSchemaFeature} pFeature 
     * @param {Pointer<IPrintSchemaOptionCollection>} ppOptionCollection 
     * @returns {HRESULT} 
     */
    GetOptions(pFeature, ppOptionCollection) {
        result := ComCall(16, this, "ptr", pFeature, "ptr*", ppOptionCollection, "HRESULT")
        return result
    }
}
