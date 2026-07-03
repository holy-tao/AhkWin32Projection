#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PFN_RTL_IS_SERVICE_PACK_VERSION_INSTALLED {
    value : IntPtr

    __value {
        set {
            if (value is PFN_RTL_IS_SERVICE_PACK_VERSION_INSTALLED) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} _Version 
     * @returns {BOOLEAN} 
     */
    Call(_Version) {
        result := DllCall(this.value, UInt32, _Version, BOOLEAN)
        return result
    }

    /**
     * A PFN_RTL_IS_SERVICE_PACK_VERSION_INSTALLED that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_RTL_IS_SERVICE_PACK_VERSION_INSTALLED {
        /**
         * Creates a PFN_RTL_IS_SERVICE_PACK_VERSION_INSTALLED pointer that invokes the given AHK function when called.
         * @param {Func(UInt32) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, BOOLEAN])
        }

        __Delete() => CallbackFree(this.value)
    }
}
