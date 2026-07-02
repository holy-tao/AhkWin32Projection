#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Determines whether the specified string can be written in optimized form.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_dynamic_string_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_DYNAMIC_STRING_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_DYNAMIC_STRING_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} callbackState User-defined state that was passed to the function that accepted the <i>WS_DYNAMIC_STRING_CALLBACK</i>.
     * @param {Pointer<WS_XML_STRING>} _string The string to look up in the dynamic dictionary.
     * @param {Pointer<BOOL>} found Whether or not the string was found in the dynamic dictionary is returned here.
     * @param {Pointer<Integer>} id The id of the string is returned here.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This callback function does not return a value.
     */
    Call(callbackState, _string, found, id, _error) {
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"
        foundMarshal := found is VarRef ? "int*" : "ptr"
        idMarshal := id is VarRef ? "uint*" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, callbackStateMarshal, callbackState, WS_XML_STRING.Ptr, _string, foundMarshal, found, idMarshal, id, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_DYNAMIC_STRING_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_DYNAMIC_STRING_CALLBACK {
        /**
         * Creates a WS_DYNAMIC_STRING_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WS_XML_STRING, BOOL, "uint*", WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WS_XML_STRING.Ptr, BOOL.Ptr, "uint*", WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
