#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_XML_BLOB.ahk" { CRYPT_XML_BLOB }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }

/**
 * Parses the KeyValue element and creates a Cryptography API:\_Next Generation (CNG) BCrypt key handle to verify a signature.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/nc-cryptxml-cryptxmldllcreatekey
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CryptXmlDllCreateKey {
    value : IntPtr

    __value {
        set {
            if (value is CryptXmlDllCreateKey) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CRYPT_XML_BLOB>} pEncoded A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_blob">CRYPT_XML_BLOB</a> structure that contains the <b>KeyValue</b> element.
     * @returns {BCRYPT_KEY_HANDLE} A pointer to a <b>BCRYPT_KEY_HANDLE</b> variable that receives the handle of the key used to verify the signature.
     * 
     * When CryptXML has finished using the key, CryptXML frees it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptdestroykey">BCryptDestroyKey</a> function.
     */
    Call(pEncoded) {
        phKey := BCRYPT_KEY_HANDLE.Owned()
        result := DllCall(this.value, CRYPT_XML_BLOB.Ptr, pEncoded, BCRYPT_KEY_HANDLE.Ptr, phKey, "HRESULT")
        return phKey
    }

    /**
     * A CryptXmlDllCreateKey that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CryptXmlDllCreateKey {
        /**
         * Creates a CryptXmlDllCreateKey pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_XML_BLOB) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_XML_BLOB.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
