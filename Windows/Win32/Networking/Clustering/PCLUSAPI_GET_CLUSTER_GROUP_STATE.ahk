#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CLUSTER_GROUP_STATE.ahk" { CLUSTER_GROUP_STATE }
#Import ".\HGROUP.ahk" { HGROUP }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_GROUP_STATE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_GROUP_STATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HGROUP} _hGroup 
     * @param {PWSTR} lpszNodeName 
     * @param {Pointer<Integer>} lpcchNodeName 
     * @returns {CLUSTER_GROUP_STATE} 
     */
    Call(_hGroup, lpszNodeName, lpcchNodeName) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName

        lpcchNodeNameMarshal := lpcchNodeName is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HGROUP, _hGroup, "ptr", lpszNodeName, lpcchNodeNameMarshal, lpcchNodeName, CLUSTER_GROUP_STATE)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_GROUP_STATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_GROUP_STATE {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_GROUP_STATE pointer that invokes the given AHK function when called.
         * @param {Func(HGROUP, PWSTR, "uint*") => CLUSTER_GROUP_STATE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HGROUP, PWSTR, "uint*", CLUSTER_GROUP_STATE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
