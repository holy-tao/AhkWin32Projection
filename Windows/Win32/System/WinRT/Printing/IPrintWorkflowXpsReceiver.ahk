#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Printing
 * @version v4.0.30319
 */
class IPrintWorkflowXpsReceiver extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDocumentSequencePrintTicket", "SetDocumentSequenceUri", "AddDocumentData", "AddPage", "Close"]

    /**
     * 
     * @param {IStream} documentSequencePrintTicket 
     * @returns {HRESULT} 
     */
    SetDocumentSequencePrintTicket(documentSequencePrintTicket) {
        result := ComCall(3, this, "ptr", documentSequencePrintTicket, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} documentId 
     * @param {IStream} documentPrintTicket 
     * @param {PWSTR} documentUri 
     * @returns {HRESULT} 
     */
    AddDocumentData(documentId, documentPrintTicket, documentUri) {
        documentUri := documentUri is String ? StrPtr(documentUri) : documentUri

        result := ComCall(5, this, "uint", documentId, "ptr", documentPrintTicket, "ptr", documentUri, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a new instance of the [AddPagesEventArgs](addpageseventargs.md) class.
     * @param {Integer} documentId 
     * @param {Integer} pageId 
     * @param {IXpsOMPageReference} pageReference 
     * @param {PWSTR} pageUri 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.addpageseventargs.#ctor
     */
    AddPage(documentId, pageId, pageReference, pageUri) {
        pageUri := pageUri is String ? StrPtr(pageUri) : pageUri

        result := ComCall(6, this, "uint", documentId, "uint", pageId, "ptr", pageReference, "ptr", pageUri, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * MSSQLSERVER_4064
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/errors-events/mssqlserver-4064-database-engine-error
     */
    Close() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
