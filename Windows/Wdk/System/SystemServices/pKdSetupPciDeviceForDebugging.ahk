#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEBUG_DEVICE_DESCRIPTOR.ahk" { DEBUG_DEVICE_DESCRIPTOR }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pKdSetupPciDeviceForDebugging {
    value : IntPtr

    __value {
        set {
            if (value is pKdSetupPciDeviceForDebugging) {
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
     * @param {Pointer<DEBUG_DEVICE_DESCRIPTOR>} PciDevice 
     * @returns {NTSTATUS} 
     */
    Call(LoaderBlock, PciDevice) {
        LoaderBlockMarshal := LoaderBlock is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, LoaderBlockMarshal, LoaderBlock, DEBUG_DEVICE_DESCRIPTOR.Ptr, PciDevice, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A pKdSetupPciDeviceForDebugging that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pKdSetupPciDeviceForDebugging {
        /**
         * Creates a pKdSetupPciDeviceForDebugging pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DEBUG_DEVICE_DESCRIPTOR) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DEBUG_DEVICE_DESCRIPTOR.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
