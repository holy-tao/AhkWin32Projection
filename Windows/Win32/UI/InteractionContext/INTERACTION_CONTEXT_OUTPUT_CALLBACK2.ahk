#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERACTION_CONTEXT_OUTPUT2.ahk" { INTERACTION_CONTEXT_OUTPUT2 }

/**
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct INTERACTION_CONTEXT_OUTPUT_CALLBACK2 {
    value : IntPtr

    __value {
        set {
            if (value is INTERACTION_CONTEXT_OUTPUT_CALLBACK2) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} clientData 
     * @param {Pointer<INTERACTION_CONTEXT_OUTPUT2>} output 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(clientData, output) {
        clientDataMarshal := clientData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, clientDataMarshal, clientData, INTERACTION_CONTEXT_OUTPUT2.Ptr, output)
    }

    /**
     * A INTERACTION_CONTEXT_OUTPUT_CALLBACK2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends INTERACTION_CONTEXT_OUTPUT_CALLBACK2 {
        /**
         * Creates a INTERACTION_CONTEXT_OUTPUT_CALLBACK2 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", INTERACTION_CONTEXT_OUTPUT2) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", INTERACTION_CONTEXT_OUTPUT2.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
