#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FPGA_CONTROL_ERROR_REPORTING {
    value : IntPtr

    __value {
        set {
            if (value is FPGA_CONTROL_ERROR_REPORTING) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Integer} UncorrectableMask 
     * @param {Integer} CorrectableMask 
     * @param {BOOLEAN} DisableErrorReporting 
     * @returns {NTSTATUS} 
     */
    Call(_Context, UncorrectableMask, CorrectableMask, DisableErrorReporting) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UInt32, UncorrectableMask, UInt32, CorrectableMask, BOOLEAN, DisableErrorReporting, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A FPGA_CONTROL_ERROR_REPORTING that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FPGA_CONTROL_ERROR_REPORTING {
        /**
         * Creates a FPGA_CONTROL_ERROR_REPORTING pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, UInt32, BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, UInt32, BOOLEAN, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
