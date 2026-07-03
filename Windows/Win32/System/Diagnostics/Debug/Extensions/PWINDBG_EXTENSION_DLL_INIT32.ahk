#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINDBG_EXTENSION_APIS32.ahk" { WINDBG_EXTENSION_APIS32 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_EXTENSION_DLL_INIT32 {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_EXTENSION_DLL_INIT32) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINDBG_EXTENSION_APIS32>} lpExtensionApis 
     * @param {Integer} MajorVersion 
     * @param {Integer} MinorVersion 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(lpExtensionApis, MajorVersion, MinorVersion) {
        DllCall(this.value, WINDBG_EXTENSION_APIS32.Ptr, lpExtensionApis, UInt16, MajorVersion, UInt16, MinorVersion)
    }

    /**
     * A PWINDBG_EXTENSION_DLL_INIT32 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_EXTENSION_DLL_INIT32 {
        /**
         * Creates a PWINDBG_EXTENSION_DLL_INIT32 pointer that invokes the given AHK function when called.
         * @param {Func(WINDBG_EXTENSION_APIS32, UInt16, UInt16) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINDBG_EXTENSION_APIS32.Ptr, UInt16, UInt16, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
