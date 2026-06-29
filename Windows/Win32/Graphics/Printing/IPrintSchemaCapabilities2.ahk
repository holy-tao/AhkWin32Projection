#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPrintSchemaCapabilities.ahk" { IPrintSchemaCapabilities }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintSchemaParameterDefinition.ahk" { IPrintSchemaParameterDefinition }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintSchemaCapabilities2 extends IPrintSchemaCapabilities {
    /**
     * The interface identifier for IPrintSchemaCapabilities2
     * @type {Guid}
     */
    static IID := Guid("{b58845f4-9970-4d87-a636-169fb82ed642}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintSchemaCapabilities2 interfaces
    */
    struct Vtbl extends IPrintSchemaCapabilities.Vtbl {
        GetParameterDefinition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintSchemaCapabilities2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrNamespaceUri 
     * @returns {IPrintSchemaParameterDefinition} 
     */
    GetParameterDefinition(bstrName, bstrNamespaceUri) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrNamespaceUri := bstrNamespaceUri is String ? BSTR.Alloc(bstrNamespaceUri).Value : bstrNamespaceUri

        result := ComCall(17, this, BSTR, bstrName, BSTR, bstrNamespaceUri, "ptr*", &ppParameterDefinition := 0, "HRESULT")
        return IPrintSchemaParameterDefinition(ppParameterDefinition)
    }

    Query(iid) {
        if (IPrintSchemaCapabilities2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetParameterDefinition := CallbackCreate(GetMethod(implObj, "GetParameterDefinition"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetParameterDefinition)
    }
}
