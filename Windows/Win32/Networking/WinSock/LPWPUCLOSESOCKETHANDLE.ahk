#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKET.ahk" { SOCKET }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWPUCLOSESOCKETHANDLE {
    value : IntPtr

    __value {
        set {
            if (value is LPWPUCLOSESOCKETHANDLE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SOCKET} s 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {Integer} 
     */
    Call(s, lpErrno) {
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, SOCKET, s, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWPUCLOSESOCKETHANDLE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWPUCLOSESOCKETHANDLE {
        /**
         * Creates a LPWPUCLOSESOCKETHANDLE pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, "int*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
