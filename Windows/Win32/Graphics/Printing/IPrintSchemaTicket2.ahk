#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintSchemaTicket.ahk" { IPrintSchemaTicket }
#Import ".\IPrintSchemaParameterInitializer.ahk" { IPrintSchemaParameterInitializer }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintSchemaTicket2 extends IPrintSchemaTicket {
    /**
     * The interface identifier for IPrintSchemaTicket2
     * @type {Guid}
     */
    static IID := Guid("{2ec1f844-766a-47a1-91f4-2eeb6190f80c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintSchemaTicket2 interfaces
    */
    struct Vtbl extends IPrintSchemaTicket.Vtbl {
        GetParameterInitializer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintSchemaTicket2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrNamespaceUri 
     * @returns {IPrintSchemaParameterInitializer} 
     */
    GetParameterInitializer(bstrName, bstrNamespaceUri) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrNamespaceUri := bstrNamespaceUri is String ? BSTR.Alloc(bstrNamespaceUri).Value : bstrNamespaceUri

        result := ComCall(18, this, BSTR, bstrName, BSTR, bstrNamespaceUri, "ptr*", &ppParameterInitializer := 0, "HRESULT")
        return IPrintSchemaParameterInitializer(ppParameterInitializer)
    }

    Query(iid) {
        if (IPrintSchemaTicket2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetParameterInitializer := CallbackCreate(GetMethod(implObj, "GetParameterInitializer"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetParameterInitializer)
    }
}
