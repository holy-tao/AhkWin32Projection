#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CRYPT_XML_ALGORITHM_INFO.ahk" { CRYPT_XML_ALGORITHM_INFO }
#Import ".\CRYPT_XML_CHARSET.ahk" { CRYPT_XML_CHARSET }
#Import ".\PFN_CRYPT_XML_WRITE_CALLBACK.ahk" { PFN_CRYPT_XML_WRITE_CALLBACK }

/**
 * Encodes SignatureMethod or DigestMethod elements for agile algorithms with default parameters.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/nc-cryptxml-cryptxmldllencodealgorithm
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CryptXmlDllEncodeAlgorithm {
    value : IntPtr

    __value {
        set {
            if (value is CryptXmlDllEncodeAlgorithm) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CRYPT_XML_ALGORITHM_INFO>} pAlgInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_algorithm_info">CRYPT_XML_ALGORITHM_INFO</a> structure.
     * @param {CRYPT_XML_CHARSET} dwCharset A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ne-cryptxml-crypt_xml_charset">CRYPT_XML_CHARSET</a> value that specifies the character set of the encoded XML.
     * @param {Pointer<Void>} pvCallbackState A pointer to an argument that is passed to the callback function pointed to by the <i>pfnWrite</i> parameter.
     * @param {Pointer<PFN_CRYPT_XML_WRITE_CALLBACK>} _pfnWrite A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-pfn_crypt_xml_write_callback">PFN_CRYPT_XML_WRITE_CALLBACK</a> callback function that receives the encoded XML.
     * @returns {HRESULT} If the function succeeds, the function returns zero.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error.
     */
    Call(pAlgInfo, dwCharset, pvCallbackState, _pfnWrite) {
        pvCallbackStateMarshal := pvCallbackState is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CRYPT_XML_ALGORITHM_INFO.Ptr, pAlgInfo, CRYPT_XML_CHARSET, dwCharset, pvCallbackStateMarshal, pvCallbackState, PFN_CRYPT_XML_WRITE_CALLBACK, _pfnWrite, "HRESULT")
        return result
    }

    /**
     * A CryptXmlDllEncodeAlgorithm that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CryptXmlDllEncodeAlgorithm {
        /**
         * Creates a CryptXmlDllEncodeAlgorithm pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_XML_ALGORITHM_INFO, CRYPT_XML_CHARSET, "ptr", PFN_CRYPT_XML_WRITE_CALLBACK) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_XML_ALGORITHM_INFO.Ptr, CRYPT_XML_CHARSET, "ptr", PFN_CRYPT_XML_WRITE_CALLBACK, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
