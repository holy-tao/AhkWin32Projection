#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_POLICY_EXTENSION_TYPE.ahk" { HTTP_POLICY_EXTENSION_TYPE }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct HTTP_POLICY_EXTENSION_SHUTDOWN {
    value : IntPtr

    __value {
        set {
            if (value is HTTP_POLICY_EXTENSION_SHUTDOWN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HTTP_POLICY_EXTENSION_TYPE} Type 
     * @returns {Integer} 
     */
    Call(Type) {
        result := DllCall(this.value, HTTP_POLICY_EXTENSION_TYPE, Type, UInt32)
        return result
    }

    /**
     * A HTTP_POLICY_EXTENSION_SHUTDOWN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HTTP_POLICY_EXTENSION_SHUTDOWN {
        /**
         * Creates a HTTP_POLICY_EXTENSION_SHUTDOWN pointer that invokes the given AHK function when called.
         * @param {Func(HTTP_POLICY_EXTENSION_TYPE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HTTP_POLICY_EXTENSION_TYPE, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
