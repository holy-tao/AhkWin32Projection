#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpszResourceName 
     * @param {PWSTR} lpszResourceType 
     * @returns {HRESOURCE} 
     */
    Call(lpszResourceName, lpszResourceType) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName
        lpszResourceType := lpszResourceType is String ? StrPtr(lpszResourceType) : lpszResourceType

        result := DllCall(this.value, "ptr", lpszResourceName, "ptr", lpszResourceType, HRESOURCE)
        return result
    }

    /**
     * A PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY {
        /**
         * Creates a PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR) => HRESOURCE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, HRESOURCE])
        }

        __Delete() => CallbackFree(this.value)
    }
}
