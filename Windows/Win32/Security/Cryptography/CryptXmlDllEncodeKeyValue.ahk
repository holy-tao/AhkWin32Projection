#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PFN_CRYPT_XML_WRITE_CALLBACK.ahk" { PFN_CRYPT_XML_WRITE_CALLBACK }
#Import ".\CRYPT_XML_CHARSET.ahk" { CRYPT_XML_CHARSET }

/**
 * Encodes a KeyValue element.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/nc-cryptxml-cryptxmldllencodekeyvalue
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CryptXmlDllEncodeKeyValue {
    value : IntPtr

    __value {
        set {
            if (value is CryptXmlDllEncodeKeyValue) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {NCRYPT_KEY_HANDLE} _hKey The handle of the key value to encode.
     * @param {CRYPT_XML_CHARSET} dwCharset A value of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ne-cryptxml-crypt_xml_charset">CRYPT_XML_CHARSET</a> enumeration that specifies the character set of the encoded XML.
     * @param {Pointer<Void>} pvCallbackState A pointer to an argument that is passed to the callback function pointed to by the <i>pfnWrite</i> parameter.
     * @param {Pointer<PFN_CRYPT_XML_WRITE_CALLBACK>} _pfnWrite An application defined callback function that receives the encoded XML.
     * @returns {HRESULT} If the function succeeds, the function returns zero.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error.
     */
    Call(_hKey, dwCharset, pvCallbackState, _pfnWrite) {
        pvCallbackStateMarshal := pvCallbackState is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, NCRYPT_KEY_HANDLE, _hKey, CRYPT_XML_CHARSET, dwCharset, pvCallbackStateMarshal, pvCallbackState, PFN_CRYPT_XML_WRITE_CALLBACK, _pfnWrite, "HRESULT")
        return result
    }

    /**
     * A CryptXmlDllEncodeKeyValue that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CryptXmlDllEncodeKeyValue {
        /**
         * Creates a CryptXmlDllEncodeKeyValue pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_KEY_HANDLE, CRYPT_XML_CHARSET, "ptr", PFN_CRYPT_XML_WRITE_CALLBACK) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_KEY_HANDLE, CRYPT_XML_CHARSET, "ptr", PFN_CRYPT_XML_WRITE_CALLBACK, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
