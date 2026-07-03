#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERACTION_CONTEXT_OUTPUT.ahk" { INTERACTION_CONTEXT_OUTPUT }

/**
 * Callback that receives events from an Interaction Context object.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/nc-interactioncontext-interaction_context_output_callback
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct INTERACTION_CONTEXT_OUTPUT_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is INTERACTION_CONTEXT_OUTPUT_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} clientData A pointer to an object that contains information about the client. The value typically points to the object for which the member function is called.
     * @param {Pointer<INTERACTION_CONTEXT_OUTPUT>} output Output of the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(clientData, output) {
        clientDataMarshal := clientData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, clientDataMarshal, clientData, INTERACTION_CONTEXT_OUTPUT.Ptr, output)
    }

    /**
     * A INTERACTION_CONTEXT_OUTPUT_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends INTERACTION_CONTEXT_OUTPUT_CALLBACK {
        /**
         * Creates a INTERACTION_CONTEXT_OUTPUT_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", INTERACTION_CONTEXT_OUTPUT) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", INTERACTION_CONTEXT_OUTPUT.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
