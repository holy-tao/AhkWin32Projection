#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Frees the CRYPT_XML_DIGEST allocated by the CryptXmlDllCreateDigest function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/nc-cryptxml-cryptxmldllclosedigest
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CryptXmlDllCloseDigest {
    value : IntPtr

    __value {
        set {
            if (value is CryptXmlDllCloseDigest) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} hDigest The handle of the hash object. This handle is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllcreatedigest">CryptXmlCreateDigest</a>  function. After the function has been called, the digest handle passed to this function is released and cannot be used again.
     * @returns {HRESULT} If the function succeeds, the function returns zero.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error.
     */
    Call(hDigest) {
        hDigestMarshal := hDigest is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, hDigestMarshal, hDigest, "HRESULT")
        return result
    }

    /**
     * A CryptXmlDllCloseDigest that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CryptXmlDllCloseDigest {
        /**
         * Creates a CryptXmlDllCloseDigest pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
