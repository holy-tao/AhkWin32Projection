#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\AUTO_PROXY_SCRIPT_BUFFER.ahk" { AUTO_PROXY_SCRIPT_BUFFER }
#Import ".\AutoProxyHelperFunctions.ahk" { AutoProxyHelperFunctions }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct pfnInternetInitializeAutoProxyDll {
    value : IntPtr

    __value {
        set {
            if (value is pfnInternetInitializeAutoProxyDll) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwVersion 
     * @param {PSTR} lpszDownloadedTempFile 
     * @param {PSTR} lpszMime 
     * @param {Pointer<AutoProxyHelperFunctions>} lpAutoProxyCallbacks 
     * @param {Pointer<AUTO_PROXY_SCRIPT_BUFFER>} lpAutoProxyScriptBuffer 
     * @returns {BOOL} 
     */
    Call(dwVersion, lpszDownloadedTempFile, lpszMime, lpAutoProxyCallbacks, lpAutoProxyScriptBuffer) {
        lpszDownloadedTempFile := lpszDownloadedTempFile is String ? StrPtr(lpszDownloadedTempFile) : lpszDownloadedTempFile
        lpszMime := lpszMime is String ? StrPtr(lpszMime) : lpszMime

        result := DllCall(this.value, UInt32, dwVersion, "ptr", lpszDownloadedTempFile, "ptr", lpszMime, AutoProxyHelperFunctions.Ptr, lpAutoProxyCallbacks, AUTO_PROXY_SCRIPT_BUFFER.Ptr, lpAutoProxyScriptBuffer, BOOL)
        return result
    }

    /**
     * A pfnInternetInitializeAutoProxyDll that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pfnInternetInitializeAutoProxyDll {
        /**
         * Creates a pfnInternetInitializeAutoProxyDll pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, PSTR, PSTR, AutoProxyHelperFunctions, AUTO_PROXY_SCRIPT_BUFFER) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, PSTR, PSTR, AutoProxyHelperFunctions.Ptr, AUTO_PROXY_SCRIPT_BUFFER.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
