#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CRYPT_XML_ALGORITHM.ahk" { CRYPT_XML_ALGORITHM }
#Import ".\CRYPT_XML_DATA_PROVIDER.ahk" { CRYPT_XML_DATA_PROVIDER }

/**
 * Creates a transform for a specified data provider.
 * @remarks
 * In the transform chain, the output of a transform is the input of the next transform in the chain.
 * 
 *  The implementation of the callback function is responsible for calling the  provider close function on the input transform to release the input provider.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/nc-cryptxml-pfn_crypt_xml_create_transform
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_XML_CREATE_TRANSFORM {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_XML_CREATE_TRANSFORM) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CRYPT_XML_ALGORITHM>} pTransform A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_algorithm">CRYPT_XML_ALGORITHM</a> structure that specifies the transform to apply.
     * @param {Pointer<CRYPT_XML_DATA_PROVIDER>} pProviderIn A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_data_provider">CRYPT_XML_DATA_PROVIDER</a> structure that specifies the data provider to use as input for the transform.
     * @param {Pointer<CRYPT_XML_DATA_PROVIDER>} pProviderOut A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_data_provider">CRYPT_XML_DATA_PROVIDER</a> structure to receive the data provider of the transform.
     * @returns {HRESULT} If the function succeeds, the function returns zero.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error.
     */
    Call(pTransform, pProviderIn, pProviderOut) {
        result := DllCall(this.value, CRYPT_XML_ALGORITHM.Ptr, pTransform, CRYPT_XML_DATA_PROVIDER.Ptr, pProviderIn, CRYPT_XML_DATA_PROVIDER.Ptr, pProviderOut, "HRESULT")
        return result
    }

    /**
     * A PFN_CRYPT_XML_CREATE_TRANSFORM that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_XML_CREATE_TRANSFORM {
        /**
         * Creates a PFN_CRYPT_XML_CREATE_TRANSFORM pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_XML_ALGORITHM, CRYPT_XML_DATA_PROVIDER, CRYPT_XML_DATA_PROVIDER) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_XML_ALGORITHM.Ptr, CRYPT_XML_DATA_PROVIDER.Ptr, CRYPT_XML_DATA_PROVIDER.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
