#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Com\IStream.ahk" { IStream }
#Import "..\..\..\Storage\Xps\IXpsOMPageReference.ahk" { IXpsOMPageReference }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Printing
 */
export default struct IPrintWorkflowXpsReceiver extends IUnknown {
    /**
     * The interface identifier for IPrintWorkflowXpsReceiver
     * @type {Guid}
     */
    static IID := Guid("{04097374-77b8-47f6-8167-aae29d4cf84b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintWorkflowXpsReceiver interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDocumentSequencePrintTicket : IntPtr
        SetDocumentSequenceUri         : IntPtr
        AddDocumentData                : IntPtr
        AddPage                        : IntPtr
        Close                          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintWorkflowXpsReceiver.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IStream} documentSequencePrintTicket 
     * @returns {HRESULT} 
     */
    SetDocumentSequencePrintTicket(documentSequencePrintTicket) {
        result := ComCall(3, this, "ptr", documentSequencePrintTicket, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} documentSequenceUri 
     * @returns {HRESULT} 
     */
    SetDocumentSequenceUri(documentSequenceUri) {
        documentSequenceUri := documentSequenceUri is String ? StrPtr(documentSequenceUri) : documentSequenceUri

        result := ComCall(4, this, "ptr", documentSequenceUri, "HRESULT")
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

        result := ComCall(5, this, "uint", documentId, "ptr", documentPrintTicket, "ptr", documentUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} documentId 
     * @param {Integer} pageId 
     * @param {IXpsOMPageReference} pageReference 
     * @param {PWSTR} pageUri 
     * @returns {HRESULT} 
     */
    AddPage(documentId, pageId, pageReference, pageUri) {
        pageUri := pageUri is String ? StrPtr(pageUri) : pageUri

        result := ComCall(6, this, "uint", documentId, "uint", pageId, "ptr", pageReference, "ptr", pageUri, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintWorkflowXpsReceiver.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDocumentSequencePrintTicket := CallbackCreate(GetMethod(implObj, "SetDocumentSequencePrintTicket"), flags, 2)
        this.vtbl.SetDocumentSequenceUri := CallbackCreate(GetMethod(implObj, "SetDocumentSequenceUri"), flags, 2)
        this.vtbl.AddDocumentData := CallbackCreate(GetMethod(implObj, "AddDocumentData"), flags, 4)
        this.vtbl.AddPage := CallbackCreate(GetMethod(implObj, "AddPage"), flags, 5)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDocumentSequencePrintTicket)
        CallbackFree(this.vtbl.SetDocumentSequenceUri)
        CallbackFree(this.vtbl.AddDocumentData)
        CallbackFree(this.vtbl.AddPage)
        CallbackFree(this.vtbl.Close)
    }
}
