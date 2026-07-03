#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FA_EXTENSION_PLUGIN_PHASE.ahk" { FA_EXTENSION_PLUGIN_PHASE }
#Import ".\IDebugClient4.ahk" { IDebugClient4 }
#Import ".\IDebugFailureAnalysis2.ahk" { IDebugFailureAnalysis2 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXT_ANALYSIS_PLUGIN {
    value : IntPtr

    __value {
        set {
            if (value is EXT_ANALYSIS_PLUGIN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDebugClient4} Client 
     * @param {FA_EXTENSION_PLUGIN_PHASE} CallPhase 
     * @param {IDebugFailureAnalysis2} pAnalysis 
     * @returns {HRESULT} 
     */
    Call(Client, CallPhase, pAnalysis) {
        result := DllCall(this.value, "ptr", Client, FA_EXTENSION_PLUGIN_PHASE, CallPhase, "ptr", pAnalysis, "HRESULT")
        return result
    }

    /**
     * A EXT_ANALYSIS_PLUGIN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXT_ANALYSIS_PLUGIN {
        /**
         * Creates a EXT_ANALYSIS_PLUGIN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", FA_EXTENSION_PLUGIN_PHASE, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", FA_EXTENSION_PLUGIN_PHASE, "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
