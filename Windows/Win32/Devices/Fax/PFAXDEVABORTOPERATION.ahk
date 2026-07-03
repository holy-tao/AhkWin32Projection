#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXDEVABORTOPERATION {
    value : IntPtr

    __value {
        set {
            if (value is PFAXDEVABORTOPERATION) {
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
     * @returns {BOOL} 
     */
    Call(param0) {
        result := DllCall(this.value, HANDLE, param0, BOOL)
        return result
    }

    /**
     * A PFAXDEVABORTOPERATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXDEVABORTOPERATION {
        /**
         * Creates a PFAXDEVABORTOPERATION pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
