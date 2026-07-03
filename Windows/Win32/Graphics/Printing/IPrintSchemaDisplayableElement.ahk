#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintSchemaElement.ahk" { IPrintSchemaElement }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintSchemaDisplayableElement extends IPrintSchemaElement {
    /**
     * The interface identifier for IPrintSchemaDisplayableElement
     * @type {Guid}
     */
    static IID := Guid("{af45af49-d6aa-407d-bf87-3912236e9d94}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintSchemaDisplayableElement interfaces
    */
    struct Vtbl extends IPrintSchemaElement.Vtbl {
        get_DisplayName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintSchemaDisplayableElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DisplayName() {
        pbstrDisplayName := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrDisplayName, "HRESULT")
        return pbstrDisplayName
    }

    Query(iid) {
        if (IPrintSchemaDisplayableElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DisplayName)
    }
}
