#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CO_ADDRESS_FAMILY.ahk" { CO_ADDRESS_FAMILY }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct PROTOCOL_CO_AF_REGISTER_NOTIFY {
    value : IntPtr

    __value {
        set {
            if (value is PROTOCOL_CO_AF_REGISTER_NOTIFY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} ProtocolBindingContext 
     * @param {Pointer<CO_ADDRESS_FAMILY>} AddressFamily 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ProtocolBindingContext, AddressFamily) {
        ProtocolBindingContextMarshal := ProtocolBindingContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, ProtocolBindingContextMarshal, ProtocolBindingContext, CO_ADDRESS_FAMILY.Ptr, AddressFamily)
    }

    /**
     * A PROTOCOL_CO_AF_REGISTER_NOTIFY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROTOCOL_CO_AF_REGISTER_NOTIFY {
        /**
         * Creates a PROTOCOL_CO_AF_REGISTER_NOTIFY pointer that invokes the given AHK function when called.
         * @param {Func("ptr", CO_ADDRESS_FAMILY) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", CO_ADDRESS_FAMILY.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
