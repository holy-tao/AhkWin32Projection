#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct SQL_ASYNC_NOTIFICATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is SQL_ASYNC_NOTIFICATION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pContext 
     * @param {BOOL} fLast 
     * @returns {Integer} 
     */
    Call(pContext, fLast) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pContextMarshal, pContext, BOOL, fLast, Int16)
        return result
    }

    /**
     * A SQL_ASYNC_NOTIFICATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SQL_ASYNC_NOTIFICATION_CALLBACK {
        /**
         * Creates a SQL_ASYNC_NOTIFICATION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", BOOL) => Int16} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BOOL, Int16])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
