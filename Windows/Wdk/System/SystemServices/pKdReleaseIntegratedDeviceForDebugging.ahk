#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEBUG_DEVICE_DESCRIPTOR.ahk" { DEBUG_DEVICE_DESCRIPTOR }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pKdReleaseIntegratedDeviceForDebugging {
    value : IntPtr

    __value {
        set {
            if (value is pKdReleaseIntegratedDeviceForDebugging) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEBUG_DEVICE_DESCRIPTOR>} IntegratedDevice 
     * @returns {NTSTATUS} 
     */
    Call(IntegratedDevice) {
        result := DllCall(this.value, DEBUG_DEVICE_DESCRIPTOR.Ptr, IntegratedDevice, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A pKdReleaseIntegratedDeviceForDebugging that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pKdReleaseIntegratedDeviceForDebugging {
        /**
         * Creates a pKdReleaseIntegratedDeviceForDebugging pointer that invokes the given AHK function when called.
         * @param {Func(DEBUG_DEVICE_DESCRIPTOR) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEBUG_DEVICE_DESCRIPTOR.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
