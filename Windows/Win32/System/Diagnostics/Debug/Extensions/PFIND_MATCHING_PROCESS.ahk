#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient.ahk" { IDebugClient }
#Import ".\KDEXT_PROCESS_FIND_PARAMS.ahk" { KDEXT_PROCESS_FIND_PARAMS }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PFIND_MATCHING_PROCESS {
    value : IntPtr

    __value {
        set {
            if (value is PFIND_MATCHING_PROCESS) {
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
     * @param {Pointer<KDEXT_PROCESS_FIND_PARAMS>} ProcessInfo 
     * @returns {Integer} 
     */
    Call(Client, ProcessInfo) {
        result := DllCall(this.value, "ptr", Client, KDEXT_PROCESS_FIND_PARAMS.Ptr, ProcessInfo, "uint*", &Process := 0, "HRESULT")
        return Process
    }

    /**
     * A PFIND_MATCHING_PROCESS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFIND_MATCHING_PROCESS {
        /**
         * Creates a PFIND_MATCHING_PROCESS pointer that invokes the given AHK function when called.
         * @param {Func("ptr", KDEXT_PROCESS_FIND_PARAMS) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", KDEXT_PROCESS_FIND_PARAMS.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
