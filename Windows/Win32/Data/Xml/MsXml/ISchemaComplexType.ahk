#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SCHEMACONTENTTYPE.ahk" { SCHEMACONTENTTYPE }
#Import ".\ISchemaAny.ahk" { ISchemaAny }
#Import ".\ISchemaModelGroup.ahk" { ISchemaModelGroup }
#Import ".\SCHEMADERIVATIONMETHOD.ahk" { SCHEMADERIVATIONMETHOD }
#Import ".\ISchemaItemCollection.ahk" { ISchemaItemCollection }
#Import ".\ISchemaType.ahk" { ISchemaType }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISchemaComplexType extends ISchemaType {
    /**
     * The interface identifier for ISchemaComplexType
     * @type {Guid}
     */
    static IID := Guid("{50ea08b9-dd1b-4664-9a50-c2f40f4bd79a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchemaComplexType interfaces
    */
    struct Vtbl extends ISchemaType.Vtbl {
        get_isAbstract              : IntPtr
        get_anyAttribute            : IntPtr
        get_attributes              : IntPtr
        get_contentType             : IntPtr
        get_contentModel            : IntPtr
        get_prohibitedSubstitutions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchemaComplexType.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isAbstract {
        get => this.get_isAbstract()
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
     * @type {SCHEMACONTENTTYPE} 
     */
    contentType {
        get => this.get_contentType()
    }

    /**
     * @type {ISchemaModelGroup} 
     */
    contentModel {
        get => this.get_contentModel()
    }

    /**
     * @type {SCHEMADERIVATIONMETHOD} 
     */
    prohibitedSubstitutions {
        get => this.get_prohibitedSubstitutions()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isAbstract() {
        result := ComCall(31, this, VARIANT_BOOL.Ptr, &abstract := 0, "HRESULT")
        return abstract
    }

    /**
     * 
     * @returns {ISchemaAny} 
     */
    get_anyAttribute() {
        result := ComCall(32, this, "ptr*", &anyAttribute := 0, "HRESULT")
        return ISchemaAny(anyAttribute)
    }

    /**
     * 
     * @returns {ISchemaItemCollection} 
     */
    get_attributes() {
        result := ComCall(33, this, "ptr*", &attributes := 0, "HRESULT")
        return ISchemaItemCollection(attributes)
    }

    /**
     * 
     * @returns {SCHEMACONTENTTYPE} 
     */
    get_contentType() {
        result := ComCall(34, this, "int*", &contentType := 0, "HRESULT")
        return contentType
    }

    /**
     * 
     * @returns {ISchemaModelGroup} 
     */
    get_contentModel() {
        result := ComCall(35, this, "ptr*", &contentModel := 0, "HRESULT")
        return ISchemaModelGroup(contentModel)
    }

    /**
     * 
     * @returns {SCHEMADERIVATIONMETHOD} 
     */
    get_prohibitedSubstitutions() {
        result := ComCall(36, this, "int*", &prohibited := 0, "HRESULT")
        return prohibited
    }

    Query(iid) {
        if (ISchemaComplexType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_isAbstract := CallbackCreate(GetMethod(implObj, "get_isAbstract"), flags, 2)
        this.vtbl.get_anyAttribute := CallbackCreate(GetMethod(implObj, "get_anyAttribute"), flags, 2)
        this.vtbl.get_attributes := CallbackCreate(GetMethod(implObj, "get_attributes"), flags, 2)
        this.vtbl.get_contentType := CallbackCreate(GetMethod(implObj, "get_contentType"), flags, 2)
        this.vtbl.get_contentModel := CallbackCreate(GetMethod(implObj, "get_contentModel"), flags, 2)
        this.vtbl.get_prohibitedSubstitutions := CallbackCreate(GetMethod(implObj, "get_prohibitedSubstitutions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_isAbstract)
        CallbackFree(this.vtbl.get_anyAttribute)
        CallbackFree(this.vtbl.get_attributes)
        CallbackFree(this.vtbl.get_contentType)
        CallbackFree(this.vtbl.get_contentModel)
        CallbackFree(this.vtbl.get_prohibitedSubstitutions)
    }
}
