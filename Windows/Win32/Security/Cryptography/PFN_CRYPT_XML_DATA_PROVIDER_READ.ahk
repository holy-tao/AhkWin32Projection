#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Reads XML data.
 * @remarks
 * The callback function does not return a value unless the number of bytes specified in <i>cbData</i> 
 *  is available or  the last block of data has been read.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/nc-cryptxml-pfn_crypt_xml_data_provider_read
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CRYPT_XML_DATA_PROVIDER_READ {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CRYPT_XML_DATA_PROVIDER_READ) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvCallbackState A pointer to an application defined argument that is passed to the calling function.
     * @param {Integer} pbData A pointer to the buffer that receives the data to be read.
     * @param {Integer} cbData The size, in bytes, of the data to be read.
     * @param {Pointer<Integer>} pcbRead A pointer to a variable that receives the number of bytes actually read.
     * @returns {HRESULT} The <i>PFN_CRYPT_XML_DATA_PROVIDER_READ</i> callback function returns a value when one of the 
     *     following conditions occurs:
     * 
     * <ul>
     * <li>A write operation completes on the data provider</li>
     * <li>The number of bytes requested is read</li>
     * <li>An error occurs</li>
     * </ul>
     * If the function succeeds, the function returns NO_ERROR.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error.
     * 
     * If the value of <i>pcbRead</i> equals zero, then there is no more data available.
     */
    Call(pvCallbackState, pbData, cbData, pcbRead) {
        pvCallbackStateMarshal := pvCallbackState is VarRef ? "ptr" : "ptr"
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, pvCallbackStateMarshal, pvCallbackState, IntPtr, pbData, UInt32, cbData, pcbReadMarshal, pcbRead, "HRESULT")
        return result
    }

    /**
     * A PFN_CRYPT_XML_DATA_PROVIDER_READ that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CRYPT_XML_DATA_PROVIDER_READ {
        /**
         * Creates a PFN_CRYPT_XML_DATA_PROVIDER_READ pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, UInt32, "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, UInt32, "uint*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
