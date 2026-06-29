#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\PrintSchemaSelectionType.ahk" { PrintSchemaSelectionType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintSchemaOption.ahk" { IPrintSchemaOption }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IPrintSchemaDisplayableElement.ahk" { IPrintSchemaDisplayableElement }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintSchemaFeature extends IPrintSchemaDisplayableElement {
    /**
     * The interface identifier for IPrintSchemaFeature
     * @type {Guid}
     */
    static IID := Guid("{ef189461-5d62-4626-8e57-ff83583c4826}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintSchemaFeature interfaces
    */
    struct Vtbl extends IPrintSchemaDisplayableElement.Vtbl {
        get_SelectedOption : IntPtr
        put_SelectedOption : IntPtr
        get_SelectionType  : IntPtr
        GetOption          : IntPtr
        get_DisplayUI      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintSchemaFeature.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IPrintSchemaOption} 
     */
    SelectedOption {
        get => this.get_SelectedOption()
        set => this.put_SelectedOption(value)
    }

    /**
     * @type {PrintSchemaSelectionType} 
     */
    SelectionType {
        get => this.get_SelectionType()
    }

    /**
     * @type {BOOL} 
     */
    DisplayUI {
        get => this.get_DisplayUI()
    }

    /**
     * 
     * @returns {IPrintSchemaOption} 
     */
    get_SelectedOption() {
        result := ComCall(11, this, "ptr*", &ppOption := 0, "HRESULT")
        return IPrintSchemaOption(ppOption)
    }

    /**
     * 
     * @param {IPrintSchemaOption} pOption 
     * @returns {HRESULT} 
     */
    put_SelectedOption(pOption) {
        result := ComCall(12, this, "ptr", pOption, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PrintSchemaSelectionType} 
     */
    get_SelectionType() {
        result := ComCall(13, this, "int*", &pSelectionType := 0, "HRESULT")
        return pSelectionType
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrNamespaceUri 
     * @returns {IPrintSchemaOption} 
     */
    GetOption(bstrName, bstrNamespaceUri) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrNamespaceUri := bstrNamespaceUri is String ? BSTR.Alloc(bstrNamespaceUri).Value : bstrNamespaceUri

        result := ComCall(14, this, BSTR, bstrName, BSTR, bstrNamespaceUri, "ptr*", &ppOption := 0, "HRESULT")
        return IPrintSchemaOption(ppOption)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_DisplayUI() {
        result := ComCall(15, this, BOOL.Ptr, &pbShow := 0, "HRESULT")
        return pbShow
    }

    Query(iid) {
        if (IPrintSchemaFeature.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SelectedOption := CallbackCreate(GetMethod(implObj, "get_SelectedOption"), flags, 2)
        this.vtbl.put_SelectedOption := CallbackCreate(GetMethod(implObj, "put_SelectedOption"), flags, 2)
        this.vtbl.get_SelectionType := CallbackCreate(GetMethod(implObj, "get_SelectionType"), flags, 2)
        this.vtbl.GetOption := CallbackCreate(GetMethod(implObj, "GetOption"), flags, 4)
        this.vtbl.get_DisplayUI := CallbackCreate(GetMethod(implObj, "get_DisplayUI"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SelectedOption)
        CallbackFree(this.vtbl.put_SelectedOption)
        CallbackFree(this.vtbl.get_SelectionType)
        CallbackFree(this.vtbl.GetOption)
        CallbackFree(this.vtbl.get_DisplayUI)
    }
}
