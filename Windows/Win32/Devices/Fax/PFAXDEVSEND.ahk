#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_SEND.ahk" { FAX_SEND }
#Import ".\PFAX_SEND_CALLBACK.ahk" { PFAX_SEND_CALLBACK }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXDEVSEND {
    value : IntPtr

    __value {
        set {
            if (value is PFAXDEVSEND) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @param {Pointer<FAX_SEND>} param1 
     * @param {Pointer<PFAX_SEND_CALLBACK>} param2 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2) {
        result := DllCall(this.value, HANDLE, param0, FAX_SEND.Ptr, param1, PFAX_SEND_CALLBACK, param2, BOOL)
        return result
    }

    /**
     * A PFAXDEVSEND that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXDEVSEND {
        /**
         * Creates a PFAXDEVSEND pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, FAX_SEND, PFAX_SEND_CALLBACK) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, FAX_SEND.Ptr, PFAX_SEND_CALLBACK, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
