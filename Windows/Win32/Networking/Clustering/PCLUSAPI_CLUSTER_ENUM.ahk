#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSENUM.ahk" { HCLUSENUM }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_CLUSTER_ENUM {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_CLUSTER_ENUM) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCLUSENUM} hEnum 
     * @param {Integer} dwIndex 
     * @param {Pointer<Integer>} lpdwType 
     * @param {PWSTR} lpszName 
     * @param {Pointer<Integer>} lpcchName 
     * @returns {Integer} 
     */
    Call(hEnum, dwIndex, lpdwType, lpszName, lpcchName) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        lpdwTypeMarshal := lpdwType is VarRef ? "uint*" : "ptr"
        lpcchNameMarshal := lpcchName is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HCLUSENUM, hEnum, UInt32, dwIndex, lpdwTypeMarshal, lpdwType, "ptr", lpszName, lpcchNameMarshal, lpcchName, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_CLUSTER_ENUM that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_CLUSTER_ENUM {
        /**
         * Creates a PCLUSAPI_CLUSTER_ENUM pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSENUM, UInt32, "uint*", PWSTR, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSENUM, UInt32, "uint*", PWSTR, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
