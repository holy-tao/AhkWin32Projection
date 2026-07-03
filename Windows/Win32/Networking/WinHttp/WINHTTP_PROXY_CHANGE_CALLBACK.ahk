#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an application-defined proxy change callback function.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/nc-winhttp-winhttp_proxy_change_callback
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_PROXY_CHANGE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WINHTTP_PROXY_CHANGE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} ullFlags Type: \_In\_ **[ULONGLONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The flag passed to the [WinHttpRegisterProxyChangeNotification](nf-winhttp-winhttpregisterproxychangenotification.md) function (for example, **WINHTTP_PROXY_NOTIFY_CHANGE**).
     * @param {Pointer<Void>} pvContext Type: \_In\_ **[PVOID](/windows/win32/winprog/windows-data-types)**
     * 
     * The context object pointer passed to the [WinHttpRegisterProxyChangeNotification](nf-winhttp-winhttpregisterproxychangenotification.md) function.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ullFlags, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, Int64, ullFlags, pvContextMarshal, pvContext)
    }

    /**
     * A WINHTTP_PROXY_CHANGE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WINHTTP_PROXY_CHANGE_CALLBACK {
        /**
         * Creates a WINHTTP_PROXY_CHANGE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(Int64, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
