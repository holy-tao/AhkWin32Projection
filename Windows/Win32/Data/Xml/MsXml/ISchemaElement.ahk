#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<ISchemaType>} type 
     * @returns {HRESULT} 
     */
    get_type(type) {
        result := ComCall(16, this, "ptr*", type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaComplexType>} scope 
     * @returns {HRESULT} 
     */
    get_scope(scope) {
        result := ComCall(17, this, "ptr*", scope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} defaultValue 
     * @returns {HRESULT} 
     */
    get_defaultValue(defaultValue) {
        result := ComCall(18, this, "ptr", defaultValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} fixedValue 
     * @returns {HRESULT} 
     */
    get_fixedValue(fixedValue) {
        result := ComCall(19, this, "ptr", fixedValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} nillable 
     * @returns {HRESULT} 
     */
    get_isNillable(nillable) {
        result := ComCall(20, this, "ptr", nillable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaItemCollection>} constraints 
     * @returns {HRESULT} 
     */
    get_identityConstraints(constraints) {
        result := ComCall(21, this, "ptr*", constraints, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaElement>} element 
     * @returns {HRESULT} 
     */
    get_substitutionGroup(element) {
        result := ComCall(22, this, "ptr*", element, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} exclusions 
     * @returns {HRESULT} 
     */
    get_substitutionGroupExclusions(exclusions) {
        exclusionsMarshal := exclusions is VarRef ? "int*" : "ptr"

        result := ComCall(23, this, exclusionsMarshal, exclusions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} disallowed 
     * @returns {HRESULT} 
     */
    get_disallowedSubstitutions(disallowed) {
        disallowedMarshal := disallowed is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, disallowedMarshal, disallowed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} abstract 
     * @returns {HRESULT} 
     */
    get_isAbstract(abstract) {
        result := ComCall(25, this, "ptr", abstract, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} reference 
     * @returns {HRESULT} 
     */
    get_isReference(reference) {
        result := ComCall(26, this, "ptr", reference, "HRESULT")
        return result
    }
}
