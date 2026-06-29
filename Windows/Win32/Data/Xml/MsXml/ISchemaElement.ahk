#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISchemaComplexType.ahk" { ISchemaComplexType }
#Import ".\ISchemaParticle.ahk" { ISchemaParticle }
#Import ".\SCHEMADERIVATIONMETHOD.ahk" { SCHEMADERIVATIONMETHOD }
#Import ".\ISchemaItemCollection.ahk" { ISchemaItemCollection }
#Import ".\ISchemaType.ahk" { ISchemaType }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISchemaElement extends ISchemaParticle {
    /**
     * The interface identifier for ISchemaElement
     * @type {Guid}
     */
    static IID := Guid("{50ea08b7-dd1b-4664-9a50-c2f40f4bd79a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchemaElement interfaces
    */
    struct Vtbl extends ISchemaParticle.Vtbl {
        get_type                        : IntPtr
        get_scope                       : IntPtr
        get_defaultValue                : IntPtr
        get_fixedValue                  : IntPtr
        get_isNillable                  : IntPtr
        get_identityConstraints         : IntPtr
        get_substitutionGroup           : IntPtr
        get_substitutionGroupExclusions : IntPtr
        get_disallowedSubstitutions     : IntPtr
        get_isAbstract                  : IntPtr
        get_isReference                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchemaElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISchemaType} 
     */
    type {
        get => this.get_type()
    }

    /**
     * @type {ISchemaComplexType} 
     */
    scope {
        get => this.get_scope()
    }

    /**
     * @type {BSTR} 
     */
    defaultValue {
        get => this.get_defaultValue()
    }

    /**
     * @type {BSTR} 
     */
    fixedValue {
        get => this.get_fixedValue()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isNillable {
        get => this.get_isNillable()
    }

    /**
     * @type {ISchemaItemCollection} 
     */
    identityConstraints {
        get => this.get_identityConstraints()
    }

    /**
     * @type {ISchemaElement} 
     */
    substitutionGroup {
        get => this.get_substitutionGroup()
    }

    /**
     * @type {SCHEMADERIVATIONMETHOD} 
     */
    substitutionGroupExclusions {
        get => this.get_substitutionGroupExclusions()
    }

    /**
     * @type {SCHEMADERIVATIONMETHOD} 
     */
    disallowedSubstitutions {
        get => this.get_disallowedSubstitutions()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isAbstract {
        get => this.get_isAbstract()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isReference {
        get => this.get_isReference()
    }

    /**
     * 
     * @returns {ISchemaType} 
     */
    get_type() {
        result := ComCall(16, this, "ptr*", &type := 0, "HRESULT")
        return ISchemaType(type)
    }

    /**
     * 
     * @returns {ISchemaComplexType} 
     */
    get_scope() {
        result := ComCall(17, this, "ptr*", &scope := 0, "HRESULT")
        return ISchemaComplexType(scope)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_defaultValue() {
        defaultValue := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, defaultValue, "HRESULT")
        return defaultValue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fixedValue() {
        fixedValue := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, fixedValue, "HRESULT")
        return fixedValue
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isNillable() {
        result := ComCall(20, this, VARIANT_BOOL.Ptr, &nillable := 0, "HRESULT")
        return nillable
    }

    /**
     * 
     * @returns {ISchemaItemCollection} 
     */
    get_identityConstraints() {
        result := ComCall(21, this, "ptr*", &constraints := 0, "HRESULT")
        return ISchemaItemCollection(constraints)
    }

    /**
     * 
     * @returns {ISchemaElement} 
     */
    get_substitutionGroup() {
        result := ComCall(22, this, "ptr*", &element := 0, "HRESULT")
        return ISchemaElement(element)
    }

    /**
     * 
     * @returns {SCHEMADERIVATIONMETHOD} 
     */
    get_substitutionGroupExclusions() {
        result := ComCall(23, this, "int*", &exclusions := 0, "HRESULT")
        return exclusions
    }

    /**
     * 
     * @returns {SCHEMADERIVATIONMETHOD} 
     */
    get_disallowedSubstitutions() {
        result := ComCall(24, this, "int*", &disallowed := 0, "HRESULT")
        return disallowed
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isAbstract() {
        result := ComCall(25, this, VARIANT_BOOL.Ptr, &abstract := 0, "HRESULT")
        return abstract
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isReference() {
        result := ComCall(26, this, VARIANT_BOOL.Ptr, &_reference := 0, "HRESULT")
        return _reference
    }

    Query(iid) {
        if (ISchemaElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.get_scope := CallbackCreate(GetMethod(implObj, "get_scope"), flags, 2)
        this.vtbl.get_defaultValue := CallbackCreate(GetMethod(implObj, "get_defaultValue"), flags, 2)
        this.vtbl.get_fixedValue := CallbackCreate(GetMethod(implObj, "get_fixedValue"), flags, 2)
        this.vtbl.get_isNillable := CallbackCreate(GetMethod(implObj, "get_isNillable"), flags, 2)
        this.vtbl.get_identityConstraints := CallbackCreate(GetMethod(implObj, "get_identityConstraints"), flags, 2)
        this.vtbl.get_substitutionGroup := CallbackCreate(GetMethod(implObj, "get_substitutionGroup"), flags, 2)
        this.vtbl.get_substitutionGroupExclusions := CallbackCreate(GetMethod(implObj, "get_substitutionGroupExclusions"), flags, 2)
        this.vtbl.get_disallowedSubstitutions := CallbackCreate(GetMethod(implObj, "get_disallowedSubstitutions"), flags, 2)
        this.vtbl.get_isAbstract := CallbackCreate(GetMethod(implObj, "get_isAbstract"), flags, 2)
        this.vtbl.get_isReference := CallbackCreate(GetMethod(implObj, "get_isReference"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.get_scope)
        CallbackFree(this.vtbl.get_defaultValue)
        CallbackFree(this.vtbl.get_fixedValue)
        CallbackFree(this.vtbl.get_isNillable)
        CallbackFree(this.vtbl.get_identityConstraints)
        CallbackFree(this.vtbl.get_substitutionGroup)
        CallbackFree(this.vtbl.get_substitutionGroupExclusions)
        CallbackFree(this.vtbl.get_disallowedSubstitutions)
        CallbackFree(this.vtbl.get_isAbstract)
        CallbackFree(this.vtbl.get_isReference)
    }
}
