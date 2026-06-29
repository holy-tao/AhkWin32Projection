#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISchemaElement.ahk" { ISchemaElement }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IMXSchemaDeclHandler extends IDispatch {
    /**
     * The interface identifier for IMXSchemaDeclHandler
     * @type {Guid}
     */
    static IID := Guid("{fa4bb38c-faf9-4cca-9302-d1dd0fe520db}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMXSchemaDeclHandler interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        schemaElementDecl : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMXSchemaDeclHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ISchemaElement} oSchemaElement 
     * @returns {HRESULT} 
     */
    schemaElementDecl(oSchemaElement) {
        result := ComCall(7, this, "ptr", oSchemaElement, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMXSchemaDeclHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.schemaElementDecl := CallbackCreate(GetMethod(implObj, "schemaElementDecl"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.schemaElementDecl)
    }
}
