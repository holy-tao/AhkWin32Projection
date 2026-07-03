#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEBUG_DEVICE_DESCRIPTOR.ahk" { DEBUG_DEVICE_DESCRIPTOR }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pKdSetupIntegratedDeviceForDebugging {
    value : IntPtr

    __value {
        set {
            if (value is pKdSetupIntegratedDeviceForDebugging) {
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
     * @param {Pointer<DEBUG_DEVICE_DESCRIPTOR>} IntegratedDevice 
     * @returns {NTSTATUS} 
     */
    Call(LoaderBlock, IntegratedDevice) {
        LoaderBlockMarshal := LoaderBlock is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, LoaderBlockMarshal, LoaderBlock, DEBUG_DEVICE_DESCRIPTOR.Ptr, IntegratedDevice, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A pKdSetupIntegratedDeviceForDebugging that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pKdSetupIntegratedDeviceForDebugging {
        /**
         * Creates a pKdSetupIntegratedDeviceForDebugging pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DEBUG_DEVICE_DESCRIPTOR) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DEBUG_DEVICE_DESCRIPTOR.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
