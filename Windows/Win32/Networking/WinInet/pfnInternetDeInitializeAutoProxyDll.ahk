#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct pfnInternetDeInitializeAutoProxyDll {
    value : IntPtr

    __value {
        set {
            if (value is pfnInternetDeInitializeAutoProxyDll) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} lpszMime 
     * @param {Integer} dwReserved 
     * @returns {BOOL} 
     */
    Call(lpszMime, dwReserved) {
        lpszMime := lpszMime is String ? StrPtr(lpszMime) : lpszMime

        result := DllCall(this.value, "ptr", lpszMime, UInt32, dwReserved, BOOL)
        return result
    }

    /**
     * A pfnInternetDeInitializeAutoProxyDll that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pfnInternetDeInitializeAutoProxyDll {
        /**
         * Creates a pfnInternetDeInitializeAutoProxyDll pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
