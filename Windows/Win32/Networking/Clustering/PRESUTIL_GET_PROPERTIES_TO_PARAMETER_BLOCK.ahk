#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\RESUTIL_PROPERTY_ITEM.ahk" { RESUTIL_PROPERTY_ITEM }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_PROPERTIES_TO_PARAMETER_BLOCK {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_PROPERTIES_TO_PARAMETER_BLOCK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HKEY} hkeyClusterKey 
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable 
     * @param {Pointer<Integer>} pOutParams 
     * @param {BOOL} bCheckForRequiredProperties 
     * @param {Pointer<PWSTR>} pszNameOfPropInError 
     * @returns {Integer} 
     */
    Call(hkeyClusterKey, pPropertyTable, pOutParams, bCheckForRequiredProperties, pszNameOfPropInError) {
        pOutParamsMarshal := pOutParams is VarRef ? "char*" : "ptr"
        pszNameOfPropInErrorMarshal := pszNameOfPropInError is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HKEY, hkeyClusterKey, RESUTIL_PROPERTY_ITEM.Ptr, pPropertyTable, pOutParamsMarshal, pOutParams, BOOL, bCheckForRequiredProperties, pszNameOfPropInErrorMarshal, pszNameOfPropInError, UInt32)
        return result
    }

    /**
     * A PRESUTIL_GET_PROPERTIES_TO_PARAMETER_BLOCK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_PROPERTIES_TO_PARAMETER_BLOCK {
        /**
         * Creates a PRESUTIL_GET_PROPERTIES_TO_PARAMETER_BLOCK pointer that invokes the given AHK function when called.
         * @param {Func(HKEY, RESUTIL_PROPERTY_ITEM, "char*", BOOL, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HKEY, RESUTIL_PROPERTY_ITEM.Ptr, "char*", BOOL, PWSTR.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
