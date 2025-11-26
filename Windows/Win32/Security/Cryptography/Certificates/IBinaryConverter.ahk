#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Contains general methods that enable you to create a Unicode-encoded string from a byte array, create a byte array from a Unicode-encoded string, and modify the type of Unicode encoding applied to a string.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ibinaryconverter
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IBinaryConverter extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBinaryConverter
     * @type {Guid}
     */
    static IID => Guid("{728ab302-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StringToString", "VariantByteArrayToString", "StringToVariantByteArray"]

    /**
     * Modifies the type of Unicode encoding applied to a string.
     * @param {BSTR} strEncodedIn A <b>BSTR</b> variable that contains the string to modify.
     * @param {Integer} EncodingIn An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the Unicode encoding applied to  the input string.
     * @param {Integer} Encoding An  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding to apply to the output string. The default value is <b>XCN_CRYPT_STRING_BASE64</b>.
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that contains the encoded output string.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ibinaryconverter-stringtostring
     */
    StringToString(strEncodedIn, EncodingIn, Encoding) {
        strEncodedIn := strEncodedIn is String ? BSTR.Alloc(strEncodedIn).Value : strEncodedIn

        pstrEncoded := BSTR()
        result := ComCall(7, this, "ptr", strEncodedIn, "int", EncodingIn, "int", Encoding, "ptr", pstrEncoded, "HRESULT")
        return pstrEncoded
    }

    /**
     * Creates a Unicode encoded string from a byte array.
     * @param {Pointer<VARIANT>} pvarByteArray Pointer to a  <b>VARIANT</b> array of bytes to be encoded. Each byte in the array must be an unsigned integer. That is, the VARTYPE enumeration value must equal <b>VT_ARRAY</b> | <b>VT_UI1</b>.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the Unicode encoding applied to the input string. The default value is <b>XCN_CRYPT_STRING_BASE64</b>.
     * @returns {BSTR} Pointer to a  <b>BSTR</b> variable that contains the Unicode-encoded certificate.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ibinaryconverter-variantbytearraytostring
     */
    VariantByteArrayToString(pvarByteArray, Encoding) {
        pstrEncoded := BSTR()
        result := ComCall(8, this, "ptr", pvarByteArray, "int", Encoding, "ptr", pstrEncoded, "HRESULT")
        return pstrEncoded
    }

    /**
     * Creates a byte array from a Unicode encoded string.
     * @param {BSTR} strEncoded A <b>BSTR</b> variable that contains the Unicode encoded string.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the Unicode encoding applied to the input string. The default value is <b>XCN_CRYPT_STRING_BASE64</b>.
     * @returns {VARIANT} Pointer to a  <b>VARIANT</b> array of bytes. The VARTYPE enumeration value equals <b>VT_ARRAY</b> | <b>VT_UI1</b>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ibinaryconverter-stringtovariantbytearray
     */
    StringToVariantByteArray(strEncoded, Encoding) {
        strEncoded := strEncoded is String ? BSTR.Alloc(strEncoded).Value : strEncoded

        pvarByteArray := VARIANT()
        result := ComCall(9, this, "ptr", strEncoded, "int", Encoding, "ptr", pvarByteArray, "HRESULT")
        return pvarByteArray
    }
}
