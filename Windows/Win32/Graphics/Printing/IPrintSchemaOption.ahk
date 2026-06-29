#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PrintSchemaConstrainedSetting.ahk" { PrintSchemaConstrainedSetting }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IPrintSchemaDisplayableElement.ahk" { IPrintSchemaDisplayableElement }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintSchemaOption extends IPrintSchemaDisplayableElement {
    /**
     * The interface identifier for IPrintSchemaOption
     * @type {Guid}
     */
    static IID := Guid("{66bb2f51-5844-4997-8d70-4b7cc221cf92}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintSchemaOption interfaces
    */
    struct Vtbl extends IPrintSchemaDisplayableElement.Vtbl {
        get_Selected     : IntPtr
        get_Constrained  : IntPtr
        GetPropertyValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintSchemaOption.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    Selected {
        get => this.get_Selected()
    }

    /**
     * @type {PrintSchemaConstrainedSetting} 
     */
    Constrained {
        get => this.get_Constrained()
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_Selected() {
        result := ComCall(11, this, BOOL.Ptr, &pbIsSelected := 0, "HRESULT")
        return pbIsSelected
    }

    /**
     * 
     * @returns {PrintSchemaConstrainedSetting} 
     */
    get_Constrained() {
        result := ComCall(12, this, "int*", &pSetting := 0, "HRESULT")
        return pSetting
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrNamespaceUri 
     * @returns {IUnknown} 
     */
    GetPropertyValue(bstrName, bstrNamespaceUri) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrNamespaceUri := bstrNamespaceUri is String ? BSTR.Alloc(bstrNamespaceUri).Value : bstrNamespaceUri

        result := ComCall(13, this, BSTR, bstrName, BSTR, bstrNamespaceUri, "ptr*", &ppXmlValueNode := 0, "HRESULT")
        return IUnknown(ppXmlValueNode)
    }

    Query(iid) {
        if (IPrintSchemaOption.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Selected := CallbackCreate(GetMethod(implObj, "get_Selected"), flags, 2)
        this.vtbl.get_Constrained := CallbackCreate(GetMethod(implObj, "get_Constrained"), flags, 2)
        this.vtbl.GetPropertyValue := CallbackCreate(GetMethod(implObj, "GetPropertyValue"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Selected)
        CallbackFree(this.vtbl.get_Constrained)
        CallbackFree(this.vtbl.GetPropertyValue)
    }
}
