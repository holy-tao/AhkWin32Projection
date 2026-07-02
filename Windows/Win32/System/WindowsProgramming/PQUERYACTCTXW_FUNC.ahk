#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PQUERYACTCTXW_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PQUERYACTCTXW_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {HANDLE} hActCtx 
     * @param {Pointer<Void>} pvSubInstance 
     * @param {Integer} ulInfoClass 
     * @param {Integer} pvBuffer 
     * @param {Pointer} cbBuffer 
     * @param {Pointer<Pointer>} pcbWrittenOrRequired 
     * @returns {BOOL} 
     */
    Call(dwFlags, hActCtx, pvSubInstance, ulInfoClass, pvBuffer, cbBuffer, pcbWrittenOrRequired) {
        pvSubInstanceMarshal := pvSubInstance is VarRef ? "ptr" : "ptr"
        pcbWrittenOrRequiredMarshal := pcbWrittenOrRequired is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, UInt32, dwFlags, HANDLE, hActCtx, pvSubInstanceMarshal, pvSubInstance, UInt32, ulInfoClass, IntPtr, pvBuffer, IntPtr, cbBuffer, pcbWrittenOrRequiredMarshal, pcbWrittenOrRequired, BOOL)
        return result
    }

    /**
     * A PQUERYACTCTXW_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PQUERYACTCTXW_FUNC {
        /**
         * Creates a PQUERYACTCTXW_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, HANDLE, "ptr", UInt32, IntPtr, IntPtr, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, HANDLE, "ptr", UInt32, IntPtr, IntPtr, "ptr*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
