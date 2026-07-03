#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSAPOLLFD.ahk" { WSAPOLLFD }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPFN_WSAPOLL {
    value : IntPtr

    __value {
        set {
            if (value is LPFN_WSAPOLL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WSAPOLLFD>} fdarray 
     * @param {Integer} nfds 
     * @param {Integer} timeout 
     * @returns {Integer} 
     */
    Call(fdarray, nfds, timeout) {
        result := DllCall(this.value, WSAPOLLFD.Ptr, fdarray, UInt32, nfds, Int32, timeout, Int32)
        return result
    }

    /**
     * A LPFN_WSAPOLL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFN_WSAPOLL {
        /**
         * Creates a LPFN_WSAPOLL pointer that invokes the given AHK function when called.
         * @param {Func(WSAPOLLFD, UInt32, Int32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WSAPOLLFD.Ptr, UInt32, Int32, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
