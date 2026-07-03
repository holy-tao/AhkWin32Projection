#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSATHREADID.ahk" { WSATHREADID }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWPUCLOSETHREAD {
    value : IntPtr

    __value {
        set {
            if (value is LPWPUCLOSETHREAD) {
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
     * @param {Pointer<Integer>} lpErrno 
     * @returns {Integer} 
     */
    Call(lpThreadId, lpErrno) {
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, WSATHREADID.Ptr, lpThreadId, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWPUCLOSETHREAD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWPUCLOSETHREAD {
        /**
         * Creates a LPWPUCLOSETHREAD pointer that invokes the given AHK function when called.
         * @param {Func(WSATHREADID, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WSATHREADID.Ptr, "int*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
