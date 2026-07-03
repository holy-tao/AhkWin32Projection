#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKET.ahk" { SOCKET }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWPUQUERYSOCKETHANDLECONTEXT {
    value : IntPtr

    __value {
        set {
            if (value is LPWPUQUERYSOCKETHANDLECONTEXT) {
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
     * @param {Pointer<Pointer>} lpContext 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {Integer} 
     */
    Call(s, lpContext, lpErrno) {
        lpContextMarshal := lpContext is VarRef ? "ptr*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, SOCKET, s, lpContextMarshal, lpContext, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWPUQUERYSOCKETHANDLECONTEXT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWPUQUERYSOCKETHANDLECONTEXT {
        /**
         * Creates a LPWPUQUERYSOCKETHANDLECONTEXT pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, "ptr*", "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, "ptr*", "int*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
