#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSAEVENT.ahk" { WSAEVENT }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWPUCREATEEVENT {
    value : IntPtr

    __value {
        set {
            if (value is LPWPUCREATEEVENT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {WSAEVENT} 
     */
    Call(lpErrno) {
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, lpErrnoMarshal, lpErrno, WSAEVENT.Owned)
        return result
    }

    /**
     * A LPWPUCREATEEVENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWPUCREATEEVENT {
        /**
         * Creates a LPWPUCREATEEVENT pointer that invokes the given AHK function when called.
         * @param {Func("int*") => WSAEVENT} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int*", WSAEVENT])
        }

        __Delete() => CallbackFree(this.value)
    }
}
