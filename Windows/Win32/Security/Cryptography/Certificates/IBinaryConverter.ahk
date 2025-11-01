#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * 
     * @param {BSTR} strEncodedIn 
     * @param {Integer} EncodingIn 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pstrEncoded 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ibinaryconverter-stringtostring
     */
    StringToString(strEncodedIn, EncodingIn, Encoding, pstrEncoded) {
        strEncodedIn := strEncodedIn is String ? BSTR.Alloc(strEncodedIn).Value : strEncodedIn

        result := ComCall(7, this, "ptr", strEncodedIn, "int", EncodingIn, "int", Encoding, "ptr", pstrEncoded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarByteArray 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pstrEncoded 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ibinaryconverter-variantbytearraytostring
     */
    VariantByteArrayToString(pvarByteArray, Encoding, pstrEncoded) {
        result := ComCall(8, this, "ptr", pvarByteArray, "int", Encoding, "ptr", pstrEncoded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strEncoded 
     * @param {Integer} Encoding 
     * @param {Pointer<VARIANT>} pvarByteArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ibinaryconverter-stringtovariantbytearray
     */
    StringToVariantByteArray(strEncoded, Encoding, pvarByteArray) {
        strEncoded := strEncoded is String ? BSTR.Alloc(strEncoded).Value : strEncoded

        result := ComCall(9, this, "ptr", strEncoded, "int", Encoding, "ptr", pvarByteArray, "HRESULT")
        return result
    }
}
