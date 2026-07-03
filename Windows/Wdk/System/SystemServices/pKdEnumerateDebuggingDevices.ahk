#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEBUG_DEVICE_DESCRIPTOR.ahk" { DEBUG_DEVICE_DESCRIPTOR }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pKdEnumerateDebuggingDevices {
    value : IntPtr

    __value {
        set {
            if (value is pKdEnumerateDebuggingDevices) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} LoaderBlock 
     * @param {Pointer<DEBUG_DEVICE_DESCRIPTOR>} Device 
     * @param {Pointer<PDEBUG_DEVICE_FOUND_FUNCTION>} Callback 
     * @returns {NTSTATUS} 
     */
    Call(LoaderBlock, Device, Callback) {
        LoaderBlockMarshal := LoaderBlock is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, LoaderBlockMarshal, LoaderBlock, DEBUG_DEVICE_DESCRIPTOR.Ptr, Device, "ptr", Callback, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A pKdEnumerateDebuggingDevices that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pKdEnumerateDebuggingDevices {
        /**
         * Creates a pKdEnumerateDebuggingDevices pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DEBUG_DEVICE_DESCRIPTOR, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DEBUG_DEVICE_DESCRIPTOR.Ptr, "ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
