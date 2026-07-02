#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EXTSTACKTRACE32.ahk" { EXTSTACKTRACE32 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_STACKTRACE_ROUTINE32 {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_STACKTRACE_ROUTINE32) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} FramePointer 
     * @param {Integer} StackPointer 
     * @param {Integer} ProgramCounter 
     * @param {Pointer<EXTSTACKTRACE32>} StackFrames 
     * @param {Integer} Frames 
     * @returns {Integer} 
     */
    Call(FramePointer, StackPointer, ProgramCounter, StackFrames, Frames) {
        result := DllCall(this.value, UInt32, FramePointer, UInt32, StackPointer, UInt32, ProgramCounter, EXTSTACKTRACE32.Ptr, StackFrames, UInt32, Frames, UInt32)
        return result
    }

    /**
     * A PWINDBG_STACKTRACE_ROUTINE32 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_STACKTRACE_ROUTINE32 {
        /**
         * Creates a PWINDBG_STACKTRACE_ROUTINE32 pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, UInt32, EXTSTACKTRACE32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, UInt32, EXTSTACKTRACE32.Ptr, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
