#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINDBG_EXTENSION_APIS.ahk" { WINDBG_EXTENSION_APIS }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_EXTENSION_DLL_INIT {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_EXTENSION_DLL_INIT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINDBG_EXTENSION_APIS>} lpExtensionApis 
     * @param {Integer} MajorVersion 
     * @param {Integer} MinorVersion 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(lpExtensionApis, MajorVersion, MinorVersion) {
        DllCall(this.value, WINDBG_EXTENSION_APIS.Ptr, lpExtensionApis, UInt16, MajorVersion, UInt16, MinorVersion)
    }

    /**
     * A PWINDBG_EXTENSION_DLL_INIT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_EXTENSION_DLL_INIT {
        /**
         * Creates a PWINDBG_EXTENSION_DLL_INIT pointer that invokes the given AHK function when called.
         * @param {Func(WINDBG_EXTENSION_APIS, UInt16, UInt16) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINDBG_EXTENSION_APIS.Ptr, UInt16, UInt16, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
