#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEBUG_CPU_MICROCODE_VERSION.ahk" { DEBUG_CPU_MICROCODE_VERSION }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PGET_CPU_MICROCODE_VERSION {
    value : IntPtr

    __value {
        set {
            if (value is PGET_CPU_MICROCODE_VERSION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDebugClient} Client 
     * @param {Pointer<DEBUG_CPU_MICROCODE_VERSION>} pCpuMicrocodeVersion 
     * @returns {HRESULT} 
     */
    Call(Client, pCpuMicrocodeVersion) {
        result := DllCall(this.value, "ptr", Client, DEBUG_CPU_MICROCODE_VERSION.Ptr, pCpuMicrocodeVersion, "HRESULT")
        return result
    }

    /**
     * A PGET_CPU_MICROCODE_VERSION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_CPU_MICROCODE_VERSION {
        /**
         * Creates a PGET_CPU_MICROCODE_VERSION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DEBUG_CPU_MICROCODE_VERSION) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DEBUG_CPU_MICROCODE_VERSION.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
