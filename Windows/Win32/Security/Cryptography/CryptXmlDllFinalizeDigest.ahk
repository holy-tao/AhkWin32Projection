#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Retrieves the digest value.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/nc-cryptxml-cryptxmldllfinalizedigest
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CryptXmlDllFinalizeDigest {
    value : IntPtr

    __value {
        set {
            if (value is CryptXmlDllFinalizeDigest) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} hDigest The handle of the hash object used to put data into the digest. This handle is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllcreatedigest">CryptXmlDllCreateDigest</a>  function.
     * @param {Integer} pbDigest A pointer to a buffer that receives the digest value.
     * @param {Integer} cbDigest The size, in bytes, of the buffer pointed to by the <i>pbDigest</i> parameter.
     * @returns {HRESULT} If the function succeeds, the function returns zero.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error.
     */
    Call(hDigest, pbDigest, cbDigest) {
        hDigestMarshal := hDigest is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, hDigestMarshal, hDigest, IntPtr, pbDigest, UInt32, cbDigest, "HRESULT")
        return result
    }

    /**
     * A CryptXmlDllFinalizeDigest that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CryptXmlDllFinalizeDigest {
        /**
         * Creates a CryptXmlDllFinalizeDigest pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
