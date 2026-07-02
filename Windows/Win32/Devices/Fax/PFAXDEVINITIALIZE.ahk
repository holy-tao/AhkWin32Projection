#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\PFAX_LINECALLBACK.ahk" { PFAX_LINECALLBACK }
#Import ".\PFAX_SERVICE_CALLBACK.ahk" { PFAX_SERVICE_CALLBACK }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXDEVINITIALIZE {
    value : IntPtr

    __value {
        set {
            if (value is PFAXDEVINITIALIZE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {HANDLE} param1 
     * @param {Pointer<Pointer<PFAX_LINECALLBACK>>} param2 
     * @param {Pointer<PFAX_SERVICE_CALLBACK>} param3 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, UInt32, param0, HANDLE, param1, param2Marshal, param2, PFAX_SERVICE_CALLBACK, param3, BOOL)
        return result
    }

    /**
     * A PFAXDEVINITIALIZE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXDEVINITIALIZE {
        /**
         * Creates a PFAXDEVINITIALIZE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, HANDLE, "ptr*", PFAX_SERVICE_CALLBACK) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, HANDLE, "ptr*", PFAX_SERVICE_CALLBACK, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
