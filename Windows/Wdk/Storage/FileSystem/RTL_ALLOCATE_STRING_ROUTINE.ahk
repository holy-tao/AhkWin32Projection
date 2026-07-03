#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct RTL_ALLOCATE_STRING_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is RTL_ALLOCATE_STRING_ROUTINE) {
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
     * @returns {Pointer<Void>} 
     */
    Call(NumberOfBytes) {
        result := DllCall(this.value, IntPtr, NumberOfBytes, IntPtr)
        return result
    }

    /**
     * A RTL_ALLOCATE_STRING_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RTL_ALLOCATE_STRING_ROUTINE {
        /**
         * Creates a RTL_ALLOCATE_STRING_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
