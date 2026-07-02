#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_SZ.ahk" { CLUSPROP_SZ }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_SZ_PROPERTY {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_SZ_PROPERTY) {
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
     * @param {Pointer<CLUSPROP_SZ>} pValueStruct 
     * @param {PWSTR} pszOldValue 
     * @param {Integer} ppPropertyList 
     * @param {Pointer<Integer>} pcbPropertyListSize 
     * @returns {Integer} 
     */
    Call(ppszOutValue, pValueStruct, pszOldValue, ppPropertyList, pcbPropertyListSize) {
        pszOldValue := pszOldValue is String ? StrPtr(pszOldValue) : pszOldValue

        ppszOutValueMarshal := ppszOutValue is VarRef ? "ptr*" : "ptr"
        pcbPropertyListSizeMarshal := pcbPropertyListSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, ppszOutValueMarshal, ppszOutValue, CLUSPROP_SZ.Ptr, pValueStruct, "ptr", pszOldValue, IntPtr, ppPropertyList, pcbPropertyListSizeMarshal, pcbPropertyListSize, UInt32)
        return result
    }

    /**
     * A PRESUTIL_GET_SZ_PROPERTY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_SZ_PROPERTY {
        /**
         * Creates a PRESUTIL_GET_SZ_PROPERTY pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, CLUSPROP_SZ, PWSTR, IntPtr, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR.Ptr, CLUSPROP_SZ.Ptr, PWSTR, IntPtr, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
