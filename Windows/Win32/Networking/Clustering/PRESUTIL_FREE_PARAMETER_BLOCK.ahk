#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RESUTIL_PROPERTY_ITEM.ahk" { RESUTIL_PROPERTY_ITEM }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_FREE_PARAMETER_BLOCK {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_FREE_PARAMETER_BLOCK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} pOutParams 
     * @param {Pointer<Integer>} pInParams 
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pOutParams, pInParams, pPropertyTable) {
        pOutParamsMarshal := pOutParams is VarRef ? "char*" : "ptr"
        pInParamsMarshal := pInParams is VarRef ? "char*" : "ptr"

        DllCall(this.value, pOutParamsMarshal, pOutParams, pInParamsMarshal, pInParams, RESUTIL_PROPERTY_ITEM.Ptr, pPropertyTable)
    }

    /**
     * A PRESUTIL_FREE_PARAMETER_BLOCK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_FREE_PARAMETER_BLOCK {
        /**
         * Creates a PRESUTIL_FREE_PARAMETER_BLOCK pointer that invokes the given AHK function when called.
         * @param {Func("char*", "char*", RESUTIL_PROPERTY_ITEM) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", "char*", RESUTIL_PROPERTY_ITEM.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
