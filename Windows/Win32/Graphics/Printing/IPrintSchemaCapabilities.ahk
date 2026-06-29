#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IPrintSchemaPageImageableSize.ahk" { IPrintSchemaPageImageableSize }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintSchemaElement.ahk" { IPrintSchemaElement }
#Import ".\IPrintSchemaOption.ahk" { IPrintSchemaOption }
#Import ".\IPrintSchemaFeature.ahk" { IPrintSchemaFeature }
#Import ".\IPrintSchemaOptionCollection.ahk" { IPrintSchemaOptionCollection }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintSchemaCapabilities extends IPrintSchemaElement {
    /**
     * The interface identifier for IPrintSchemaCapabilities
     * @type {Guid}
     */
    static IID := Guid("{5a577640-501d-4927-bcd0-5ef57a7ed175}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintSchemaCapabilities interfaces
    */
    struct Vtbl extends IPrintSchemaElement.Vtbl {
        GetFeatureByKeyName               : IntPtr
        GetFeature                        : IntPtr
        get_PageImageableSize             : IntPtr
        get_JobCopiesAllDocumentsMinValue : IntPtr
        get_JobCopiesAllDocumentsMaxValue : IntPtr
        GetSelectedOptionInPrintTicket    : IntPtr
        GetOptions                        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintSchemaCapabilities.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @returns {IPrintSchemaPageImageableSize} 
     */
    get_PageImageableSize() {
        result := ComCall(12, this, "ptr*", &ppPageImageableSize := 0, "HRESULT")
        return IPrintSchemaPageImageableSize(ppPageImageableSize)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_JobCopiesAllDocumentsMinValue() {
        result := ComCall(13, this, "uint*", &pulJobCopiesAllDocumentsMinValue := 0, "HRESULT")
        return pulJobCopiesAllDocumentsMinValue
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_JobCopiesAllDocumentsMaxValue() {
        result := ComCall(14, this, "uint*", &pulJobCopiesAllDocumentsMaxValue := 0, "HRESULT")
        return pulJobCopiesAllDocumentsMaxValue
    }

    /**
     * 
     * @param {IPrintSchemaFeature} pFeature 
     * @returns {IPrintSchemaOption} 
     */
    GetSelectedOptionInPrintTicket(pFeature) {
        result := ComCall(15, this, "ptr", pFeature, "ptr*", &ppOption := 0, "HRESULT")
        return IPrintSchemaOption(ppOption)
    }

    /**
     * 
     * @param {IPrintSchemaFeature} pFeature 
     * @returns {IPrintSchemaOptionCollection} 
     */
    GetOptions(pFeature) {
        result := ComCall(16, this, "ptr", pFeature, "ptr*", &ppOptionCollection := 0, "HRESULT")
        return IPrintSchemaOptionCollection(ppOptionCollection)
    }

    Query(iid) {
        if (IPrintSchemaCapabilities.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFeatureByKeyName := CallbackCreate(GetMethod(implObj, "GetFeatureByKeyName"), flags, 3)
        this.vtbl.GetFeature := CallbackCreate(GetMethod(implObj, "GetFeature"), flags, 4)
        this.vtbl.get_PageImageableSize := CallbackCreate(GetMethod(implObj, "get_PageImageableSize"), flags, 2)
        this.vtbl.get_JobCopiesAllDocumentsMinValue := CallbackCreate(GetMethod(implObj, "get_JobCopiesAllDocumentsMinValue"), flags, 2)
        this.vtbl.get_JobCopiesAllDocumentsMaxValue := CallbackCreate(GetMethod(implObj, "get_JobCopiesAllDocumentsMaxValue"), flags, 2)
        this.vtbl.GetSelectedOptionInPrintTicket := CallbackCreate(GetMethod(implObj, "GetSelectedOptionInPrintTicket"), flags, 3)
        this.vtbl.GetOptions := CallbackCreate(GetMethod(implObj, "GetOptions"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFeatureByKeyName)
        CallbackFree(this.vtbl.GetFeature)
        CallbackFree(this.vtbl.get_PageImageableSize)
        CallbackFree(this.vtbl.get_JobCopiesAllDocumentsMinValue)
        CallbackFree(this.vtbl.get_JobCopiesAllDocumentsMaxValue)
        CallbackFree(this.vtbl.GetSelectedOptionInPrintTicket)
        CallbackFree(this.vtbl.GetOptions)
    }
}
