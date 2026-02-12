#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPrintSchemaFeature.ahk
#Include .\IPrintSchemaPageImageableSize.ahk
#Include .\IPrintSchemaOption.ahk
#Include .\IPrintSchemaOptionCollection.ahk
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
     * @type {IPrintSchemaPageImageableSize} 
     */
    PageImageableSize {
        get => this.get_PageImageableSize()
    }

    /**
     * @type {Integer} 
     */
    JobCopiesAllDocumentsMinValue {
        get => this.get_JobCopiesAllDocumentsMinValue()
    }

    /**
     * @type {Integer} 
     */
    JobCopiesAllDocumentsMaxValue {
        get => this.get_JobCopiesAllDocumentsMaxValue()
    }

    /**
     * 
     * @param {BSTR} bstrKeyName 
     * @returns {IPrintSchemaFeature} 
     */
    GetFeatureByKeyName(bstrKeyName) {
        if(bstrKeyName is String) {
            pin := BSTR.Alloc(bstrKeyName)
            bstrKeyName := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrKeyName, "ptr*", &ppFeature := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPrintSchemaFeature(ppFeature)
    }

    /**
     * This function is intended for infrastructure use only. (GetFeatureEnabledState)
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrNamespaceUri 
     * @returns {IPrintSchemaFeature} 
     * @see https://learn.microsoft.com/windows/win32/api//content/featurestagingapi/nf-featurestagingapi-getfeatureenabledstate
     */
    GetFeature(bstrName, bstrNamespaceUri) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }
        if(bstrNamespaceUri is String) {
            pin := BSTR.Alloc(bstrNamespaceUri)
            bstrNamespaceUri := pin.Value
        }

        result := ComCall(11, this, "ptr", bstrName, "ptr", bstrNamespaceUri, "ptr*", &ppFeature := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPrintSchemaFeature(ppFeature)
    }

    /**
     * 
     * @returns {IPrintSchemaPageImageableSize} 
     */
    get_PageImageableSize() {
        result := ComCall(12, this, "ptr*", &ppPageImageableSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPrintSchemaPageImageableSize(ppPageImageableSize)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_JobCopiesAllDocumentsMinValue() {
        result := ComCall(13, this, "uint*", &pulJobCopiesAllDocumentsMinValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulJobCopiesAllDocumentsMinValue
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_JobCopiesAllDocumentsMaxValue() {
        result := ComCall(14, this, "uint*", &pulJobCopiesAllDocumentsMaxValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulJobCopiesAllDocumentsMaxValue
    }

    /**
     * 
     * @param {IPrintSchemaFeature} pFeature 
     * @returns {IPrintSchemaOption} 
     */
    GetSelectedOptionInPrintTicket(pFeature) {
        result := ComCall(15, this, "ptr", pFeature, "ptr*", &ppOption := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPrintSchemaOption(ppOption)
    }

    /**
     * 
     * @param {IPrintSchemaFeature} pFeature 
     * @returns {IPrintSchemaOptionCollection} 
     */
    GetOptions(pFeature) {
        result := ComCall(16, this, "ptr", pFeature, "ptr*", &ppOptionCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPrintSchemaOptionCollection(ppOptionCollection)
    }
}
