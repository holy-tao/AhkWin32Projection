#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import ".\WLDP_SECURE_SETTING_VALUE_TYPE.ahk" { WLDP_SECURE_SETTING_VALUE_TYPE }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PWLDP_QUERYSECURITYPOLICY_API {
    value : IntPtr

    __value {
        set {
            if (value is PWLDP_QUERYSECURITYPOLICY_API) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} providerName 
     * @param {Pointer<UNICODE_STRING>} keyName 
     * @param {Pointer<UNICODE_STRING>} _valueName 
     * @param {Integer} valueAddress 
     * @param {Pointer<Integer>} valueSize 
     * @returns {WLDP_SECURE_SETTING_VALUE_TYPE} 
     */
    Call(providerName, keyName, _valueName, valueAddress, valueSize) {
        valueSizeMarshal := valueSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UNICODE_STRING.Ptr, providerName, UNICODE_STRING.Ptr, keyName, UNICODE_STRING.Ptr, _valueName, "int*", &valueType := 0, IntPtr, valueAddress, valueSizeMarshal, valueSize, "HRESULT")
        return valueType
    }

    /**
     * A PWLDP_QUERYSECURITYPOLICY_API that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLDP_QUERYSECURITYPOLICY_API {
        /**
         * Creates a PWLDP_QUERYSECURITYPOLICY_API pointer that invokes the given AHK function when called.
         * @param {Func(UNICODE_STRING, UNICODE_STRING, UNICODE_STRING, IntPtr, "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UNICODE_STRING.Ptr, UNICODE_STRING.Ptr, UNICODE_STRING.Ptr, IntPtr, "uint*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
