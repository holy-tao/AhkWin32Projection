#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ISchemaItem.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchemaType extends ISchemaItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISchemaType
     * @type {Guid}
     */
    static IID => Guid("{50ea08b8-dd1b-4664-9a50-c2f40f4bd79a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_baseTypes", "get_final", "get_variety", "get_derivedBy", "isValid", "get_minExclusive", "get_minInclusive", "get_maxExclusive", "get_maxInclusive", "get_totalDigits", "get_fractionDigits", "get_length", "get_minLength", "get_maxLength", "get_enumeration", "get_whitespace", "get_patterns"]

    /**
     * 
     * @param {Pointer<ISchemaItemCollection>} baseTypes 
     * @returns {HRESULT} 
     */
    get_baseTypes(baseTypes) {
        result := ComCall(14, this, "ptr*", baseTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} final 
     * @returns {HRESULT} 
     */
    get_final(final) {
        finalMarshal := final is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, finalMarshal, final, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} variety 
     * @returns {HRESULT} 
     */
    get_variety(variety) {
        varietyMarshal := variety is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, varietyMarshal, variety, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} derivedBy 
     * @returns {HRESULT} 
     */
    get_derivedBy(derivedBy) {
        derivedByMarshal := derivedBy is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, derivedByMarshal, derivedBy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} data 
     * @param {Pointer<VARIANT_BOOL>} valid 
     * @returns {HRESULT} 
     */
    isValid(data, valid) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(18, this, "ptr", data, "ptr", valid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} minExclusive 
     * @returns {HRESULT} 
     */
    get_minExclusive(minExclusive) {
        result := ComCall(19, this, "ptr", minExclusive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} minInclusive 
     * @returns {HRESULT} 
     */
    get_minInclusive(minInclusive) {
        result := ComCall(20, this, "ptr", minInclusive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} maxExclusive 
     * @returns {HRESULT} 
     */
    get_maxExclusive(maxExclusive) {
        result := ComCall(21, this, "ptr", maxExclusive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} maxInclusive 
     * @returns {HRESULT} 
     */
    get_maxInclusive(maxInclusive) {
        result := ComCall(22, this, "ptr", maxInclusive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} totalDigits 
     * @returns {HRESULT} 
     */
    get_totalDigits(totalDigits) {
        result := ComCall(23, this, "ptr", totalDigits, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} fractionDigits 
     * @returns {HRESULT} 
     */
    get_fractionDigits(fractionDigits) {
        result := ComCall(24, this, "ptr", fractionDigits, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} length 
     * @returns {HRESULT} 
     */
    get_length(length) {
        result := ComCall(25, this, "ptr", length, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} minLength 
     * @returns {HRESULT} 
     */
    get_minLength(minLength) {
        result := ComCall(26, this, "ptr", minLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} maxLength 
     * @returns {HRESULT} 
     */
    get_maxLength(maxLength) {
        result := ComCall(27, this, "ptr", maxLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaStringCollection>} enumeration 
     * @returns {HRESULT} 
     */
    get_enumeration(enumeration) {
        result := ComCall(28, this, "ptr*", enumeration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} whitespace 
     * @returns {HRESULT} 
     */
    get_whitespace(whitespace) {
        whitespaceMarshal := whitespace is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, whitespaceMarshal, whitespace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaStringCollection>} patterns 
     * @returns {HRESULT} 
     */
    get_patterns(patterns) {
        result := ComCall(30, this, "ptr*", patterns, "HRESULT")
        return result
    }
}
