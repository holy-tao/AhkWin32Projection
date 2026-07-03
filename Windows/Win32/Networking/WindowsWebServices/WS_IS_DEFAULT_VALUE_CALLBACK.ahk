#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }

/**
 * Determines if a value is the default value.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_is_default_value_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_IS_DEFAULT_VALUE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_IS_DEFAULT_VALUE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} descriptionData This is the value of the descriptionData field from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_custom_type_description">WS_CUSTOM_TYPE_DESCRIPTION</a>.
     *                     The callback can use this to access any additional information about the type.
     * @param {Integer} value A pointer to the value being serialized.
     * @param {Integer} defaultValue A pointer to the default value.  If no default value was specified
     *                     for the field, this parameter will be <b>NULL</b>.
     *                 
     * 
     * If the parameter is non-<b>NULL</b>, the callback should compare the two 
     *                     values field-by-field according to the custom type.  If the 
     *                     fields match, then the isDefault parameter should be set to <b>TRUE</b>.
     *                 
     * 
     * If the parameter is <b>NULL</b>, the callback should compare the fields
     *                     of the value with zero.  If the fields match, then the isDefault
     *                     parameter should be set to <b>TRUE</b>.
     * @param {Integer} valueSize The size, in bytes, of the value being serialized.
     * @param {Pointer<WS_ERROR>} _error Specifies where additional error information should be stored if the function fails.
     * @returns {BOOL} Whether or not the value is the default value.
     */
    Call(descriptionData, value, defaultValue, valueSize, _error) {
        descriptionDataMarshal := descriptionData is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, descriptionDataMarshal, descriptionData, IntPtr, value, IntPtr, defaultValue, UInt32, valueSize, BOOL.Ptr, &isDefault := 0, _errorMarshal, _error, "HRESULT")
        return isDefault
    }

    /**
     * A WS_IS_DEFAULT_VALUE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_IS_DEFAULT_VALUE_CALLBACK {
        /**
         * Creates a WS_IS_DEFAULT_VALUE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, IntPtr, UInt32, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, IntPtr, UInt32, WS_ERROR.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
