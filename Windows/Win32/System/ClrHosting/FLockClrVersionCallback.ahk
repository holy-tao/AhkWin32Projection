#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct FLockClrVersionCallback {
    value : IntPtr

    __value {
        set {
            if (value is FLockClrVersionCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Call() {
        result := DllCall(this.value, "HRESULT")
        return result
    }

    /**
     * A FLockClrVersionCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FLockClrVersionCallback {
        /**
         * Creates a FLockClrVersionCallback pointer that invokes the given AHK function when called.
         * @param {Func() => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
