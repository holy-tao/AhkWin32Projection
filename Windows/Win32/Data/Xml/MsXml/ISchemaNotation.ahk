#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISchemaItem.ahk" { ISchemaItem }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISchemaNotation extends ISchemaItem {
    /**
     * The interface identifier for ISchemaNotation
     * @type {Guid}
     */
    static IID := Guid("{50ea08be-dd1b-4664-9a50-c2f40f4bd79a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchemaNotation interfaces
    */
    struct Vtbl extends ISchemaItem.Vtbl {
        get_systemIdentifier : IntPtr
        get_publicIdentifier : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchemaNotation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    systemIdentifier {
        get => this.get_systemIdentifier()
    }

    /**
     * @type {BSTR} 
     */
    publicIdentifier {
        get => this.get_publicIdentifier()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_systemIdentifier() {
        uri := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, uri, "HRESULT")
        return uri
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_publicIdentifier() {
        uri := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, uri, "HRESULT")
        return uri
    }

    Query(iid) {
        if (ISchemaNotation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_systemIdentifier := CallbackCreate(GetMethod(implObj, "get_systemIdentifier"), flags, 2)
        this.vtbl.get_publicIdentifier := CallbackCreate(GetMethod(implObj, "get_publicIdentifier"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_systemIdentifier)
        CallbackFree(this.vtbl.get_publicIdentifier)
    }
}
