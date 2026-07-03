#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PFN_IN_USE_PAGE_OFFLINE_NOTIFY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_IN_USE_PAGE_OFFLINE_NOTIFY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} Page 
     * @param {BOOLEAN} Flags 
     * @param {BOOLEAN} Poisoned 
     * @param {Pointer<Void>} _Context 
     * @returns {BOOLEAN} 
     */
    Call(Page, Flags, Poisoned, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, Page, BOOLEAN, Flags, BOOLEAN, Poisoned, _ContextMarshal, _Context, BOOLEAN)
        return result
    }

    /**
     * A PFN_IN_USE_PAGE_OFFLINE_NOTIFY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_IN_USE_PAGE_OFFLINE_NOTIFY {
        /**
         * Creates a PFN_IN_USE_PAGE_OFFLINE_NOTIFY pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, BOOLEAN, BOOLEAN, "ptr") => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, BOOLEAN, BOOLEAN, "ptr", BOOLEAN])
        }

        __Delete() => CallbackFree(this.value)
    }
}
