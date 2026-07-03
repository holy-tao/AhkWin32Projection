#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ICLRRuntimeInfo.ahk" { ICLRRuntimeInfo }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct RuntimeLoadedCallbackFnPtr {
    value : IntPtr

    __value {
        set {
            if (value is RuntimeLoadedCallbackFnPtr) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {ICLRRuntimeInfo} pRuntimeInfo 
     * @param {Pointer<CallbackThreadSetFnPtr>} pfnCallbackThreadSet 
     * @param {Pointer<CallbackThreadUnsetFnPtr>} pfnCallbackThreadUnset 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pRuntimeInfo, pfnCallbackThreadSet, pfnCallbackThreadUnset) {
        DllCall(this.value, "ptr", pRuntimeInfo, "ptr", pfnCallbackThreadSet, "ptr", pfnCallbackThreadUnset)
    }

    /**
     * A RuntimeLoadedCallbackFnPtr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RuntimeLoadedCallbackFnPtr {
        /**
         * Creates a RuntimeLoadedCallbackFnPtr pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
