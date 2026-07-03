#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PPCI_EXPRESS_ROOT_PORT_WRITE_CONFIG_SPACE {
    value : IntPtr

    __value {
        set {
            if (value is PPCI_EXPRESS_ROOT_PORT_WRITE_CONFIG_SPACE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Integer} _Buffer 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @returns {Integer} 
     */
    Call(_Context, _Buffer, Offset, Length) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, IntPtr, _Buffer, UInt32, Offset, UInt32, Length, UInt32)
        return result
    }

    /**
     * A PPCI_EXPRESS_ROOT_PORT_WRITE_CONFIG_SPACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PPCI_EXPRESS_ROOT_PORT_WRITE_CONFIG_SPACE {
        /**
         * Creates a PPCI_EXPRESS_ROOT_PORT_WRITE_CONFIG_SPACE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, UInt32, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
