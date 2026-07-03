#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PIO_DEVICE_EJECT_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PIO_DEVICE_EJECT_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {NTSTATUS} _Status 
     * @param {Pointer<Void>} _Context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Status, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, NTSTATUS, _Status, _ContextMarshal, _Context)
    }

    /**
     * A PIO_DEVICE_EJECT_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIO_DEVICE_EJECT_CALLBACK {
        /**
         * Creates a PIO_DEVICE_EJECT_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(NTSTATUS, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NTSTATUS, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
