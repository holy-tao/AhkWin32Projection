#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WSAEVENT.ahk" { WSAEVENT }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWPURESETEVENT {
    value : IntPtr

    __value {
        set {
            if (value is LPWPURESETEVENT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {WSAEVENT} hEvent 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {BOOL} 
     */
    Call(hEvent, lpErrno) {
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, WSAEVENT, hEvent, lpErrnoMarshal, lpErrno, BOOL)
        return result
    }

    /**
     * A LPWPURESETEVENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWPURESETEVENT {
        /**
         * Creates a LPWPURESETEVENT pointer that invokes the given AHK function when called.
         * @param {Func(WSAEVENT, "int*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WSAEVENT, "int*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
