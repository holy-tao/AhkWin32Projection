#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISchemaStringCollection.ahk" { ISchemaStringCollection }
#Import ".\SCHEMAPROCESSCONTENTS.ahk" { SCHEMAPROCESSCONTENTS }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISchemaParticle.ahk" { ISchemaParticle }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISchemaAny extends ISchemaParticle {
    /**
     * The interface identifier for ISchemaAny
     * @type {Guid}
     */
    static IID := Guid("{50ea08bc-dd1b-4664-9a50-c2f40f4bd79a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchemaAny interfaces
    */
    struct Vtbl extends ISchemaParticle.Vtbl {
        get_namespaces      : IntPtr
        get_processContents : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchemaAny.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISchemaStringCollection} 
     */
    namespaces {
        get => this.get_namespaces()
    }

    /**
     * @type {SCHEMAPROCESSCONTENTS} 
     */
    processContents {
        get => this.get_processContents()
    }

    /**
     * 
     * @returns {ISchemaStringCollection} 
     */
    get_namespaces() {
        result := ComCall(16, this, "ptr*", &namespaces := 0, "HRESULT")
        return ISchemaStringCollection(namespaces)
    }

    /**
     * 
     * @returns {SCHEMAPROCESSCONTENTS} 
     */
    get_processContents() {
        result := ComCall(17, this, "int*", &processContents := 0, "HRESULT")
        return processContents
    }

    Query(iid) {
        if (ISchemaAny.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_namespaces := CallbackCreate(GetMethod(implObj, "get_namespaces"), flags, 2)
        this.vtbl.get_processContents := CallbackCreate(GetMethod(implObj, "get_processContents"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_namespaces)
        CallbackFree(this.vtbl.get_processContents)
    }
}
