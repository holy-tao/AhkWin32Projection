#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ISchemaItem.ahk
#Include .\ISchemaItemCollection.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\ISchemaStringCollection.ahk
#Include ..\..\..\Foundation\VARIANT_BOOL.ahk
#Include .\SCHEMAWHITESPACE.ahk
#Include ..\..\..\Foundation\HRESULT.ahk
#Include .\SCHEMATYPEVARIETY.ahk
#Include .\SCHEMADERIVATIONMETHOD.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class ISchemaType extends ISchemaItem {

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
     * @type {ISchemaItemCollection} 
     */
    baseTypes {
        get => this.get_baseTypes()
    }

    /**
     * @type {SCHEMADERIVATIONMETHOD} 
     */
    final {
        get => this.get_final()
    }

    /**
     * @type {SCHEMATYPEVARIETY} 
     */
    variety {
        get => this.get_variety()
    }

    /**
     * @type {SCHEMADERIVATIONMETHOD} 
     */
    derivedBy {
        get => this.get_derivedBy()
    }

    /**
     * @type {BSTR} 
     */
    minExclusive {
        get => this.get_minExclusive()
    }

    /**
     * @type {BSTR} 
     */
    minInclusive {
        get => this.get_minInclusive()
    }

    /**
     * @type {BSTR} 
     */
    maxExclusive {
        get => this.get_maxExclusive()
    }

    /**
     * @type {BSTR} 
     */
    maxInclusive {
        get => this.get_maxInclusive()
    }

    /**
     * @type {VARIANT} 
     */
    totalDigits {
        get => this.get_totalDigits()
    }

    /**
     * @type {VARIANT} 
     */
    fractionDigits {
        get => this.get_fractionDigits()
    }

    /**
     * @type {VARIANT} 
     */
    length {
        get => this.get_length()
    }

    /**
     * @type {VARIANT} 
     */
    minLength {
        get => this.get_minLength()
    }

    /**
     * @type {VARIANT} 
     */
    maxLength {
        get => this.get_maxLength()
    }

    /**
     * @type {ISchemaStringCollection} 
     */
    enumeration {
        get => this.get_enumeration()
    }

    /**
     * @type {SCHEMAWHITESPACE} 
     */
    whitespace {
        get => this.get_whitespace()
    }

    /**
     * @type {ISchemaStringCollection} 
     */
    patterns {
        get => this.get_patterns()
    }

    /**
     * 
     * @returns {ISchemaItemCollection} 
     */
    get_baseTypes() {
        result := ComCall(14, this, "ptr*", &baseTypes := 0, "HRESULT")
        return ISchemaItemCollection(baseTypes)
    }

    /**
     * 
     * @returns {SCHEMADERIVATIONMETHOD} 
     */
    get_final() {
        result := ComCall(15, this, "int*", &final := 0, "HRESULT")
        return final
    }

    /**
     * 
     * @returns {SCHEMATYPEVARIETY} 
     */
    get_variety() {
        result := ComCall(16, this, "int*", &variety := 0, "HRESULT")
        return variety
    }

    /**
     * 
     * @returns {SCHEMADERIVATIONMETHOD} 
     */
    get_derivedBy() {
        result := ComCall(17, this, "int*", &derivedBy := 0, "HRESULT")
        return derivedBy
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {VARIANT_BOOL} 
     */
    isValid(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(18, this, "ptr", data, "short*", &valid := 0, "HRESULT")
        return valid
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_minExclusive() {
        minExclusive := BSTR({Value: 0}, True)
        result := ComCall(19, this, "ptr", minExclusive, "HRESULT")
        return minExclusive
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_minInclusive() {
        minInclusive := BSTR({Value: 0}, True)
        result := ComCall(20, this, "ptr", minInclusive, "HRESULT")
        return minInclusive
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_maxExclusive() {
        maxExclusive := BSTR({Value: 0}, True)
        result := ComCall(21, this, "ptr", maxExclusive, "HRESULT")
        return maxExclusive
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_maxInclusive() {
        maxInclusive := BSTR({Value: 0}, True)
        result := ComCall(22, this, "ptr", maxInclusive, "HRESULT")
        return maxInclusive
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_totalDigits() {
        totalDigits := VARIANT()
        result := ComCall(23, this, "ptr", totalDigits, "HRESULT")
        return totalDigits
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_fractionDigits() {
        fractionDigits := VARIANT()
        result := ComCall(24, this, "ptr", fractionDigits, "HRESULT")
        return fractionDigits
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_length() {
        length := VARIANT()
        result := ComCall(25, this, "ptr", length, "HRESULT")
        return length
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_minLength() {
        minLength := VARIANT()
        result := ComCall(26, this, "ptr", minLength, "HRESULT")
        return minLength
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_maxLength() {
        maxLength := VARIANT()
        result := ComCall(27, this, "ptr", maxLength, "HRESULT")
        return maxLength
    }

    /**
     * 
     * @returns {ISchemaStringCollection} 
     */
    get_enumeration() {
        result := ComCall(28, this, "ptr*", &enumeration := 0, "HRESULT")
        return ISchemaStringCollection(enumeration)
    }

    /**
     * 
     * @returns {SCHEMAWHITESPACE} 
     */
    get_whitespace() {
        result := ComCall(29, this, "int*", &whitespace := 0, "HRESULT")
        return whitespace
    }

    /**
     * 
     * @returns {ISchemaStringCollection} 
     */
    get_patterns() {
        result := ComCall(30, this, "ptr*", &patterns := 0, "HRESULT")
        return ISchemaStringCollection(patterns)
    }
}
