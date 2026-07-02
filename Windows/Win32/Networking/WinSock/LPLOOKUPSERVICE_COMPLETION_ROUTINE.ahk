#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPLOOKUPSERVICE_COMPLETION_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is LPLOOKUPSERVICE_COMPLETION_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwError 
     * @param {Integer} dwBytes 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(dwError, dwBytes, lpOverlapped) {
        DllCall(this.value, UInt32, dwError, UInt32, dwBytes, OVERLAPPED.Ptr, lpOverlapped)
    }

    /**
     * A LPLOOKUPSERVICE_COMPLETION_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPLOOKUPSERVICE_COMPLETION_ROUTINE {
        /**
         * Creates a LPLOOKUPSERVICE_COMPLETION_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, OVERLAPPED) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, OVERLAPPED.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
