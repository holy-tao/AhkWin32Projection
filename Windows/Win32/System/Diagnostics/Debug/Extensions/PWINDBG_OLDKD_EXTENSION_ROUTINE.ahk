#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\WINDBG_OLDKD_EXTENSION_APIS.ahk" { WINDBG_OLDKD_EXTENSION_APIS }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_OLDKD_EXTENSION_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_OLDKD_EXTENSION_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwCurrentPc 
     * @param {Pointer<WINDBG_OLDKD_EXTENSION_APIS>} lpExtensionApis 
     * @param {PSTR} lpArgumentString 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(dwCurrentPc, lpExtensionApis, lpArgumentString) {
        lpArgumentString := lpArgumentString is String ? StrPtr(lpArgumentString) : lpArgumentString

        DllCall(this.value, UInt32, dwCurrentPc, WINDBG_OLDKD_EXTENSION_APIS.Ptr, lpExtensionApis, "ptr", lpArgumentString)
    }

    /**
     * A PWINDBG_OLDKD_EXTENSION_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_OLDKD_EXTENSION_ROUTINE {
        /**
         * Creates a PWINDBG_OLDKD_EXTENSION_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, WINDBG_OLDKD_EXTENSION_APIS, PSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, WINDBG_OLDKD_EXTENSION_APIS.Ptr, PSTR, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
