#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CRYPT_XML_ALGORITHM_INFO.ahk" { CRYPT_XML_ALGORITHM_INFO }
#Import ".\CRYPT_XML_CRYPTOGRAPHIC_INTERFACE.ahk" { CRYPT_XML_CRYPTOGRAPHIC_INTERFACE }

/**
 * Retrieves a pointer to the cryptographic extension functions for the specified algorithm.
 * @remarks
 * The cryptographic extensions DLL must export the <b>CryptXmlDllGetInterface</b> entry.
 * 
 * 
 * To get the <a href="https://docs.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_cryptographic_interface">CRYPT_XML_CRYPTOGRAPHIC_INTERFACE</a>  table, CryptXml loads the registered cryptographic extensions DLL by using the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> function, and then it calls the
 * <b>CryptXmlDllGetInterface</b> function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/nc-cryptxml-cryptxmldllgetinterface
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CryptXmlDllGetInterface {
    value : IntPtr

    __value {
        set {
            if (value is CryptXmlDllGetInterface) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwFlags This parameter is reserved and must be set to zero.
     * @param {Pointer<CRYPT_XML_ALGORITHM_INFO>} pMethod A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_algorithm_info">CRYPT_XML_ALGORITHM_INFO</a> structure to retrieve the interface of.
     * @param {Pointer<CRYPT_XML_CRYPTOGRAPHIC_INTERFACE>} pInterface A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_algorithm_info">CRYPT_XML_ALGORITHM_INFO</a> structure to receive the interface information.
     * @returns {HRESULT} If the function succeeds, the function returns zero.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error.
     */
    Call(dwFlags, pMethod, pInterface) {
        result := DllCall(this.value, UInt32, dwFlags, CRYPT_XML_ALGORITHM_INFO.Ptr, pMethod, CRYPT_XML_CRYPTOGRAPHIC_INTERFACE.Ptr, pInterface, "HRESULT")
        return result
    }

    /**
     * A CryptXmlDllGetInterface that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CryptXmlDllGetInterface {
        /**
         * Creates a CryptXmlDllGetInterface pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, CRYPT_XML_ALGORITHM_INFO, CRYPT_XML_CRYPTOGRAPHIC_INTERFACE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, CRYPT_XML_ALGORITHM_INFO.Ptr, CRYPT_XML_CRYPTOGRAPHIC_INTERFACE.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
