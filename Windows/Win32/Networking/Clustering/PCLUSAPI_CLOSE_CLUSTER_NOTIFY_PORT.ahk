#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HCHANGE.ahk" { HCHANGE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLOSE_CLUSTER_NOTIFY_PORT {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLOSE_CLUSTER_NOTIFY_PORT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCHANGE} _hChange 
     * @returns {BOOL} 
     */
    Call(_hChange) {
        result := DllCall(this.value, HCHANGE, _hChange, BOOL)
        return result
    }

    /**
     * A PCLUSAPI_CLOSE_CLUSTER_NOTIFY_PORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLOSE_CLUSTER_NOTIFY_PORT {
        /**
         * Creates a PCLUSAPI_CLOSE_CLUSTER_NOTIFY_PORT pointer that invokes the given AHK function when called.
         * @param {Func(HCHANGE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCHANGE, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
