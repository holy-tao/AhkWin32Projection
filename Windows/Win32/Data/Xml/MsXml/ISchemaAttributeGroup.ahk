#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISchemaItemCollection.ahk" { ISchemaItemCollection }
#Import ".\ISchemaItem.ahk" { ISchemaItem }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISchemaAny.ahk" { ISchemaAny }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISchemaAttributeGroup extends ISchemaItem {
    /**
     * The interface identifier for ISchemaAttributeGroup
     * @type {Guid}
     */
    static IID := Guid("{50ea08ba-dd1b-4664-9a50-c2f40f4bd79a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchemaAttributeGroup interfaces
    */
    struct Vtbl extends ISchemaItem.Vtbl {
        get_anyAttribute : IntPtr
        get_attributes   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchemaAttributeGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISchemaAny} 
     */
    anyAttribute {
        get => this.get_anyAttribute()
    }

    /**
     * @type {ISchemaItemCollection} 
     */
    attributes {
        get => this.get_attributes()
    }

    /**
     * 
     * @returns {ISchemaAny} 
     */
    get_anyAttribute() {
        result := ComCall(14, this, "ptr*", &anyAttribute := 0, "HRESULT")
        return ISchemaAny(anyAttribute)
    }

    /**
     * 
     * @returns {ISchemaItemCollection} 
     */
    get_attributes() {
        result := ComCall(15, this, "ptr*", &attributes := 0, "HRESULT")
        return ISchemaItemCollection(attributes)
    }

    Query(iid) {
        if (ISchemaAttributeGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_anyAttribute := CallbackCreate(GetMethod(implObj, "get_anyAttribute"), flags, 2)
        this.vtbl.get_attributes := CallbackCreate(GetMethod(implObj, "get_attributes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_anyAttribute)
        CallbackFree(this.vtbl.get_attributes)
    }
}
