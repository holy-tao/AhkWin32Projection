#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RTL_GENERIC_TABLE.ahk" { RTL_GENERIC_TABLE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_GENERIC_FREE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is RTL_GENERIC_FREE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RTL_GENERIC_TABLE>} Table 
     * @param {Pointer<Void>} _Buffer 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Table, _Buffer) {
        _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

        DllCall(this.value, RTL_GENERIC_TABLE.Ptr, Table, _BufferMarshal, _Buffer)
    }

    /**
     * A RTL_GENERIC_FREE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RTL_GENERIC_FREE_ROUTINE {
        /**
         * Creates a RTL_GENERIC_FREE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(RTL_GENERIC_TABLE, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RTL_GENERIC_TABLE.Ptr, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
