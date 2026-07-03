#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CRYPT_XML_ALGORITHM.ahk" { CRYPT_XML_ALGORITHM }
#Import ".\HCRYPTPROV_OR_NCRYPT_KEY_HANDLE.ahk" { HCRYPTPROV_OR_NCRYPT_KEY_HANDLE }

/**
 * Signs data. (CryptXmlDllSignData)
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/nc-cryptxml-cryptxmldllsigndata
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CryptXmlDllSignData {
    value : IntPtr

    __value {
        set {
            if (value is CryptXmlDllSignData) {
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
     * @param {HCRYPTPROV_OR_NCRYPT_KEY_HANDLE} hCryptProvOrNCryptKey The handle of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) that creates the signature. This handle must be an <b>HCRYPTPROV</b> handle that was obtained from a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptacquirecontexta">CryptAcquireContext</a> function or an <b>NCRYPT_KEY_HANDLE</b> handle that was created by using the <a href="https://docs.microsoft.com/windows/desktop/api/ncrypt/nf-ncrypt-ncryptopenkey">NCryptOpenKey</a> function. New applications should pass in an <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/hcryptprov-or-ncrypt-key-handle">NCRYPT_KEY_HANDLE</a> handle.
     * @param {Integer} dwKeySpec The private key to use from the provider's container. This key can be AT_KEYEXCHANGE or AT_SIGNATURE. This parameter is ignored if an <b>NCRYPT_KEY_HANDLE</b> handle is used in the <i>hCryptProvOrNCryptKey</i> parameter.
     * @param {Integer} pbInput A pointer to a buffer that contains the digest value to sign. The <i>cbInput</i> parameter contains the size of this buffer.
     * @param {Integer} cbInput The size, in bytes, of the buffer pointed to by the <i>pbInput</i> parameter.
     * @param {Integer} pbOutput The address of a buffer to receive the signature produced by this function. The <i>cbOutput</i> parameter contains the size of this buffer.
     * 
     * If this parameter is <b>NULL</b>, this function will calculate the size needed for the encrypted data and return the size in the location pointed to by the <i>pcbResult</i> parameter.
     * @param {Integer} cbOutput The size, in bytes, of the buffer pointed to by the <i>pbOutput</i> parameter.
     * @param {Pointer<Integer>} pcbResult A pointer to a <b>DWORD</b> variable that receives the number of bytes copied to the <i>pbOutput</i> buffer. 
     * If <i>pbOutput</i> is <b>NULL</b>, this receives the size, in bytes, required for the signature.
     * @returns {HRESULT} If the function succeeds, the function returns zero.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error.
     */
    Call(pSignatureMethod, hCryptProvOrNCryptKey, dwKeySpec, pbInput, cbInput, pbOutput, cbOutput, pcbResult) {
        pcbResultMarshal := pcbResult is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, CRYPT_XML_ALGORITHM.Ptr, pSignatureMethod, HCRYPTPROV_OR_NCRYPT_KEY_HANDLE, hCryptProvOrNCryptKey, UInt32, dwKeySpec, IntPtr, pbInput, UInt32, cbInput, IntPtr, pbOutput, UInt32, cbOutput, pcbResultMarshal, pcbResult, "HRESULT")
        return result
    }

    /**
     * A CryptXmlDllSignData that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CryptXmlDllSignData {
        /**
         * Creates a CryptXmlDllSignData pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_XML_ALGORITHM, HCRYPTPROV_OR_NCRYPT_KEY_HANDLE, UInt32, IntPtr, UInt32, IntPtr, UInt32, "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_XML_ALGORITHM.Ptr, HCRYPTPROV_OR_NCRYPT_KEY_HANDLE, UInt32, IntPtr, UInt32, IntPtr, UInt32, "uint*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
