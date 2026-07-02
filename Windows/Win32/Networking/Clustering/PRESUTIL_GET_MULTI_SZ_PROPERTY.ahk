#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_SZ.ahk" { CLUSPROP_SZ }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_MULTI_SZ_PROPERTY {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_MULTI_SZ_PROPERTY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszOutValue 
     * @param {Pointer<Integer>} pcbOutValueSize 
     * @param {Pointer<CLUSPROP_SZ>} pValueStruct 
     * @param {Integer} pszOldValue 
     * @param {Integer} cbOldValueSize 
     * @param {Integer} ppPropertyList 
     * @param {Pointer<Integer>} pcbPropertyListSize 
     * @returns {Integer} 
     */
    Call(ppszOutValue, pcbOutValueSize, pValueStruct, pszOldValue, cbOldValueSize, ppPropertyList, pcbPropertyListSize) {
        ppszOutValueMarshal := ppszOutValue is VarRef ? "ptr*" : "ptr"
        pcbOutValueSizeMarshal := pcbOutValueSize is VarRef ? "uint*" : "ptr"
        pcbPropertyListSizeMarshal := pcbPropertyListSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, ppszOutValueMarshal, ppszOutValue, pcbOutValueSizeMarshal, pcbOutValueSize, CLUSPROP_SZ.Ptr, pValueStruct, IntPtr, pszOldValue, UInt32, cbOldValueSize, IntPtr, ppPropertyList, pcbPropertyListSizeMarshal, pcbPropertyListSize, UInt32)
        return result
    }

    /**
     * A PRESUTIL_GET_MULTI_SZ_PROPERTY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_MULTI_SZ_PROPERTY {
        /**
         * Creates a PRESUTIL_GET_MULTI_SZ_PROPERTY pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, "uint*", CLUSPROP_SZ, IntPtr, UInt32, IntPtr, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR.Ptr, "uint*", CLUSPROP_SZ.Ptr, IntPtr, UInt32, IntPtr, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
