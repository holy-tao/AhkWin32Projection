#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HRESOURCE.ahk" { HRESOURCE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_NAME {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_NAME) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCLUSTER} _hCluster 
     * @param {HANDLE} hSelf 
     * @param {PWSTR} lpszResourceType 
     * @param {BOOL} bRecurse 
     * @returns {HRESOURCE} 
     */
    Call(_hCluster, hSelf, lpszResourceType, bRecurse) {
        lpszResourceType := lpszResourceType is String ? StrPtr(lpszResourceType) : lpszResourceType

        result := DllCall(this.value, HCLUSTER, _hCluster, HANDLE, hSelf, "ptr", lpszResourceType, BOOL, bRecurse, HRESOURCE)
        return result
    }

    /**
     * A PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_NAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_NAME {
        /**
         * Creates a PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_NAME pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, HANDLE, PWSTR, BOOL) => HRESOURCE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, HANDLE, PWSTR, BOOL, HRESOURCE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
