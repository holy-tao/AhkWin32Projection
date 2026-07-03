#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\MINIDUMP_CALLBACK_INPUT.ahk" { MINIDUMP_CALLBACK_INPUT }
#Import ".\MINIDUMP_CALLBACK_OUTPUT.ahk" { MINIDUMP_CALLBACK_OUTPUT }

/**
 * An application-defined callback function used with MiniDumpWriteDump. It receives extended minidump information.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/nc-minidumpapiset-minidump_callback_routine
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_CALLBACK_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is MINIDUMP_CALLBACK_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} CallbackParam An application-defined parameter value.
     * @param {Pointer<MINIDUMP_CALLBACK_INPUT>} CallbackInput A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_callback_input">MINIDUMP_CALLBACK_INPUT</a> structure that specifies extended minidump information.
     * @param {Pointer<MINIDUMP_CALLBACK_OUTPUT>} CallbackOutput A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_callback_output">MINIDUMP_CALLBACK_OUTPUT</a> structure that receives application-defined information from the callback function.
     * @returns {BOOL} If the function succeeds, return <b>TRUE</b>; otherwise, return <b>FALSE</b>.
     */
    Call(CallbackParam, CallbackInput, CallbackOutput) {
        CallbackParamMarshal := CallbackParam is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CallbackParamMarshal, CallbackParam, MINIDUMP_CALLBACK_INPUT.Ptr, CallbackInput, MINIDUMP_CALLBACK_OUTPUT.Ptr, CallbackOutput, BOOL)
        return result
    }

    /**
     * A MINIDUMP_CALLBACK_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MINIDUMP_CALLBACK_ROUTINE {
        /**
         * Creates a MINIDUMP_CALLBACK_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", MINIDUMP_CALLBACK_INPUT, MINIDUMP_CALLBACK_OUTPUT) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", MINIDUMP_CALLBACK_INPUT.Ptr, MINIDUMP_CALLBACK_OUTPUT.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
