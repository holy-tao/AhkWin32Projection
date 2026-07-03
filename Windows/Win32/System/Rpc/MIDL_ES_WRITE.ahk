#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct MIDL_ES_WRITE {
    value : IntPtr

    __value {
        set {
            if (value is MIDL_ES_WRITE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} state 
     * @param {PSTR} _buffer 
     * @param {Integer} _size 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(state, _buffer, _size) {
        _buffer := _buffer is String ? StrPtr(_buffer) : _buffer

        stateMarshal := state is VarRef ? "ptr" : "ptr"

        DllCall(this.value, stateMarshal, state, "ptr", _buffer, UInt32, _size)
    }

    /**
     * A MIDL_ES_WRITE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MIDL_ES_WRITE {
        /**
         * Creates a MIDL_ES_WRITE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PSTR, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PSTR, UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
