#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPCLT_PDU_FILTER_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is RPCLT_PDU_FILTER_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Buffer 
     * @param {Integer} BufferLength 
     * @param {Integer} fDatagram 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Buffer, BufferLength, fDatagram) {
        _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _BufferMarshal, _Buffer, UInt32, BufferLength, Int32, fDatagram)
    }

    /**
     * A RPCLT_PDU_FILTER_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RPCLT_PDU_FILTER_FUNC {
        /**
         * Creates a RPCLT_PDU_FILTER_FUNC pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, Int32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, Int32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
