#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RadiusExtensionInit function is an application-defined function and is called by NPS while the service is starting up. Use RadiusExtensionInit to perform any initialization operations for the Extension DLL.
 * @remarks
 * A return value other then `NO_ERROR` will cause NPS to fail to start.
 * 
 * **RadiusExtensionInit** is an optional function. The RADIUS Extension DLL need not implement **RadiusExtensionInit**.
 * @see https://learn.microsoft.com/windows/win32/api/authif/nc-authif-pradius_extension_init
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct PRADIUS_EXTENSION_INIT {
    value : IntPtr

    __value {
        set {
            if (value is PRADIUS_EXTENSION_INIT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {Integer} If the function succeeds, the return value is `NO_ERROR`. If the function fails, the return value should be an appropriate error code from WinError.h.
     */
    Call() {
        result := DllCall(this.value, UInt32)
        return result
    }

    /**
     * A PRADIUS_EXTENSION_INIT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRADIUS_EXTENSION_INIT {
        /**
         * Creates a PRADIUS_EXTENSION_INIT pointer that invokes the given AHK function when called.
         * @param {Func() => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
