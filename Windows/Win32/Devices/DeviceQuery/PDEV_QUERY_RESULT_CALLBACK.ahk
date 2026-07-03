#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEV_QUERY_RESULT_ACTION_DATA.ahk" { DEV_QUERY_RESULT_ACTION_DATA }
#Import ".\HDEVQUERY.ahk" { HDEVQUERY }

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
export default struct PDEV_QUERY_RESULT_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PDEV_QUERY_RESULT_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HDEVQUERY} _hDevQuery 
     * @param {Pointer<Void>} pContext 
     * @param {Pointer<DEV_QUERY_RESULT_ACTION_DATA>} pActionData 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_hDevQuery, pContext, pActionData) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, HDEVQUERY, _hDevQuery, pContextMarshal, pContext, DEV_QUERY_RESULT_ACTION_DATA.Ptr, pActionData)
    }

    /**
     * A PDEV_QUERY_RESULT_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDEV_QUERY_RESULT_CALLBACK {
        /**
         * Creates a PDEV_QUERY_RESULT_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HDEVQUERY, "ptr", DEV_QUERY_RESULT_ACTION_DATA) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HDEVQUERY, "ptr", DEV_QUERY_RESULT_ACTION_DATA.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
