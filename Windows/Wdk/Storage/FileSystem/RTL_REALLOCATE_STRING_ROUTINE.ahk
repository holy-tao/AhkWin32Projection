#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct RTL_REALLOCATE_STRING_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is RTL_REALLOCATE_STRING_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} NumberOfBytes 
     * @param {Pointer<Void>} _Buffer 
     * @returns {Pointer<Void>} 
     */
    Call(NumberOfBytes, _Buffer) {
        _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, NumberOfBytes, _BufferMarshal, _Buffer, IntPtr)
        return result
    }

    /**
     * A RTL_REALLOCATE_STRING_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RTL_REALLOCATE_STRING_ROUTINE {
        /**
         * Creates a RTL_REALLOCATE_STRING_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "ptr") => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr", "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
