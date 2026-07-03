#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEBUG_STACK_FRAME_EX.ahk" { DEBUG_STACK_FRAME_EX }
#Import ".\STACK_SYM_FRAME_INFO.ahk" { STACK_SYM_FRAME_INFO }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PDEBUG_STACK_PROVIDER_RECONSTRUCTSTACK {
    value : IntPtr

    __value {
        set {
            if (value is PDEBUG_STACK_PROVIDER_RECONSTRUCTSTACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} SystemThreadId 
     * @param {Pointer<DEBUG_STACK_FRAME_EX>} NativeFrames 
     * @param {Integer} CountNativeFrames 
     * @param {Pointer<Pointer<STACK_SYM_FRAME_INFO>>} StackSymFrames 
     * @param {Pointer<Integer>} StackSymFramesFilled 
     * @returns {HRESULT} 
     */
    Call(SystemThreadId, NativeFrames, CountNativeFrames, StackSymFrames, StackSymFramesFilled) {
        StackSymFramesMarshal := StackSymFrames is VarRef ? "ptr*" : "ptr"
        StackSymFramesFilledMarshal := StackSymFramesFilled is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UInt32, SystemThreadId, DEBUG_STACK_FRAME_EX.Ptr, NativeFrames, UInt32, CountNativeFrames, StackSymFramesMarshal, StackSymFrames, StackSymFramesFilledMarshal, StackSymFramesFilled, "HRESULT")
        return result
    }

    /**
     * A PDEBUG_STACK_PROVIDER_RECONSTRUCTSTACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDEBUG_STACK_PROVIDER_RECONSTRUCTSTACK {
        /**
         * Creates a PDEBUG_STACK_PROVIDER_RECONSTRUCTSTACK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, DEBUG_STACK_FRAME_EX, UInt32, "ptr*", "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, DEBUG_STACK_FRAME_EX.Ptr, UInt32, "ptr*", "uint*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
