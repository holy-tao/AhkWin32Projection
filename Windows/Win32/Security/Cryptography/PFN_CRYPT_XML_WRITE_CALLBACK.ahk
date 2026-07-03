#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Writes XML data.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/nc-cryptxml-pfn_crypt_xml_write_callback
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_XML_WRITE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_XML_WRITE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvCallbackState A pointer to an argument that is passed to the callback function pointed to by the <i>pfnWrite</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-cryptxmldllencodealgorithm">CryptXmlDllEncodeAlgorithm</a> function.
     * @param {Integer} pbData A pointer to a block of data to be written.
     * @param {Integer} cbData The size, in bytes, of the data pointed to by the <i>pbData</i> parameter.
     * @returns {HRESULT} If the function succeeds, the function returns zero.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error.
     */
    Call(pvCallbackState, pbData, cbData) {
        pvCallbackStateMarshal := pvCallbackState is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvCallbackStateMarshal, pvCallbackState, IntPtr, pbData, UInt32, cbData, "HRESULT")
        return result
    }

    /**
     * A PFN_CRYPT_XML_WRITE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_XML_WRITE_CALLBACK {
        /**
         * Creates a PFN_CRYPT_XML_WRITE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, UInt32, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
