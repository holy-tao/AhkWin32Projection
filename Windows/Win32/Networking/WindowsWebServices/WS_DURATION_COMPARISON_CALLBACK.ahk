#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_DURATION.ahk" { WS_DURATION }

/**
 * Compares two durations.
 * @remarks
 * If the function cannot compare the specified durations, it should return <b>WS_E_INVALID_FORMAT</b>. 
 *             (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_duration_comparison_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_DURATION_COMPARISON_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_DURATION_COMPARISON_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WS_DURATION>} duration1 A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_duration">WS_DURATION</a> structure representing the first duration to compare.
     * @param {Pointer<WS_DURATION>} duration2 A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_duration">WS_DURATION</a> structure representing the second duration.
     * @param {Pointer<WS_ERROR>} _error A pointer to  a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> handle where additional error information should be stored if the function fails.
     * @returns {Integer} 
     */
    Call(duration1, duration2, _error) {
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, WS_DURATION.Ptr, duration1, WS_DURATION.Ptr, duration2, "int*", &result := 0, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_DURATION_COMPARISON_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_DURATION_COMPARISON_CALLBACK {
        /**
         * Creates a WS_DURATION_COMPARISON_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(WS_DURATION, WS_DURATION, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WS_DURATION.Ptr, WS_DURATION.Ptr, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
