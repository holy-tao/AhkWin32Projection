#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }
#Import ".\CRYPT_XML_ALGORITHM.ahk" { CRYPT_XML_ALGORITHM }

/**
 * Verifies a signature.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/nc-cryptxml-cryptxmldllverifysignature
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CryptXmlDllVerifySignature {
    value : IntPtr

    __value {
        set {
            if (value is CryptXmlDllVerifySignature) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CRYPT_XML_ALGORITHM>} pSignatureMethod A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_algorithm">CRYPT_XML_ALGORITHM</a> structure that specifies the algorithm.
     * @param {BCRYPT_KEY_HANDLE} _hKey A handle to the public key.
     * @param {Integer} pbInput A pointer to a buffer that contains the signed data. The <i>cbInput</i> parameter contains the size of this buffer.
     * @param {Integer} cbInput The size, in bytes, of the buffer pointed to by the <i>pbInput</i> parameter.
     * @param {Integer} pbSignature A pointer to a buffer that contains the signature value to be verified. The <i>cbSignature</i> parameter contains the size of this buffer.
     * @param {Integer} cbSignature The size, in bytes, of the <i>pbSignature</i> buffer.
     * @returns {HRESULT} If the function succeeds, the function returns zero.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error.
     */
    Call(pSignatureMethod, _hKey, pbInput, cbInput, pbSignature, cbSignature) {
        result := DllCall(this.value, CRYPT_XML_ALGORITHM.Ptr, pSignatureMethod, BCRYPT_KEY_HANDLE, _hKey, IntPtr, pbInput, UInt32, cbInput, IntPtr, pbSignature, UInt32, cbSignature, "HRESULT")
        return result
    }

    /**
     * A CryptXmlDllVerifySignature that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CryptXmlDllVerifySignature {
        /**
         * Creates a CryptXmlDllVerifySignature pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_XML_ALGORITHM, BCRYPT_KEY_HANDLE, IntPtr, UInt32, IntPtr, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_XML_ALGORITHM.Ptr, BCRYPT_KEY_HANDLE, IntPtr, UInt32, IntPtr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
