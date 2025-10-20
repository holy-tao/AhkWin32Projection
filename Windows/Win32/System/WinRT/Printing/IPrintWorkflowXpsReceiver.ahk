#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Printing
 * @version v4.0.30319
 */
class IPrintWorkflowXpsReceiver extends IUnknown{
    /**
     * The interface identifier for IPrintWorkflowXpsReceiver
     * @type {Guid}
     */
    static IID => Guid("{04097374-77b8-47f6-8167-aae29d4cf84b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IStream>} documentSequencePrintTicket 
     * @returns {HRESULT} 
     */
    SetDocumentSequencePrintTicket(documentSequencePrintTicket) {
        result := ComCall(3, this, "ptr", documentSequencePrintTicket, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} documentSequenceUri 
     * @returns {HRESULT} 
     */
    SetDocumentSequenceUri(documentSequenceUri) {
        documentSequenceUri := documentSequenceUri is String ? StrPtr(documentSequenceUri) : documentSequenceUri

        result := ComCall(4, this, "ptr", documentSequenceUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} documentId 
     * @param {Pointer<IStream>} documentPrintTicket 
     * @param {PWSTR} documentUri 
     * @returns {HRESULT} 
     */
    AddDocumentData(documentId, documentPrintTicket, documentUri) {
        documentUri := documentUri is String ? StrPtr(documentUri) : documentUri

        result := ComCall(5, this, "uint", documentId, "ptr", documentPrintTicket, "ptr", documentUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} documentId 
     * @param {Integer} pageId 
     * @param {Pointer<IXpsOMPageReference>} pageReference 
     * @param {PWSTR} pageUri 
     * @returns {HRESULT} 
     */
    AddPage(documentId, pageId, pageReference, pageUri) {
        pageUri := pageUri is String ? StrPtr(pageUri) : pageUri

        result := ComCall(6, this, "uint", documentId, "uint", pageId, "ptr", pageReference, "ptr", pageUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
