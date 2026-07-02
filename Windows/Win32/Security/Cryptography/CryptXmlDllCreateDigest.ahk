#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_XML_ALGORITHM.ahk" { CRYPT_XML_ALGORITHM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Creates a digest object for the specified method.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/nc-cryptxml-cryptxmldllcreatedigest
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CryptXmlDllCreateDigest {
    value : IntPtr

    __value {
        set {
            if (value is CryptXmlDllCreateDigest) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CRYPT_XML_ALGORITHM>} pDigestMethod A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_algorithm">CRYPT_XML_ALGORITHM</a> structure that specifies the algorithm to use to create the  digest.
     * @param {Pointer<Integer>} pcbSize A pointer to a <b>ULONG</b> variable that receives the size, in bytes, of the digest.
     * @returns {Pointer<Void>} A pointer to a <b>CRYPT_XML_DIGEST</b> variable  that receives a pointer to the digest.
     * 
     * When you have finished using the resources allocated by the call to this function, you must free them by calling the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllclosedigest">CryptXmlDllCloseDigest</a> function.
     */
    Call(pDigestMethod, pcbSize) {
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, CRYPT_XML_ALGORITHM.Ptr, pDigestMethod, pcbSizeMarshal, pcbSize, "ptr*", &phDigest := 0, "HRESULT")
        return phDigest
    }

    /**
     * A CryptXmlDllCreateDigest that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CryptXmlDllCreateDigest {
        /**
         * Creates a CryptXmlDllCreateDigest pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_XML_ALGORITHM, "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_XML_ALGORITHM.Ptr, "uint*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
