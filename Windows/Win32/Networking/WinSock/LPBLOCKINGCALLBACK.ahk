#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPBLOCKINGCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPBLOCKINGCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} dwContext 
     * @returns {BOOL} 
     */
    Call(dwContext) {
        result := DllCall(this.value, IntPtr, dwContext, BOOL)
        return result
    }

    /**
     * A LPBLOCKINGCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPBLOCKINGCALLBACK {
        /**
         * Creates a LPBLOCKINGCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
