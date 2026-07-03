#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient4.ahk" { IDebugClient4 }
#Import ".\IDebugFailureAnalysis2.ahk" { IDebugFailureAnalysis2 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXT_GET_DEBUG_FAILURE_ANALYSIS {
    value : IntPtr

    __value {
        set {
            if (value is EXT_GET_DEBUG_FAILURE_ANALYSIS) {
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
     * @param {Integer} Flags 
     * @param {Guid} ClassId 
     * @returns {IDebugFailureAnalysis2} 
     */
    Call(Client, Flags, ClassId) {
        result := DllCall(this.value, "ptr", Client, UInt32, Flags, Guid, ClassId, "ptr*", &ppAnalysis := 0, "HRESULT")
        return IDebugFailureAnalysis2(ppAnalysis)
    }

    /**
     * A EXT_GET_DEBUG_FAILURE_ANALYSIS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXT_GET_DEBUG_FAILURE_ANALYSIS {
        /**
         * Creates a EXT_GET_DEBUG_FAILURE_ANALYSIS pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, Guid) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, Guid, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
