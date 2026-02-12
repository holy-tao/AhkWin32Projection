#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPrintSchemaFeature.ahk
#Include .\IPrintSchemaAsyncOperation.ahk
#Include .\IPrintSchemaCapabilities.ahk
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
     * @type {Integer} 
     */
    JobCopiesAllDocuments {
        get => this.get_JobCopiesAllDocuments()
        set => this.put_JobCopiesAllDocuments(value)
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
     * @returns {IPrintSchemaAsyncOperation} 
     */
    ValidateAsync() {
        result := ComCall(12, this, "ptr*", &ppAsyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPrintSchemaAsyncOperation(ppAsyncOperation)
    }

    /**
     * 
     * @param {IPrintSchemaTicket} pPrintTicketCommit 
     * @returns {IPrintSchemaAsyncOperation} 
     */
    CommitAsync(pPrintTicketCommit) {
        result := ComCall(13, this, "ptr", pPrintTicketCommit, "ptr*", &ppAsyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPrintSchemaAsyncOperation(ppAsyncOperation)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyXmlChanged() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the length of a monitor's capabilities string.
     * @remarks
     * This function usually returns quickly, but sometimes it can take several seconds to complete.
     * @returns {IPrintSchemaCapabilities} 
     * @see https://learn.microsoft.com/windows/win32/api//content/lowlevelmonitorconfigurationapi/nf-lowlevelmonitorconfigurationapi-getcapabilitiesstringlength
     */
    GetCapabilities() {
        result := ComCall(15, this, "ptr*", &ppCapabilities := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPrintSchemaCapabilities(ppCapabilities)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_JobCopiesAllDocuments() {
        result := ComCall(16, this, "uint*", &pulJobCopiesAllDocuments := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulJobCopiesAllDocuments
    }

    /**
     * 
     * @param {Integer} ulJobCopiesAllDocuments 
     * @returns {HRESULT} 
     */
    put_JobCopiesAllDocuments(ulJobCopiesAllDocuments) {
        result := ComCall(17, this, "uint", ulJobCopiesAllDocuments, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
