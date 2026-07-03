#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\NSP_ROUTINE.ahk" { NSP_ROUTINE }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPNSPSTARTUP {
    value : IntPtr

    __value {
        set {
            if (value is LPNSPSTARTUP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} lpProviderId 
     * @param {Pointer<NSP_ROUTINE>} lpnspRoutines 
     * @returns {Integer} 
     */
    Call(lpProviderId, lpnspRoutines) {
        result := DllCall(this.value, Guid.Ptr, lpProviderId, NSP_ROUTINE.Ptr, lpnspRoutines, Int32)
        return result
    }

    /**
     * A LPNSPSTARTUP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPNSPSTARTUP {
        /**
         * Creates a LPNSPSTARTUP pointer that invokes the given AHK function when called.
         * @param {Func(Guid, NSP_ROUTINE) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, NSP_ROUTINE.Ptr, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
