#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Services
 * @charset ANSI
 */
export default struct SERVICE_MAIN_FUNCTIONA {
    value : IntPtr

    __value {
        set {
            if (value is SERVICE_MAIN_FUNCTIONA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwNumServicesArgs 
     * @param {Pointer<Pointer<Integer>>} lpServiceArgVectors 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(dwNumServicesArgs, lpServiceArgVectors) {
        lpServiceArgVectorsMarshal := lpServiceArgVectors is VarRef ? "ptr*" : "ptr"

        DllCall(this.value, UInt32, dwNumServicesArgs, lpServiceArgVectorsMarshal, lpServiceArgVectors)
    }

    /**
     * A SERVICE_MAIN_FUNCTIONA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SERVICE_MAIN_FUNCTIONA {
        /**
         * Creates a SERVICE_MAIN_FUNCTIONA pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
