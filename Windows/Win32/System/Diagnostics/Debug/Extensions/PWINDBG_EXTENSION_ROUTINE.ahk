#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_EXTENSION_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_EXTENSION_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hCurrentProcess 
     * @param {HANDLE} hCurrentThread 
     * @param {Integer} dwCurrentPc 
     * @param {Integer} dwProcessor 
     * @param {PSTR} lpArgumentString 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hCurrentProcess, hCurrentThread, dwCurrentPc, dwProcessor, lpArgumentString) {
        lpArgumentString := lpArgumentString is String ? StrPtr(lpArgumentString) : lpArgumentString

        DllCall(this.value, HANDLE, hCurrentProcess, HANDLE, hCurrentThread, UInt32, dwCurrentPc, UInt32, dwProcessor, "ptr", lpArgumentString)
    }

    /**
     * A PWINDBG_EXTENSION_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_EXTENSION_ROUTINE {
        /**
         * Creates a PWINDBG_EXTENSION_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, UInt32, UInt32, PSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, UInt32, UInt32, PSTR, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
