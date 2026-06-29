#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPrintSchemaCapabilities.ahk" { IPrintSchemaCapabilities }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintSchemaElement.ahk" { IPrintSchemaElement }
#Import ".\IPrintSchemaAsyncOperation.ahk" { IPrintSchemaAsyncOperation }
#Import ".\IPrintSchemaFeature.ahk" { IPrintSchemaFeature }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintSchemaTicket extends IPrintSchemaElement {
    /**
     * The interface identifier for IPrintSchemaTicket
     * @type {Guid}
     */
    static IID := Guid("{e480b861-4708-4e6d-a5b4-a2b4eeb9baa4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintSchemaTicket interfaces
    */
    struct Vtbl extends IPrintSchemaElement.Vtbl {
        GetFeatureByKeyName       : IntPtr
        GetFeature                : IntPtr
        ValidateAsync             : IntPtr
        CommitAsync               : IntPtr
        NotifyXmlChanged          : IntPtr
        GetCapabilities           : IntPtr
        get_JobCopiesAllDocuments : IntPtr
        put_JobCopiesAllDocuments : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintSchemaTicket.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        bstrKeyName := bstrKeyName is String ? BSTR.Alloc(bstrKeyName).Value : bstrKeyName

        result := ComCall(10, this, BSTR, bstrKeyName, "ptr*", &ppFeature := 0, "HRESULT")
        return IPrintSchemaFeature(ppFeature)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrNamespaceUri 
     * @returns {IPrintSchemaFeature} 
     */
    GetFeature(bstrName, bstrNamespaceUri) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrNamespaceUri := bstrNamespaceUri is String ? BSTR.Alloc(bstrNamespaceUri).Value : bstrNamespaceUri

        result := ComCall(11, this, BSTR, bstrName, BSTR, bstrNamespaceUri, "ptr*", &ppFeature := 0, "HRESULT")
        return IPrintSchemaFeature(ppFeature)
    }

    /**
     * 
     * @returns {IPrintSchemaAsyncOperation} 
     */
    ValidateAsync() {
        result := ComCall(12, this, "ptr*", &ppAsyncOperation := 0, "HRESULT")
        return IPrintSchemaAsyncOperation(ppAsyncOperation)
    }

    /**
     * 
     * @param {IPrintSchemaTicket} pPrintTicketCommit 
     * @returns {IPrintSchemaAsyncOperation} 
     */
    CommitAsync(pPrintTicketCommit) {
        result := ComCall(13, this, "ptr", pPrintTicketCommit, "ptr*", &ppAsyncOperation := 0, "HRESULT")
        return IPrintSchemaAsyncOperation(ppAsyncOperation)
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
     * @returns {IPrintSchemaCapabilities} 
     */
    GetCapabilities() {
        result := ComCall(15, this, "ptr*", &ppCapabilities := 0, "HRESULT")
        return IPrintSchemaCapabilities(ppCapabilities)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_JobCopiesAllDocuments() {
        result := ComCall(16, this, "uint*", &pulJobCopiesAllDocuments := 0, "HRESULT")
        return pulJobCopiesAllDocuments
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

    Query(iid) {
        if (IPrintSchemaTicket.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFeatureByKeyName := CallbackCreate(GetMethod(implObj, "GetFeatureByKeyName"), flags, 3)
        this.vtbl.GetFeature := CallbackCreate(GetMethod(implObj, "GetFeature"), flags, 4)
        this.vtbl.ValidateAsync := CallbackCreate(GetMethod(implObj, "ValidateAsync"), flags, 2)
        this.vtbl.CommitAsync := CallbackCreate(GetMethod(implObj, "CommitAsync"), flags, 3)
        this.vtbl.NotifyXmlChanged := CallbackCreate(GetMethod(implObj, "NotifyXmlChanged"), flags, 1)
        this.vtbl.GetCapabilities := CallbackCreate(GetMethod(implObj, "GetCapabilities"), flags, 2)
        this.vtbl.get_JobCopiesAllDocuments := CallbackCreate(GetMethod(implObj, "get_JobCopiesAllDocuments"), flags, 2)
        this.vtbl.put_JobCopiesAllDocuments := CallbackCreate(GetMethod(implObj, "put_JobCopiesAllDocuments"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFeatureByKeyName)
        CallbackFree(this.vtbl.GetFeature)
        CallbackFree(this.vtbl.ValidateAsync)
        CallbackFree(this.vtbl.CommitAsync)
        CallbackFree(this.vtbl.NotifyXmlChanged)
        CallbackFree(this.vtbl.GetCapabilities)
        CallbackFree(this.vtbl.get_JobCopiesAllDocuments)
        CallbackFree(this.vtbl.put_JobCopiesAllDocuments)
    }
}
