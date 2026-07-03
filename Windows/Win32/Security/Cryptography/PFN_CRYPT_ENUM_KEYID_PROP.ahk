#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * The CRYPT_ENUM_KEYID_PROP callback function is used with the CryptEnumKeyIdentifierProperties function.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_crypt_enum_keyid_prop
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_ENUM_KEYID_PROP {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_ENUM_KEYID_PROP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pKeyIdentifier A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> that contains the key identifier.
     * @param {Integer} dwFlags Reserved for future use and must be zero.
     * @param {Pointer<Void>} pvArg A pointer to an argument that is passed back from the callback function.
     * @param {Integer} cProp Count of elements in the array of <i>rgdwPropId</i>
     * @param {Pointer<Integer>} rgdwPropId A pointer to an array of property identifiers. Each entry in the array will be one of the value types listed for in the table for <i>dwPropId</i> in the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptsetkeyidentifierproperty">CryptSetKeyIdentifierProperty</a> function.
     * @param {Pointer<Pointer<Void>>} rgpvData A pointer to an array that contains pointers to <i>pvData</i> elements corresponding the <i>rgdwPropId</i> array elements. 
     * 
     * 
     * 
     * 
     * For CERT_KEY_PROV_INFO_PROP_ID the <i>rgpvData</i> element points to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_key_prov_info">CRYPT_KEY_PROV_INFO</a> structure. For all other properties, the <i>rgpvData</i> element points to an array of bytes.
     * @param {Pointer<Integer>} rgcbData Array of <b>DWORD</b>s that specify the size, in bytes, of corresponding elements in the <i>rgpvData</i> array.
     * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, <b>FALSE</b> if it fails.
     */
    Call(pKeyIdentifier, dwFlags, pvArg, cProp, rgdwPropId, rgpvData, rgcbData) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        pvArgMarshal := pvArg is VarRef ? "ptr" : "ptr"
        rgdwPropIdMarshal := rgdwPropId is VarRef ? "uint*" : "ptr"
        rgpvDataMarshal := rgpvData is VarRef ? "ptr*" : "ptr"
        rgcbDataMarshal := rgcbData is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, CRYPT_INTEGER_BLOB.Ptr, pKeyIdentifier, UInt32, dwFlags, "ptr", pvReserved, pvArgMarshal, pvArg, UInt32, cProp, rgdwPropIdMarshal, rgdwPropId, rgpvDataMarshal, rgpvData, rgcbDataMarshal, rgcbData, BOOL)
        return result
    }

    /**
     * A PFN_CRYPT_ENUM_KEYID_PROP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_ENUM_KEYID_PROP {
        /**
         * Creates a PFN_CRYPT_ENUM_KEYID_PROP pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_INTEGER_BLOB, UInt32, "ptr", UInt32, "uint*", "ptr*", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_INTEGER_BLOB.Ptr, UInt32, "ptr", UInt32, "uint*", "ptr*", "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
