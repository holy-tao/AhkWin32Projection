#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXT_GET_HANDLE_TRACE {
    value : IntPtr

    __value {
        set {
            if (value is EXT_GET_HANDLE_TRACE) {
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
     * @param {Integer} TraceType 
     * @param {Integer} StartIndex 
     * @param {Pointer<Integer>} HandleValue 
     * @param {Pointer<Integer>} StackFunctions 
     * @param {Integer} StackTraceSize 
     * @returns {HRESULT} 
     */
    Call(Client, TraceType, StartIndex, HandleValue, StackFunctions, StackTraceSize) {
        HandleValueMarshal := HandleValue is VarRef ? "uint*" : "ptr"
        StackFunctionsMarshal := StackFunctions is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", Client, UInt32, TraceType, UInt32, StartIndex, HandleValueMarshal, HandleValue, StackFunctionsMarshal, StackFunctions, UInt32, StackTraceSize, "HRESULT")
        return result
    }

    /**
     * A EXT_GET_HANDLE_TRACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXT_GET_HANDLE_TRACE {
        /**
         * Creates a EXT_GET_HANDLE_TRACE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, UInt32, "uint*", "uint*", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, UInt32, "uint*", "uint*", UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
