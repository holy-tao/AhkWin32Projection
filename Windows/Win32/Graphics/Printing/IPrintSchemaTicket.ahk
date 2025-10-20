#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPrintSchemaElement.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaTicket extends IPrintSchemaElement{
    /**
     * The interface identifier for IPrintSchemaTicket
     * @type {Guid}
     */
    static IID => Guid("{e480b861-4708-4e6d-a5b4-a2b4eeb9baa4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {BSTR} bstrKeyName 
     * @param {Pointer<IPrintSchemaFeature>} ppFeature 
     * @returns {HRESULT} 
     */
    GetFeatureByKeyName(bstrKeyName, ppFeature) {
        bstrKeyName := bstrKeyName is String ? BSTR.Alloc(bstrKeyName).Value : bstrKeyName

        result := ComCall(10, this, "ptr", bstrKeyName, "ptr", ppFeature, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(11, this, "ptr", bstrName, "ptr", bstrNamespaceUri, "ptr", ppFeature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPrintSchemaAsyncOperation>} ppAsyncOperation 
     * @returns {HRESULT} 
     */
    ValidateAsync(ppAsyncOperation) {
        result := ComCall(12, this, "ptr", ppAsyncOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPrintSchemaTicket>} pPrintTicketCommit 
     * @param {Pointer<IPrintSchemaAsyncOperation>} ppAsyncOperation 
     * @returns {HRESULT} 
     */
    CommitAsync(pPrintTicketCommit, ppAsyncOperation) {
        result := ComCall(13, this, "ptr", pPrintTicketCommit, "ptr", ppAsyncOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyXmlChanged() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPrintSchemaCapabilities>} ppCapabilities 
     * @returns {HRESULT} 
     */
    GetCapabilities(ppCapabilities) {
        result := ComCall(15, this, "ptr", ppCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulJobCopiesAllDocuments 
     * @returns {HRESULT} 
     */
    get_JobCopiesAllDocuments(pulJobCopiesAllDocuments) {
        result := ComCall(16, this, "uint*", pulJobCopiesAllDocuments, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulJobCopiesAllDocuments 
     * @returns {HRESULT} 
     */
    put_JobCopiesAllDocuments(ulJobCopiesAllDocuments) {
        result := ComCall(17, this, "uint", ulJobCopiesAllDocuments, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
