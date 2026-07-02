#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESOURCE.ahk" { HRESOURCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY_EX {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY_EX) {
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
     * @param {Integer} dwDesiredAccess 
     * @returns {HRESOURCE} 
     */
    Call(lpszResourceName, lpszResourceType, dwDesiredAccess) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName
        lpszResourceType := lpszResourceType is String ? StrPtr(lpszResourceType) : lpszResourceType

        result := DllCall(this.value, "ptr", lpszResourceName, "ptr", lpszResourceType, UInt32, dwDesiredAccess, HRESOURCE)
        return result
    }

    /**
     * A PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY_EX {
        /**
         * Creates a PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY_EX pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, UInt32) => HRESOURCE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, UInt32, HRESOURCE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
