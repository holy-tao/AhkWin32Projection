#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HNODEENUM.ahk" { HNODEENUM }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_NODE_ENUM {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_NODE_ENUM) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HNODEENUM} _hNodeEnum 
     * @param {Integer} dwIndex 
     * @param {Pointer<Integer>} lpdwType 
     * @param {PWSTR} lpszName 
     * @param {Pointer<Integer>} lpcchName 
     * @returns {Integer} 
     */
    Call(_hNodeEnum, dwIndex, lpdwType, lpszName, lpcchName) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        lpdwTypeMarshal := lpdwType is VarRef ? "uint*" : "ptr"
        lpcchNameMarshal := lpcchName is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HNODEENUM, _hNodeEnum, UInt32, dwIndex, lpdwTypeMarshal, lpdwType, "ptr", lpszName, lpcchNameMarshal, lpcchName, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_NODE_ENUM that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_NODE_ENUM {
        /**
         * Creates a PCLUSAPI_CLUSTER_NODE_ENUM pointer that invokes the given AHK function when called.
         * @param {Func(HNODEENUM, UInt32, "uint*", PWSTR, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HNODEENUM, UInt32, "uint*", PWSTR, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
