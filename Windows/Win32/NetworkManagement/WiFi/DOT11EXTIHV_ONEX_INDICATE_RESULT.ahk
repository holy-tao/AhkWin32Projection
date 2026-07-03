#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11_MSONEX_RESULT.ahk" { DOT11_MSONEX_RESULT }
#Import ".\DOT11_MSONEX_RESULT_PARAMS.ahk" { DOT11_MSONEX_RESULT_PARAMS }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_ONEX_INDICATE_RESULT {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_ONEX_INDICATE_RESULT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hIhvExtAdapter 
     * @param {DOT11_MSONEX_RESULT} msOneXResult 
     * @param {Pointer<DOT11_MSONEX_RESULT_PARAMS>} pDot11MsOneXResultParams 
     * @returns {Integer} 
     */
    Call(hIhvExtAdapter, msOneXResult, pDot11MsOneXResultParams) {
        result := DllCall(this.value, HANDLE, hIhvExtAdapter, DOT11_MSONEX_RESULT, msOneXResult, DOT11_MSONEX_RESULT_PARAMS.Ptr, pDot11MsOneXResultParams, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_ONEX_INDICATE_RESULT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_ONEX_INDICATE_RESULT {
        /**
         * Creates a DOT11EXTIHV_ONEX_INDICATE_RESULT pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, DOT11_MSONEX_RESULT, DOT11_MSONEX_RESULT_PARAMS) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, DOT11_MSONEX_RESULT, DOT11_MSONEX_RESULT_PARAMS.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
