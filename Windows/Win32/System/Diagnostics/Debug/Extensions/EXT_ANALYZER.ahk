#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient.ahk" { IDebugClient }
#Import ".\IDebugFailureAnalysis.ahk" { IDebugFailureAnalysis }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXT_ANALYZER {
    value : IntPtr

    __value {
        set {
            if (value is EXT_ANALYZER) {
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
     * @param {Integer} BucketSuffix 
     * @param {Integer} cbBucketSuffix 
     * @param {Integer} DebugText 
     * @param {Integer} cbDebugText 
     * @param {Pointer<Integer>} Flags 
     * @param {IDebugFailureAnalysis} pAnalysis 
     * @returns {HRESULT} 
     */
    Call(Client, BucketSuffix, cbBucketSuffix, DebugText, cbDebugText, Flags, pAnalysis) {
        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", Client, IntPtr, BucketSuffix, UInt32, cbBucketSuffix, IntPtr, DebugText, UInt32, cbDebugText, FlagsMarshal, Flags, "ptr", pAnalysis, "HRESULT")
        return result
    }

    /**
     * A EXT_ANALYZER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXT_ANALYZER {
        /**
         * Creates a EXT_ANALYZER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, UInt32, IntPtr, UInt32, "uint*", "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, UInt32, IntPtr, UInt32, "uint*", "ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
