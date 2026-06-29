#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Contains general methods that enable you to create a Unicode-encoded string from a byte array, create a byte array from a Unicode-encoded string, and modify the type of Unicode encoding applied to a string.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ibinaryconverter
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IBinaryConverter extends IDispatch {
    /**
     * The interface identifier for IBinaryConverter
     * @type {Guid}
     */
    static IID := Guid("{728ab302-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBinaryConverter interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        StringToString           : IntPtr
        VariantByteArrayToString : IntPtr
        StringToVariantByteArray : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBinaryConverter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Modifies the type of Unicode encoding applied to a string.
     * @param {BSTR} strEncodedIn A <b>BSTR</b> variable that contains the string to modify.
     * @param {EncodingType} EncodingIn An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the Unicode encoding applied to  the input string.
     * @param {EncodingType} Encoding An  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding to apply to the output string. The default value is <b>XCN_CRYPT_STRING_BASE64</b>.
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that contains the encoded output string.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ibinaryconverter-stringtostring
     */
    StringToString(strEncodedIn, EncodingIn, Encoding) {
        strEncodedIn := strEncodedIn is String ? BSTR.Alloc(strEncodedIn).Value : strEncodedIn

        pstrEncoded := BSTR.Owned()
        result := ComCall(7, this, BSTR, strEncodedIn, EncodingType, EncodingIn, EncodingType, Encoding, BSTR.Ptr, pstrEncoded, "HRESULT")
        return pstrEncoded
    }

    /**
     * Creates a Unicode encoded string from a byte array.
     * @param {Pointer<VARIANT>} pvarByteArray Pointer to a  <b>VARIANT</b> array of bytes to be encoded. Each byte in the array must be an unsigned integer. That is, the VARTYPE enumeration value must equal <b>VT_ARRAY</b> | <b>VT_UI1</b>.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the Unicode encoding applied to the input string. The default value is <b>XCN_CRYPT_STRING_BASE64</b>.
     * @returns {BSTR} Pointer to a  <b>BSTR</b> variable that contains the Unicode-encoded certificate.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ibinaryconverter-variantbytearraytostring
     */
    VariantByteArrayToString(pvarByteArray, Encoding) {
        pstrEncoded := BSTR.Owned()
        result := ComCall(8, this, VARIANT.Ptr, pvarByteArray, EncodingType, Encoding, BSTR.Ptr, pstrEncoded, "HRESULT")
        return pstrEncoded
    }

    /**
     * Creates a byte array from a Unicode encoded string.
     * @param {BSTR} strEncoded A <b>BSTR</b> variable that contains the Unicode encoded string.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the Unicode encoding applied to the input string. The default value is <b>XCN_CRYPT_STRING_BASE64</b>.
     * @returns {VARIANT} Pointer to a  <b>VARIANT</b> array of bytes. The VARTYPE enumeration value equals <b>VT_ARRAY</b> | <b>VT_UI1</b>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ibinaryconverter-stringtovariantbytearray
     */
    StringToVariantByteArray(strEncoded, Encoding) {
        strEncoded := strEncoded is String ? BSTR.Alloc(strEncoded).Value : strEncoded

        pvarByteArray := VARIANT()
        result := ComCall(9, this, BSTR, strEncoded, EncodingType, Encoding, VARIANT.Ptr, pvarByteArray, "HRESULT")
        return pvarByteArray
    }

    Query(iid) {
        if (IBinaryConverter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StringToString := CallbackCreate(GetMethod(implObj, "StringToString"), flags, 5)
        this.vtbl.VariantByteArrayToString := CallbackCreate(GetMethod(implObj, "VariantByteArrayToString"), flags, 4)
        this.vtbl.StringToVariantByteArray := CallbackCreate(GetMethod(implObj, "StringToVariantByteArray"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StringToString)
        CallbackFree(this.vtbl.VariantByteArrayToString)
        CallbackFree(this.vtbl.StringToVariantByteArray)
    }
}
