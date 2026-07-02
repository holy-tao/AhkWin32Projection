#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PGPE_ENABLE_EVENT {
    value : IntPtr

    __value {
        set {
            if (value is PGPE_ENABLE_EVENT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {NTSTATUS} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DEVICE_OBJECT.Ptr, param0, param1Marshal, param1, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PGPE_ENABLE_EVENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGPE_ENABLE_EVENT {
        /**
         * Creates a PGPE_ENABLE_EVENT pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
