#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_RESOURCE_TYPES_EQUAL {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_RESOURCE_TYPES_EQUAL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpszResourceTypeName 
     * @param {HRESOURCE} _hResource 
     * @returns {BOOL} 
     */
    Call(lpszResourceTypeName, _hResource) {
        lpszResourceTypeName := lpszResourceTypeName is String ? StrPtr(lpszResourceTypeName) : lpszResourceTypeName

        result := DllCall(this.value, "ptr", lpszResourceTypeName, HRESOURCE, _hResource, BOOL)
        return result
    }

    /**
     * A PRESUTIL_RESOURCE_TYPES_EQUAL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_RESOURCE_TYPES_EQUAL {
        /**
         * Creates a PRESUTIL_RESOURCE_TYPES_EQUAL pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, HRESOURCE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, HRESOURCE, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
