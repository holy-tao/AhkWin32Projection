#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvSynchronizeRedirectionBitmaps {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvSynchronizeRedirectionBitmaps) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {DHPDEV} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {NTSTATUS} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, DHPDEV, param0, param1Marshal, param1, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PFN_DrvSynchronizeRedirectionBitmaps that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvSynchronizeRedirectionBitmaps {
        /**
         * Creates a PFN_DrvSynchronizeRedirectionBitmaps pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, "uint*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
