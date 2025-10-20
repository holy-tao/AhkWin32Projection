#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISchemaParticle.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchemaElement extends ISchemaParticle{
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
     * 
     * @param {Pointer<ISchemaType>} type 
     * @returns {HRESULT} 
     */
    get_type(type) {
        result := ComCall(16, this, "ptr", type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaComplexType>} scope 
     * @returns {HRESULT} 
     */
    get_scope(scope) {
        result := ComCall(17, this, "ptr", scope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} defaultValue 
     * @returns {HRESULT} 
     */
    get_defaultValue(defaultValue) {
        result := ComCall(18, this, "ptr", defaultValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} fixedValue 
     * @returns {HRESULT} 
     */
    get_fixedValue(fixedValue) {
        result := ComCall(19, this, "ptr", fixedValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} nillable 
     * @returns {HRESULT} 
     */
    get_isNillable(nillable) {
        result := ComCall(20, this, "ptr", nillable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaItemCollection>} constraints 
     * @returns {HRESULT} 
     */
    get_identityConstraints(constraints) {
        result := ComCall(21, this, "ptr", constraints, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaElement>} element 
     * @returns {HRESULT} 
     */
    get_substitutionGroup(element) {
        result := ComCall(22, this, "ptr", element, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} exclusions 
     * @returns {HRESULT} 
     */
    get_substitutionGroupExclusions(exclusions) {
        result := ComCall(23, this, "int*", exclusions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} disallowed 
     * @returns {HRESULT} 
     */
    get_disallowedSubstitutions(disallowed) {
        result := ComCall(24, this, "int*", disallowed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} abstract 
     * @returns {HRESULT} 
     */
    get_isAbstract(abstract) {
        result := ComCall(25, this, "ptr", abstract, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} reference 
     * @returns {HRESULT} 
     */
    get_isReference(reference) {
        result := ComCall(26, this, "ptr", reference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
