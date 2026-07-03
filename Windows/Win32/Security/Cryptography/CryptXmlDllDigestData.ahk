#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Puts data into the digest.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/nc-cryptxml-cryptxmldlldigestdata
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CryptXmlDllDigestData {
    value : IntPtr

    __value {
        set {
            if (value is CryptXmlDllDigestData) {
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
     * @param {Integer} pbData A pointer to a block of data to be processed.
     * @param {Integer} cbData The size, in bytes, of the block of data pointed to by the <i>pbData</i> parameter.
     * @returns {HRESULT} If the function succeeds, the function returns zero.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error.
     */
    Call(hDigest, pbData, cbData) {
        hDigestMarshal := hDigest is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, hDigestMarshal, hDigest, IntPtr, pbData, UInt32, cbData, "HRESULT")
        return result
    }

    /**
     * A CryptXmlDllDigestData that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CryptXmlDllDigestData {
        /**
         * Creates a CryptXmlDllDigestData pointer that invokes the given AHK function when called.
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
