#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to represent the value of an IADsPropertyEntry object in a predefined data type.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadspropertyvalue
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsPropertyValue extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsPropertyValue
     * @type {Guid}
     */
    static IID => Guid("{79fa9ad0-a97c-11d0-8534-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clear", "get_ADsType", "put_ADsType", "get_DNString", "put_DNString", "get_CaseExactString", "put_CaseExactString", "get_CaseIgnoreString", "put_CaseIgnoreString", "get_PrintableString", "put_PrintableString", "get_NumericString", "put_NumericString", "get_Boolean", "put_Boolean", "get_Integer", "put_Integer", "get_OctetString", "put_OctetString", "get_SecurityDescriptor", "put_SecurityDescriptor", "get_LargeInteger", "put_LargeInteger", "get_UTCTime", "put_UTCTime"]

    /**
     * @type {Integer} 
     */
    ADsType {
        get => this.get_ADsType()
        set => this.put_ADsType(value)
    }

    /**
     * @type {BSTR} 
     */
    DNString {
        get => this.get_DNString()
        set => this.put_DNString(value)
    }

    /**
     * @type {BSTR} 
     */
    CaseExactString {
        get => this.get_CaseExactString()
        set => this.put_CaseExactString(value)
    }

    /**
     * @type {BSTR} 
     */
    CaseIgnoreString {
        get => this.get_CaseIgnoreString()
        set => this.put_CaseIgnoreString(value)
    }

    /**
     * @type {BSTR} 
     */
    PrintableString {
        get => this.get_PrintableString()
        set => this.put_PrintableString(value)
    }

    /**
     * @type {BSTR} 
     */
    NumericString {
        get => this.get_NumericString()
        set => this.put_NumericString(value)
    }

    /**
     * @type {Integer} 
     */
    Boolean {
        get => this.get_Boolean()
        set => this.put_Boolean(value)
    }

    /**
     * @type {Integer} 
     */
    Integer {
        get => this.get_Integer()
        set => this.put_Integer(value)
    }

    /**
     * @type {VARIANT} 
     */
    OctetString {
        get => this.get_OctetString()
        set => this.put_OctetString(value)
    }

    /**
     * @type {IDispatch} 
     */
    SecurityDescriptor {
        get => this.get_SecurityDescriptor()
        set => this.put_SecurityDescriptor(value)
    }

    /**
     * @type {IDispatch} 
     */
    LargeInteger {
        get => this.get_LargeInteger()
        set => this.put_LargeInteger(value)
    }

    /**
     * @type {Float} 
     */
    UTCTime {
        get => this.get_UTCTime()
        set => this.put_UTCTime(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspropertyvalue-clear
     */
    Clear() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ADsType() {
        result := ComCall(8, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnADsType 
     * @returns {HRESULT} 
     */
    put_ADsType(lnADsType) {
        result := ComCall(9, this, "int", lnADsType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DNString() {
        retval := BSTR()
        result := ComCall(10, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDNString 
     * @returns {HRESULT} 
     */
    put_DNString(bstrDNString) {
        bstrDNString := bstrDNString is String ? BSTR.Alloc(bstrDNString).Value : bstrDNString

        result := ComCall(11, this, "ptr", bstrDNString, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_CaseExactString() {
        retval := BSTR()
        result := ComCall(12, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrCaseExactString 
     * @returns {HRESULT} 
     */
    put_CaseExactString(bstrCaseExactString) {
        bstrCaseExactString := bstrCaseExactString is String ? BSTR.Alloc(bstrCaseExactString).Value : bstrCaseExactString

        result := ComCall(13, this, "ptr", bstrCaseExactString, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_CaseIgnoreString() {
        retval := BSTR()
        result := ComCall(14, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrCaseIgnoreString 
     * @returns {HRESULT} 
     */
    put_CaseIgnoreString(bstrCaseIgnoreString) {
        bstrCaseIgnoreString := bstrCaseIgnoreString is String ? BSTR.Alloc(bstrCaseIgnoreString).Value : bstrCaseIgnoreString

        result := ComCall(15, this, "ptr", bstrCaseIgnoreString, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PrintableString() {
        retval := BSTR()
        result := ComCall(16, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrPrintableString 
     * @returns {HRESULT} 
     */
    put_PrintableString(bstrPrintableString) {
        bstrPrintableString := bstrPrintableString is String ? BSTR.Alloc(bstrPrintableString).Value : bstrPrintableString

        result := ComCall(17, this, "ptr", bstrPrintableString, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_NumericString() {
        retval := BSTR()
        result := ComCall(18, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrNumericString 
     * @returns {HRESULT} 
     */
    put_NumericString(bstrNumericString) {
        bstrNumericString := bstrNumericString is String ? BSTR.Alloc(bstrNumericString).Value : bstrNumericString

        result := ComCall(19, this, "ptr", bstrNumericString, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Boolean() {
        result := ComCall(20, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnBoolean 
     * @returns {HRESULT} 
     */
    put_Boolean(lnBoolean) {
        result := ComCall(21, this, "int", lnBoolean, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Integer() {
        result := ComCall(22, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnInteger 
     * @returns {HRESULT} 
     */
    put_Integer(lnInteger) {
        result := ComCall(23, this, "int", lnInteger, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_OctetString() {
        retval := VARIANT()
        result := ComCall(24, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vOctetString 
     * @returns {HRESULT} 
     */
    put_OctetString(vOctetString) {
        result := ComCall(25, this, "ptr", vOctetString, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_SecurityDescriptor() {
        result := ComCall(26, this, "ptr*", &retval := 0, "HRESULT")
        return IDispatch(retval)
    }

    /**
     * 
     * @param {IDispatch} pSecurityDescriptor 
     * @returns {HRESULT} 
     */
    put_SecurityDescriptor(pSecurityDescriptor) {
        result := ComCall(27, this, "ptr", pSecurityDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_LargeInteger() {
        result := ComCall(28, this, "ptr*", &retval := 0, "HRESULT")
        return IDispatch(retval)
    }

    /**
     * 
     * @param {IDispatch} pLargeInteger 
     * @returns {HRESULT} 
     */
    put_LargeInteger(pLargeInteger) {
        result := ComCall(29, this, "ptr", pLargeInteger, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_UTCTime() {
        result := ComCall(30, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Float} daUTCTime 
     * @returns {HRESULT} 
     */
    put_UTCTime(daUTCTime) {
        result := ComCall(31, this, "double", daUTCTime, "HRESULT")
        return result
    }
}
