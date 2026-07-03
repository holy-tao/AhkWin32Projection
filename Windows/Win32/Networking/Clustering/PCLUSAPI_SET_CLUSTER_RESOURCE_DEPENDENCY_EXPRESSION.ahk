#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_SET_CLUSTER_RESOURCE_DEPENDENCY_EXPRESSION {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_SET_CLUSTER_RESOURCE_DEPENDENCY_EXPRESSION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRESOURCE} _hResource 
     * @param {PWSTR} lpszDependencyExpression 
     * @returns {Integer} 
     */
    Call(_hResource, lpszDependencyExpression) {
        lpszDependencyExpression := lpszDependencyExpression is String ? StrPtr(lpszDependencyExpression) : lpszDependencyExpression

        result := DllCall(this.value, HRESOURCE, _hResource, "ptr", lpszDependencyExpression, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_SET_CLUSTER_RESOURCE_DEPENDENCY_EXPRESSION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_SET_CLUSTER_RESOURCE_DEPENDENCY_EXPRESSION {
        /**
         * Creates a PCLUSAPI_SET_CLUSTER_RESOURCE_DEPENDENCY_EXPRESSION pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, PWSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
