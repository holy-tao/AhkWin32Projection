#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CRYPT_XML_ALGORITHM.ahk" { CRYPT_XML_ALGORITHM }
#Import ".\CRYPT_XML_ALGORITHM_INFO.ahk" { CRYPT_XML_ALGORITHM_INFO }

/**
 * Decodes the XML algorithm and returns information about the algorithm.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/nc-cryptxml-cryptxmldllgetalgorithminfo
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CryptXmlDllGetAlgorithmInfo {
    value : IntPtr

    __value {
        set {
            if (value is CryptXmlDllGetAlgorithmInfo) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CRYPT_XML_ALGORITHM>} pXmlAlgorithm A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_algorithm">CRYPT_XML_ALGORITHM</a> structure that specifies the algorithm.
     * @returns {Pointer<CRYPT_XML_ALGORITHM_INFO>} A pointer to a pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_algorithm_info">CRYPT_XML_ALGORITHM_INFO</a> structure.
     * 
     * When you have finished using the memory pointed to by the <i>ppAlgInfo</i> parameter, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     */
    Call(pXmlAlgorithm) {
        result := DllCall(this.value, CRYPT_XML_ALGORITHM.Ptr, pXmlAlgorithm, "ptr*", &ppAlgInfo := 0, "HRESULT")
        return ppAlgInfo
    }

    /**
     * A CryptXmlDllGetAlgorithmInfo that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CryptXmlDllGetAlgorithmInfo {
        /**
         * Creates a CryptXmlDllGetAlgorithmInfo pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_XML_ALGORITHM) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_XML_ALGORITHM.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
