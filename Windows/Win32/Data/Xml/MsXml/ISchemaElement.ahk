#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISchemaType.ahk
#Include .\ISchemaComplexType.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ISchemaItemCollection.ahk
#Include .\ISchemaElement.ahk
#Include .\ISchemaParticle.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchemaElement extends ISchemaParticle{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISchemaElement
     * @type {Guid}
     */
    static IID => Guid("{50ea08b7-dd1b-4664-9a50-c2f40f4bd79a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_type", "get_scope", "get_defaultValue", "get_fixedValue", "get_isNillable", "get_identityConstraints", "get_substitutionGroup", "get_substitutionGroupExclusions", "get_disallowedSubstitutions", "get_isAbstract", "get_isReference"]

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
     * @type {Integer} 
     */
    substitutionGroupExclusions {
        get => this.get_substitutionGroupExclusions()
    }

    /**
     * @type {Integer} 
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
        defaultValue := BSTR()
        result := ComCall(18, this, "ptr", defaultValue, "HRESULT")
        return defaultValue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fixedValue() {
        fixedValue := BSTR()
        result := ComCall(19, this, "ptr", fixedValue, "HRESULT")
        return fixedValue
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isNillable() {
        result := ComCall(20, this, "short*", &nillable := 0, "HRESULT")
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
     * @returns {Integer} 
     */
    get_substitutionGroupExclusions() {
        result := ComCall(23, this, "int*", &exclusions := 0, "HRESULT")
        return exclusions
    }

    /**
     * 
     * @returns {Integer} 
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
        result := ComCall(25, this, "short*", &abstract := 0, "HRESULT")
        return abstract
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isReference() {
        result := ComCall(26, this, "short*", &reference := 0, "HRESULT")
        return reference
    }
}
