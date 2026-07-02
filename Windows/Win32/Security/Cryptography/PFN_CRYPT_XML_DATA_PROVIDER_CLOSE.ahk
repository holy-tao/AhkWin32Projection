#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Releases the data provider.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/nc-cryptxml-pfn_crypt_xml_data_provider_close
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_XML_DATA_PROVIDER_CLOSE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_XML_DATA_PROVIDER_CLOSE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvCallbackState An application defined argument for the callback function.
     * @returns {HRESULT} If the function succeeds, the function returns zero.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error.
     */
    Call(pvCallbackState) {
        pvCallbackStateMarshal := pvCallbackState is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvCallbackStateMarshal, pvCallbackState, "HRESULT")
        return result
    }

    /**
     * A PFN_CRYPT_XML_DATA_PROVIDER_CLOSE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_XML_DATA_PROVIDER_CLOSE {
        /**
         * Creates a PFN_CRYPT_XML_DATA_PROVIDER_CLOSE pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
