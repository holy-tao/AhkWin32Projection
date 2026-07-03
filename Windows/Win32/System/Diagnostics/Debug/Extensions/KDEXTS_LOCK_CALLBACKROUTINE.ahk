#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\KDEXTS_LOCK_INFO.ahk" { KDEXTS_LOCK_INFO }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct KDEXTS_LOCK_CALLBACKROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is KDEXTS_LOCK_CALLBACKROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<KDEXTS_LOCK_INFO>} pLock 
     * @param {Pointer<Void>} _Context 
     * @returns {HRESULT} 
     */
    Call(pLock, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, KDEXTS_LOCK_INFO.Ptr, pLock, _ContextMarshal, _Context, "HRESULT")
        return result
    }

    /**
     * A KDEXTS_LOCK_CALLBACKROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KDEXTS_LOCK_CALLBACKROUTINE {
        /**
         * Creates a KDEXTS_LOCK_CALLBACKROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(KDEXTS_LOCK_INFO, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [KDEXTS_LOCK_INFO.Ptr, "ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
