#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HGROUP.ahk" { HGROUP }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_SET_GROUP_DEPENDENCY_EXPRESSION {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_SET_GROUP_DEPENDENCY_EXPRESSION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HGROUP} _hGroupSet 
     * @param {PWSTR} lpszDependencyExpression 
     * @returns {Integer} 
     */
    Call(_hGroupSet, lpszDependencyExpression) {
        lpszDependencyExpression := lpszDependencyExpression is String ? StrPtr(lpszDependencyExpression) : lpszDependencyExpression

        result := DllCall(this.value, HGROUP, _hGroupSet, "ptr", lpszDependencyExpression, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_SET_GROUP_DEPENDENCY_EXPRESSION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_SET_GROUP_DEPENDENCY_EXPRESSION {
        /**
         * Creates a PCLUSAPI_SET_GROUP_DEPENDENCY_EXPRESSION pointer that invokes the given AHK function when called.
         * @param {Func(HGROUP, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUP, PWSTR, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
