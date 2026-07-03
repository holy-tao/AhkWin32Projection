#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HGROUP.ahk" { HGROUP }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLOSE_CLUSTER_GROUP {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLOSE_CLUSTER_GROUP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HGROUP} _hGroup 
     * @returns {BOOL} 
     */
    Call(_hGroup) {
        result := DllCall(this.value, HGROUP, _hGroup, BOOL)
        return result
    }

    /**
     * A PCLUSAPI_CLOSE_CLUSTER_GROUP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLOSE_CLUSTER_GROUP {
        /**
         * Creates a PCLUSAPI_CLOSE_CLUSTER_GROUP pointer that invokes the given AHK function when called.
         * @param {Func(HGROUP) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUP, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
