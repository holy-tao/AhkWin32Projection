#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct LPFNABSDI {
    value : IntPtr

    __value {
        set {
            if (value is LPFNABSDI) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ulUIParam 
     * @param {Pointer<Void>} lpvmsg 
     * @returns {BOOL} 
     */
    Call(ulUIParam, lpvmsg) {
        lpvmsgMarshal := lpvmsg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, ulUIParam, lpvmsgMarshal, lpvmsg, BOOL)
        return result
    }

    /**
     * A LPFNABSDI that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNABSDI {
        /**
         * Creates a LPFNABSDI pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
