#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct CS_TAG_GETTING_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is CS_TAG_GETTING_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} hBinding 
     * @param {Integer} fServerSide 
     * @param {Pointer<Integer>} pulSendingTag 
     * @param {Pointer<Integer>} pulDesiredReceivingTag 
     * @param {Pointer<Integer>} pulReceivingTag 
     * @param {Pointer<Integer>} pStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hBinding, fServerSide, pulSendingTag, pulDesiredReceivingTag, pulReceivingTag, pStatus) {
        hBindingMarshal := hBinding is VarRef ? "ptr" : "ptr"
        pulSendingTagMarshal := pulSendingTag is VarRef ? "uint*" : "ptr"
        pulDesiredReceivingTagMarshal := pulDesiredReceivingTag is VarRef ? "uint*" : "ptr"
        pulReceivingTagMarshal := pulReceivingTag is VarRef ? "uint*" : "ptr"
        pStatusMarshal := pStatus is VarRef ? "uint*" : "ptr"

        DllCall(this.value, hBindingMarshal, hBinding, Int32, fServerSide, pulSendingTagMarshal, pulSendingTag, pulDesiredReceivingTagMarshal, pulDesiredReceivingTag, pulReceivingTagMarshal, pulReceivingTag, pStatusMarshal, pStatus)
    }

    /**
     * A CS_TAG_GETTING_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CS_TAG_GETTING_ROUTINE {
        /**
         * Creates a CS_TAG_GETTING_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int32, "uint*", "uint*", "uint*", "uint*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int32, "uint*", "uint*", "uint*", "uint*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
