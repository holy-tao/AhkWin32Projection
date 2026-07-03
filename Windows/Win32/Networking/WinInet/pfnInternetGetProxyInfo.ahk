#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct pfnInternetGetProxyInfo {
    value : IntPtr

    __value {
        set {
            if (value is pfnInternetGetProxyInfo) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} lpszUrl 
     * @param {Integer} dwUrlLength 
     * @param {PSTR} lpszUrlHostName 
     * @param {Integer} dwUrlHostNameLength 
     * @param {Pointer<PSTR>} lplpszProxyHostName 
     * @param {Pointer<Integer>} lpdwProxyHostNameLength 
     * @returns {BOOL} 
     */
    Call(lpszUrl, dwUrlLength, lpszUrlHostName, dwUrlHostNameLength, lplpszProxyHostName, lpdwProxyHostNameLength) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszUrlHostName := lpszUrlHostName is String ? StrPtr(lpszUrlHostName) : lpszUrlHostName

        lplpszProxyHostNameMarshal := lplpszProxyHostName is VarRef ? "ptr*" : "ptr"
        lpdwProxyHostNameLengthMarshal := lpdwProxyHostNameLength is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", lpszUrl, UInt32, dwUrlLength, "ptr", lpszUrlHostName, UInt32, dwUrlHostNameLength, lplpszProxyHostNameMarshal, lplpszProxyHostName, lpdwProxyHostNameLengthMarshal, lpdwProxyHostNameLength, BOOL)
        return result
    }

    /**
     * A pfnInternetGetProxyInfo that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pfnInternetGetProxyInfo {
        /**
         * Creates a pfnInternetGetProxyInfo pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, UInt32, PSTR, UInt32, PSTR, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, UInt32, PSTR, UInt32, PSTR.Ptr, "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
