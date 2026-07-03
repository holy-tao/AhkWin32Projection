#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_POLICY_EXTENSION_TYPE.ahk" { HTTP_POLICY_EXTENSION_TYPE }
#Import ".\HTTP_POLICY_EXTENSION_VERSION.ahk" { HTTP_POLICY_EXTENSION_VERSION }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct HTTP_POLICY_EXTENSION_INIT {
    value : IntPtr

    __value {
        set {
            if (value is HTTP_POLICY_EXTENSION_INIT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HTTP_POLICY_EXTENSION_VERSION} _Version 
     * @param {HTTP_POLICY_EXTENSION_TYPE} Type 
     * @param {Pointer<Void>} pvData 
     * @param {Integer} cbData 
     * @returns {Integer} 
     */
    Call(_Version, Type, pvData, cbData) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HTTP_POLICY_EXTENSION_VERSION, _Version, HTTP_POLICY_EXTENSION_TYPE, Type, pvDataMarshal, pvData, UInt32, cbData, UInt32)
        return result
    }

    /**
     * A HTTP_POLICY_EXTENSION_INIT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends HTTP_POLICY_EXTENSION_INIT {
        /**
         * Creates a HTTP_POLICY_EXTENSION_INIT pointer that invokes the given AHK function when called.
         * @param {Func(HTTP_POLICY_EXTENSION_VERSION, HTTP_POLICY_EXTENSION_TYPE, "ptr", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HTTP_POLICY_EXTENSION_VERSION, HTTP_POLICY_EXTENSION_TYPE, "ptr", UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
