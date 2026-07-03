#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_PFN_REASON_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_PFN_REASON_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} lpParameter 
     * @param {HCLUSTER} _hCluster 
     * @param {PWSTR} szReason 
     * @param {Pointer<Integer>} lpSize 
     * @returns {BOOL} 
     */
    Call(lpParameter, _hCluster, szReason, lpSize) {
        szReason := szReason is String ? StrPtr(szReason) : szReason

        lpParameterMarshal := lpParameter is VarRef ? "ptr" : "ptr"
        lpSizeMarshal := lpSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, lpParameterMarshal, lpParameter, HCLUSTER, _hCluster, "ptr", szReason, lpSizeMarshal, lpSize, BOOL)
        return result
    }

    /**
     * A PCLUSAPI_PFN_REASON_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_PFN_REASON_HANDLER {
        /**
         * Creates a PCLUSAPI_PFN_REASON_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", HCLUSTER, PWSTR, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", HCLUSTER, PWSTR, "uint*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
