#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PNP_REPLACE_DRIVER_INTERFACE.ahk" { PNP_REPLACE_DRIVER_INTERFACE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PREPLACE_DRIVER_INIT {
    value : IntPtr

    __value {
        set {
            if (value is PREPLACE_DRIVER_INIT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<PNP_REPLACE_DRIVER_INTERFACE>} _Interface 
     * @param {Pointer<Void>} Unused 
     * @returns {NTSTATUS} 
     */
    Call(_Interface, Unused) {
        UnusedMarshal := Unused is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, PNP_REPLACE_DRIVER_INTERFACE.Ptr, _Interface, UnusedMarshal, Unused, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PREPLACE_DRIVER_INIT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PREPLACE_DRIVER_INIT {
        /**
         * Creates a PREPLACE_DRIVER_INIT pointer that invokes the given AHK function when called.
         * @param {Func(PNP_REPLACE_DRIVER_INTERFACE, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PNP_REPLACE_DRIVER_INTERFACE.Ptr, "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
