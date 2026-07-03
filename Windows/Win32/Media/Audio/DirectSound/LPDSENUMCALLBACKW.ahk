#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @charset Unicode
 */
export default struct LPDSENUMCALLBACKW {
    value : IntPtr

    __value {
        set {
            if (value is LPDSENUMCALLBACKW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {PWSTR} param1 
     * @param {PWSTR} param2 
     * @param {Pointer<Void>} param3 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3) {
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is String ? StrPtr(param2) : param2

        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, Guid.Ptr, param0, "ptr", param1, "ptr", param2, param3Marshal, param3, BOOL)
        return result
    }

    /**
     * A LPDSENUMCALLBACKW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDSENUMCALLBACKW {
        /**
         * Creates a LPDSENUMCALLBACKW pointer that invokes the given AHK function when called.
         * @param {Func(Guid, PWSTR, PWSTR, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, PWSTR, PWSTR, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
