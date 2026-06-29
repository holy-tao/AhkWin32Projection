#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISchemaItemCollection.ahk" { ISchemaItemCollection }
#Import ".\ISchemaStringCollection.ahk" { ISchemaStringCollection }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\SCHEMAWHITESPACE.ahk" { SCHEMAWHITESPACE }
#Import ".\ISchemaItem.ahk" { ISchemaItem }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SCHEMATYPEVARIETY.ahk" { SCHEMATYPEVARIETY }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\SCHEMADERIVATIONMETHOD.ahk" { SCHEMADERIVATIONMETHOD }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISchemaType extends ISchemaItem {
    /**
     * The interface identifier for ISchemaType
     * @type {Guid}
     */
    static IID := Guid("{50ea08b8-dd1b-4664-9a50-c2f40f4bd79a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchemaType interfaces
    */
    struct Vtbl extends ISchemaItem.Vtbl {
        get_baseTypes      : IntPtr
        get_final          : IntPtr
        get_variety        : IntPtr
        get_derivedBy      : IntPtr
        isValid            : IntPtr
        get_minExclusive   : IntPtr
        get_minInclusive   : IntPtr
        get_maxExclusive   : IntPtr
        get_maxInclusive   : IntPtr
        get_totalDigits    : IntPtr
        get_fractionDigits : IntPtr
        get_length         : IntPtr
        get_minLength      : IntPtr
        get_maxLength      : IntPtr
        get_enumeration    : IntPtr
        get_whitespace     : IntPtr
        get_patterns       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchemaType.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

        result := ComCall(18, this, BSTR, data, VARIANT_BOOL.Ptr, &valid := 0, "HRESULT")
        return valid
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_minExclusive() {
        minExclusive := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, minExclusive, "HRESULT")
        return minExclusive
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_minInclusive() {
        minInclusive := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, minInclusive, "HRESULT")
        return minInclusive
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_maxExclusive() {
        maxExclusive := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, maxExclusive, "HRESULT")
        return maxExclusive
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_maxInclusive() {
        maxInclusive := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, maxInclusive, "HRESULT")
        return maxInclusive
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_totalDigits() {
        totalDigits := VARIANT()
        result := ComCall(23, this, VARIANT.Ptr, totalDigits, "HRESULT")
        return totalDigits
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_fractionDigits() {
        fractionDigits := VARIANT()
        result := ComCall(24, this, VARIANT.Ptr, fractionDigits, "HRESULT")
        return fractionDigits
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_length() {
        length := VARIANT()
        result := ComCall(25, this, VARIANT.Ptr, length, "HRESULT")
        return length
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_minLength() {
        minLength := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, minLength, "HRESULT")
        return minLength
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_maxLength() {
        maxLength := VARIANT()
        result := ComCall(27, this, VARIANT.Ptr, maxLength, "HRESULT")
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

    Query(iid) {
        if (ISchemaType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_baseTypes := CallbackCreate(GetMethod(implObj, "get_baseTypes"), flags, 2)
        this.vtbl.get_final := CallbackCreate(GetMethod(implObj, "get_final"), flags, 2)
        this.vtbl.get_variety := CallbackCreate(GetMethod(implObj, "get_variety"), flags, 2)
        this.vtbl.get_derivedBy := CallbackCreate(GetMethod(implObj, "get_derivedBy"), flags, 2)
        this.vtbl.isValid := CallbackCreate(GetMethod(implObj, "isValid"), flags, 3)
        this.vtbl.get_minExclusive := CallbackCreate(GetMethod(implObj, "get_minExclusive"), flags, 2)
        this.vtbl.get_minInclusive := CallbackCreate(GetMethod(implObj, "get_minInclusive"), flags, 2)
        this.vtbl.get_maxExclusive := CallbackCreate(GetMethod(implObj, "get_maxExclusive"), flags, 2)
        this.vtbl.get_maxInclusive := CallbackCreate(GetMethod(implObj, "get_maxInclusive"), flags, 2)
        this.vtbl.get_totalDigits := CallbackCreate(GetMethod(implObj, "get_totalDigits"), flags, 2)
        this.vtbl.get_fractionDigits := CallbackCreate(GetMethod(implObj, "get_fractionDigits"), flags, 2)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.get_minLength := CallbackCreate(GetMethod(implObj, "get_minLength"), flags, 2)
        this.vtbl.get_maxLength := CallbackCreate(GetMethod(implObj, "get_maxLength"), flags, 2)
        this.vtbl.get_enumeration := CallbackCreate(GetMethod(implObj, "get_enumeration"), flags, 2)
        this.vtbl.get_whitespace := CallbackCreate(GetMethod(implObj, "get_whitespace"), flags, 2)
        this.vtbl.get_patterns := CallbackCreate(GetMethod(implObj, "get_patterns"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_baseTypes)
        CallbackFree(this.vtbl.get_final)
        CallbackFree(this.vtbl.get_variety)
        CallbackFree(this.vtbl.get_derivedBy)
        CallbackFree(this.vtbl.isValid)
        CallbackFree(this.vtbl.get_minExclusive)
        CallbackFree(this.vtbl.get_minInclusive)
        CallbackFree(this.vtbl.get_maxExclusive)
        CallbackFree(this.vtbl.get_maxInclusive)
        CallbackFree(this.vtbl.get_totalDigits)
        CallbackFree(this.vtbl.get_fractionDigits)
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.get_minLength)
        CallbackFree(this.vtbl.get_maxLength)
        CallbackFree(this.vtbl.get_enumeration)
        CallbackFree(this.vtbl.get_whitespace)
        CallbackFree(this.vtbl.get_patterns)
    }
}
