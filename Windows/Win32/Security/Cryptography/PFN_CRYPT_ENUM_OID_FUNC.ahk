#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The CRYPT_ENUM_OID_FUNCTION callback function is used with the CryptEnumOIDFunction function.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_crypt_enum_oid_func
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_ENUM_OID_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_ENUM_OID_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwEncodingType Specifies the encoding type to match. Setting this parameter to CRYPT_MATCH_ANY_ENCODING_TYPE matches any encoding type.
     * 
     * <div class="alert"><b>Note</b>  If CRYPT_MATCH_ANY_ENCODING_TYPE is not specified, either a certificate or message encoding type is required.</div>
     * <div> </div>
     * If the low-order word containing the certificate encoding type is nonzero, it is used. Otherwise, the high-order word containing the message encoding type is used. If both are specified, the certificate encoding type in the low-order word is used.Currently defined encoding types are:
     * 
     * <ul>
     * <li>CRYPT_ASN_ENCODING</li>
     * <li>X509_ASN_ENCODING</li>
     * <li>PKCS_7_ASN_ENCODING</li>
     * <li>CRYPT_MATCH_ANY_ENCODING_TYPE</li>
     * </ul>
     * @param {PSTR} pszFuncName 
     * @param {PSTR} pszOID A pointer to either an OID string, such as "2.5.29.1", 
     * 				  an ASCII string, such as "file", or a numeric string, 
     * 				  such as #2000.
     * @param {Integer} cValue Count of elements in the array of value types.
     * @param {Pointer<Integer>} rgdwValueType 
     * @param {Pointer<PWSTR>} rgpwszValueName 
     * @param {Pointer<Pointer<Integer>>} rgpbValueData 
     * @param {Pointer<Integer>} rgcbValueData 
     * @param {Pointer<Void>} pvArg A pointer to arguments passed through to the callback function.
     * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, <b>FALSE</b> if it fails.
     */
    Call(dwEncodingType, pszFuncName, pszOID, cValue, rgdwValueType, rgpwszValueName, rgpbValueData, rgcbValueData, pvArg) {
        pszFuncName := pszFuncName is String ? StrPtr(pszFuncName) : pszFuncName
        pszOID := pszOID is String ? StrPtr(pszOID) : pszOID

        rgdwValueTypeMarshal := rgdwValueType is VarRef ? "uint*" : "ptr"
        rgpwszValueNameMarshal := rgpwszValueName is VarRef ? "ptr*" : "ptr"
        rgpbValueDataMarshal := rgpbValueData is VarRef ? "ptr*" : "ptr"
        rgcbValueDataMarshal := rgcbValueData is VarRef ? "uint*" : "ptr"
        pvArgMarshal := pvArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, dwEncodingType, "ptr", pszFuncName, "ptr", pszOID, UInt32, cValue, rgdwValueTypeMarshal, rgdwValueType, rgpwszValueNameMarshal, rgpwszValueName, rgpbValueDataMarshal, rgpbValueData, rgcbValueDataMarshal, rgcbValueData, pvArgMarshal, pvArg, BOOL)
        return result
    }

    /**
     * A PFN_CRYPT_ENUM_OID_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_ENUM_OID_FUNC {
        /**
         * Creates a PFN_CRYPT_ENUM_OID_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, PSTR, PSTR, UInt32, "uint*", PWSTR, "ptr*", "uint*", "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, PSTR, PSTR, UInt32, "uint*", PWSTR.Ptr, "ptr*", "uint*", "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
