#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\val_context.ahk" { val_context }

/**
 * @namespace Windows.Win32.System.Registry
 */
export default struct PQUERYHANDLER {
    value : IntPtr

    __value {
        set {
            if (value is PQUERYHANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} keycontext 
     * @param {Pointer<val_context>} val_list 
     * @param {Integer} num_vals 
     * @param {Pointer<Void>} outputbuffer 
     * @param {Pointer<Integer>} total_outlen 
     * @param {Integer} input_blen 
     * @returns {Integer} 
     */
    Call(keycontext, val_list, num_vals, outputbuffer, total_outlen, input_blen) {
        keycontextMarshal := keycontext is VarRef ? "ptr" : "ptr"
        outputbufferMarshal := outputbuffer is VarRef ? "ptr" : "ptr"
        total_outlenMarshal := total_outlen is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, keycontextMarshal, keycontext, val_context.Ptr, val_list, UInt32, num_vals, outputbufferMarshal, outputbuffer, total_outlenMarshal, total_outlen, UInt32, input_blen, UInt32)
        return result
    }

    /**
     * A PQUERYHANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PQUERYHANDLER {
        /**
         * Creates a PQUERYHANDLER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", val_context, UInt32, "ptr", "uint*", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", ["ptr", val_context.Ptr, UInt32, "ptr", "uint*", UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
