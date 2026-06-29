#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Used to represent the value of an IADsPropertyEntry object in a predefined data type.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadspropertyvalue
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsPropertyValue extends IDispatch {
    /**
     * The interface identifier for IADsPropertyValue
     * @type {Guid}
     */
    static IID := Guid("{79fa9ad0-a97c-11d0-8534-00c04fd8d503}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsPropertyValue interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Clear                  : IntPtr
        get_ADsType            : IntPtr
        put_ADsType            : IntPtr
        get_DNString           : IntPtr
        put_DNString           : IntPtr
        get_CaseExactString    : IntPtr
        put_CaseExactString    : IntPtr
        get_CaseIgnoreString   : IntPtr
        put_CaseIgnoreString   : IntPtr
        get_PrintableString    : IntPtr
        put_PrintableString    : IntPtr
        get_NumericString      : IntPtr
        put_NumericString      : IntPtr
        get_Boolean            : IntPtr
        put_Boolean            : IntPtr
        get_Integer            : IntPtr
        put_Integer            : IntPtr
        get_OctetString        : IntPtr
        put_OctetString        : IntPtr
        get_SecurityDescriptor : IntPtr
        put_SecurityDescriptor : IntPtr
        get_LargeInteger       : IntPtr
        put_LargeInteger       : IntPtr
        get_UTCTime            : IntPtr
        put_UTCTime            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsPropertyValue.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Clears the current values of the property value object.
     * @remarks
     * None
     * @returns {HRESULT} This method supports the standard HRESULT return values, including S_OK. For more information and other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
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
        retval := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDNString 
     * @returns {HRESULT} 
     */
    put_DNString(bstrDNString) {
        bstrDNString := bstrDNString is String ? BSTR.Alloc(bstrDNString).Value : bstrDNString

        result := ComCall(11, this, BSTR, bstrDNString, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_CaseExactString() {
        retval := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrCaseExactString 
     * @returns {HRESULT} 
     */
    put_CaseExactString(bstrCaseExactString) {
        bstrCaseExactString := bstrCaseExactString is String ? BSTR.Alloc(bstrCaseExactString).Value : bstrCaseExactString

        result := ComCall(13, this, BSTR, bstrCaseExactString, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_CaseIgnoreString() {
        retval := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrCaseIgnoreString 
     * @returns {HRESULT} 
     */
    put_CaseIgnoreString(bstrCaseIgnoreString) {
        bstrCaseIgnoreString := bstrCaseIgnoreString is String ? BSTR.Alloc(bstrCaseIgnoreString).Value : bstrCaseIgnoreString

        result := ComCall(15, this, BSTR, bstrCaseIgnoreString, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PrintableString() {
        retval := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrPrintableString 
     * @returns {HRESULT} 
     */
    put_PrintableString(bstrPrintableString) {
        bstrPrintableString := bstrPrintableString is String ? BSTR.Alloc(bstrPrintableString).Value : bstrPrintableString

        result := ComCall(17, this, BSTR, bstrPrintableString, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_NumericString() {
        retval := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrNumericString 
     * @returns {HRESULT} 
     */
    put_NumericString(bstrNumericString) {
        bstrNumericString := bstrNumericString is String ? BSTR.Alloc(bstrNumericString).Value : bstrNumericString

        result := ComCall(19, this, BSTR, bstrNumericString, "HRESULT")
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
        result := ComCall(24, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vOctetString 
     * @returns {HRESULT} 
     */
    put_OctetString(vOctetString) {
        result := ComCall(25, this, VARIANT, vOctetString, "HRESULT")
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

    Query(iid) {
        if (IADsPropertyValue.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
        this.vtbl.get_ADsType := CallbackCreate(GetMethod(implObj, "get_ADsType"), flags, 2)
        this.vtbl.put_ADsType := CallbackCreate(GetMethod(implObj, "put_ADsType"), flags, 2)
        this.vtbl.get_DNString := CallbackCreate(GetMethod(implObj, "get_DNString"), flags, 2)
        this.vtbl.put_DNString := CallbackCreate(GetMethod(implObj, "put_DNString"), flags, 2)
        this.vtbl.get_CaseExactString := CallbackCreate(GetMethod(implObj, "get_CaseExactString"), flags, 2)
        this.vtbl.put_CaseExactString := CallbackCreate(GetMethod(implObj, "put_CaseExactString"), flags, 2)
        this.vtbl.get_CaseIgnoreString := CallbackCreate(GetMethod(implObj, "get_CaseIgnoreString"), flags, 2)
        this.vtbl.put_CaseIgnoreString := CallbackCreate(GetMethod(implObj, "put_CaseIgnoreString"), flags, 2)
        this.vtbl.get_PrintableString := CallbackCreate(GetMethod(implObj, "get_PrintableString"), flags, 2)
        this.vtbl.put_PrintableString := CallbackCreate(GetMethod(implObj, "put_PrintableString"), flags, 2)
        this.vtbl.get_NumericString := CallbackCreate(GetMethod(implObj, "get_NumericString"), flags, 2)
        this.vtbl.put_NumericString := CallbackCreate(GetMethod(implObj, "put_NumericString"), flags, 2)
        this.vtbl.get_Boolean := CallbackCreate(GetMethod(implObj, "get_Boolean"), flags, 2)
        this.vtbl.put_Boolean := CallbackCreate(GetMethod(implObj, "put_Boolean"), flags, 2)
        this.vtbl.get_Integer := CallbackCreate(GetMethod(implObj, "get_Integer"), flags, 2)
        this.vtbl.put_Integer := CallbackCreate(GetMethod(implObj, "put_Integer"), flags, 2)
        this.vtbl.get_OctetString := CallbackCreate(GetMethod(implObj, "get_OctetString"), flags, 2)
        this.vtbl.put_OctetString := CallbackCreate(GetMethod(implObj, "put_OctetString"), flags, 2)
        this.vtbl.get_SecurityDescriptor := CallbackCreate(GetMethod(implObj, "get_SecurityDescriptor"), flags, 2)
        this.vtbl.put_SecurityDescriptor := CallbackCreate(GetMethod(implObj, "put_SecurityDescriptor"), flags, 2)
        this.vtbl.get_LargeInteger := CallbackCreate(GetMethod(implObj, "get_LargeInteger"), flags, 2)
        this.vtbl.put_LargeInteger := CallbackCreate(GetMethod(implObj, "put_LargeInteger"), flags, 2)
        this.vtbl.get_UTCTime := CallbackCreate(GetMethod(implObj, "get_UTCTime"), flags, 2)
        this.vtbl.put_UTCTime := CallbackCreate(GetMethod(implObj, "put_UTCTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.get_ADsType)
        CallbackFree(this.vtbl.put_ADsType)
        CallbackFree(this.vtbl.get_DNString)
        CallbackFree(this.vtbl.put_DNString)
        CallbackFree(this.vtbl.get_CaseExactString)
        CallbackFree(this.vtbl.put_CaseExactString)
        CallbackFree(this.vtbl.get_CaseIgnoreString)
        CallbackFree(this.vtbl.put_CaseIgnoreString)
        CallbackFree(this.vtbl.get_PrintableString)
        CallbackFree(this.vtbl.put_PrintableString)
        CallbackFree(this.vtbl.get_NumericString)
        CallbackFree(this.vtbl.put_NumericString)
        CallbackFree(this.vtbl.get_Boolean)
        CallbackFree(this.vtbl.put_Boolean)
        CallbackFree(this.vtbl.get_Integer)
        CallbackFree(this.vtbl.put_Integer)
        CallbackFree(this.vtbl.get_OctetString)
        CallbackFree(this.vtbl.put_OctetString)
        CallbackFree(this.vtbl.get_SecurityDescriptor)
        CallbackFree(this.vtbl.put_SecurityDescriptor)
        CallbackFree(this.vtbl.get_LargeInteger)
        CallbackFree(this.vtbl.put_LargeInteger)
        CallbackFree(this.vtbl.get_UTCTime)
        CallbackFree(this.vtbl.put_UTCTime)
    }
}
