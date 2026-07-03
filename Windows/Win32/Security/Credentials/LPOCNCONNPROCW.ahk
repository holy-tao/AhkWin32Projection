#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Credentials
 * @charset Unicode
 */
export default struct LPOCNCONNPROCW {
    value : IntPtr

    __value {
        set {
            if (value is LPOCNCONNPROCW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} param0 
     * @param {PWSTR} param1 
     * @param {PWSTR} param2 
     * @param {Pointer<Void>} param3 
     * @returns {Pointer} 
     */
    Call(param0, param1, param2, param3) {
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is String ? StrPtr(param2) : param2

        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, param0, "ptr", param1, "ptr", param2, param3Marshal, param3, IntPtr)
        return result
    }

    /**
     * A LPOCNCONNPROCW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPOCNCONNPROCW {
        /**
         * Creates a LPOCNCONNPROCW pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, PWSTR, PWSTR, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, PWSTR, PWSTR, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
