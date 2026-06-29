#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISchemaStringCollection.ahk" { ISchemaStringCollection }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISchemaItem.ahk" { ISchemaItem }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISchemaIdentityConstraint extends ISchemaItem {
    /**
     * The interface identifier for ISchemaIdentityConstraint
     * @type {Guid}
     */
    static IID := Guid("{50ea08bd-dd1b-4664-9a50-c2f40f4bd79a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchemaIdentityConstraint interfaces
    */
    struct Vtbl extends ISchemaItem.Vtbl {
        get_selector      : IntPtr
        get_fields        : IntPtr
        get_referencedKey : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchemaIdentityConstraint.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    selector {
        get => this.get_selector()
    }

    /**
     * @type {ISchemaStringCollection} 
     */
    fields {
        get => this.get_fields()
    }

    /**
     * @type {ISchemaIdentityConstraint} 
     */
    referencedKey {
        get => this.get_referencedKey()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_selector() {
        selector := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, selector, "HRESULT")
        return selector
    }

    /**
     * 
     * @returns {ISchemaStringCollection} 
     */
    get_fields() {
        result := ComCall(15, this, "ptr*", &fields := 0, "HRESULT")
        return ISchemaStringCollection(fields)
    }

    /**
     * 
     * @returns {ISchemaIdentityConstraint} 
     */
    get_referencedKey() {
        result := ComCall(16, this, "ptr*", &key := 0, "HRESULT")
        return ISchemaIdentityConstraint(key)
    }

    Query(iid) {
        if (ISchemaIdentityConstraint.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_selector := CallbackCreate(GetMethod(implObj, "get_selector"), flags, 2)
        this.vtbl.get_fields := CallbackCreate(GetMethod(implObj, "get_fields"), flags, 2)
        this.vtbl.get_referencedKey := CallbackCreate(GetMethod(implObj, "get_referencedKey"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_selector)
        CallbackFree(this.vtbl.get_fields)
        CallbackFree(this.vtbl.get_referencedKey)
    }
}
