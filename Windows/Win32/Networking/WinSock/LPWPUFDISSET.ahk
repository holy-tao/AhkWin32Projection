#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FD_SET.ahk" { FD_SET }
#Import ".\SOCKET.ahk" { SOCKET }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWPUFDISSET {
    value : IntPtr

    __value {
        set {
            if (value is LPWPUFDISSET) {
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
     * @param {Pointer<FD_SET>} fdset 
     * @returns {Integer} 
     */
    Call(s, fdset) {
        result := DllCall(this.value, SOCKET, s, FD_SET.Ptr, fdset, Int32)
        return result
    }

    /**
     * A LPWPUFDISSET that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWPUFDISSET {
        /**
         * Creates a LPWPUFDISSET pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, FD_SET) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, FD_SET.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
