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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFeatureByKeyName", "GetFeature", "ValidateAsync", "CommitAsync", "NotifyXmlChanged", "GetCapabilities", "get_JobCopiesAllDocuments", "put_JobCopiesAllDocuments"]

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
     * @param {Pointer<IPrintSchemaAsyncOperation>} ppAsyncOperation 
     * @returns {HRESULT} 
     */
    ValidateAsync(ppAsyncOperation) {
        result := ComCall(12, this, "ptr*", ppAsyncOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPrintSchemaTicket} pPrintTicketCommit 
     * @param {Pointer<IPrintSchemaAsyncOperation>} ppAsyncOperation 
     * @returns {HRESULT} 
     */
    CommitAsync(pPrintTicketCommit, ppAsyncOperation) {
        result := ComCall(13, this, "ptr", pPrintTicketCommit, "ptr*", ppAsyncOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyXmlChanged() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPrintSchemaCapabilities>} ppCapabilities 
     * @returns {HRESULT} 
     */
    GetCapabilities(ppCapabilities) {
        result := ComCall(15, this, "ptr*", ppCapabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulJobCopiesAllDocuments 
     * @returns {HRESULT} 
     */
    get_JobCopiesAllDocuments(pulJobCopiesAllDocuments) {
        pulJobCopiesAllDocumentsMarshal := pulJobCopiesAllDocuments is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pulJobCopiesAllDocumentsMarshal, pulJobCopiesAllDocuments, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulJobCopiesAllDocuments 
     * @returns {HRESULT} 
     */
    put_JobCopiesAllDocuments(ulJobCopiesAllDocuments) {
        result := ComCall(17, this, "uint", ulJobCopiesAllDocuments, "HRESULT")
        return result
    }
}
