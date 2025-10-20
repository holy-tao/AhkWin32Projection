#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to represent the value of an IADsPropertyEntry object in a predefined data type.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadspropertyvalue
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsPropertyValue extends IDispatch{
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
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_ADsType(retval) {
        result := ComCall(8, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnADsType 
     * @returns {HRESULT} 
     */
    put_ADsType(lnADsType) {
        result := ComCall(9, this, "int", lnADsType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_DNString(retval) {
        result := ComCall(10, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDNString 
     * @returns {HRESULT} 
     */
    put_DNString(bstrDNString) {
        bstrDNString := bstrDNString is String ? BSTR.Alloc(bstrDNString).Value : bstrDNString

        result := ComCall(11, this, "ptr", bstrDNString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_CaseExactString(retval) {
        result := ComCall(12, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCaseExactString 
     * @returns {HRESULT} 
     */
    put_CaseExactString(bstrCaseExactString) {
        bstrCaseExactString := bstrCaseExactString is String ? BSTR.Alloc(bstrCaseExactString).Value : bstrCaseExactString

        result := ComCall(13, this, "ptr", bstrCaseExactString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_CaseIgnoreString(retval) {
        result := ComCall(14, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCaseIgnoreString 
     * @returns {HRESULT} 
     */
    put_CaseIgnoreString(bstrCaseIgnoreString) {
        bstrCaseIgnoreString := bstrCaseIgnoreString is String ? BSTR.Alloc(bstrCaseIgnoreString).Value : bstrCaseIgnoreString

        result := ComCall(15, this, "ptr", bstrCaseIgnoreString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_PrintableString(retval) {
        result := ComCall(16, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPrintableString 
     * @returns {HRESULT} 
     */
    put_PrintableString(bstrPrintableString) {
        bstrPrintableString := bstrPrintableString is String ? BSTR.Alloc(bstrPrintableString).Value : bstrPrintableString

        result := ComCall(17, this, "ptr", bstrPrintableString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_NumericString(retval) {
        result := ComCall(18, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrNumericString 
     * @returns {HRESULT} 
     */
    put_NumericString(bstrNumericString) {
        bstrNumericString := bstrNumericString is String ? BSTR.Alloc(bstrNumericString).Value : bstrNumericString

        result := ComCall(19, this, "ptr", bstrNumericString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_Boolean(retval) {
        result := ComCall(20, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnBoolean 
     * @returns {HRESULT} 
     */
    put_Boolean(lnBoolean) {
        result := ComCall(21, this, "int", lnBoolean, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_Integer(retval) {
        result := ComCall(22, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnInteger 
     * @returns {HRESULT} 
     */
    put_Integer(lnInteger) {
        result := ComCall(23, this, "int", lnInteger, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_OctetString(retval) {
        result := ComCall(24, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vOctetString 
     * @returns {HRESULT} 
     */
    put_OctetString(vOctetString) {
        result := ComCall(25, this, "ptr", vOctetString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} retval 
     * @returns {HRESULT} 
     */
    get_SecurityDescriptor(retval) {
        result := ComCall(26, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pSecurityDescriptor 
     * @returns {HRESULT} 
     */
    put_SecurityDescriptor(pSecurityDescriptor) {
        result := ComCall(27, this, "ptr", pSecurityDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} retval 
     * @returns {HRESULT} 
     */
    get_LargeInteger(retval) {
        result := ComCall(28, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pLargeInteger 
     * @returns {HRESULT} 
     */
    put_LargeInteger(pLargeInteger) {
        result := ComCall(29, this, "ptr", pLargeInteger, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retval 
     * @returns {HRESULT} 
     */
    get_UTCTime(retval) {
        result := ComCall(30, this, "double*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} daUTCTime 
     * @returns {HRESULT} 
     */
    put_UTCTime(daUTCTime) {
        result := ComCall(31, this, "double", daUTCTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
