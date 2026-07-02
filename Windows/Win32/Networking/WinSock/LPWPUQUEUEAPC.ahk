#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPWSAUSERAPC.ahk" { LPWSAUSERAPC }
#Import ".\WSATHREADID.ahk" { WSATHREADID }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWPUQUEUEAPC {
    value : IntPtr

    __value {
        set {
            if (value is LPWPUQUEUEAPC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WSATHREADID>} lpThreadId 
     * @param {Pointer<LPWSAUSERAPC>} lpfnUserApc 
     * @param {Pointer} dwContext 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {Integer} 
     */
    Call(lpThreadId, lpfnUserApc, dwContext, lpErrno) {
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, WSATHREADID.Ptr, lpThreadId, LPWSAUSERAPC, lpfnUserApc, IntPtr, dwContext, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWPUQUEUEAPC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWPUQUEUEAPC {
        /**
         * Creates a LPWPUQUEUEAPC pointer that invokes the given AHK function when called.
         * @param {Func(WSATHREADID, LPWSAUSERAPC, IntPtr, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WSATHREADID.Ptr, LPWSAUSERAPC, IntPtr, "int*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
