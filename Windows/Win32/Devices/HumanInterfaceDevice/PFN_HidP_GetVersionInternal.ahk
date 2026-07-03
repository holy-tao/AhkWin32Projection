#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct PFN_HidP_GetVersionInternal {
    value : IntPtr

    __value {
        set {
            if (value is PFN_HidP_GetVersionInternal) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} _Version 
     * @returns {NTSTATUS} 
     */
    Call(_Version) {
        _VersionMarshal := _Version is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, _VersionMarshal, _Version, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PFN_HidP_GetVersionInternal that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_HidP_GetVersionInternal {
        /**
         * Creates a PFN_HidP_GetVersionInternal pointer that invokes the given AHK function when called.
         * @param {Func("uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["uint*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
