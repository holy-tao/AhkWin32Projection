#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_DWORD.ahk" { CLUSPROP_DWORD }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_DWORD_PROPERTY {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_DWORD_PROPERTY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwOutValue 
     * @param {Pointer<CLUSPROP_DWORD>} pValueStruct 
     * @param {Integer} dwOldValue 
     * @param {Integer} dwMinimum 
     * @param {Integer} dwMaximum 
     * @param {Pointer<Pointer<Integer>>} ppPropertyList 
     * @param {Pointer<Integer>} pcbPropertyListSize 
     * @returns {Integer} 
     */
    Call(pdwOutValue, pValueStruct, dwOldValue, dwMinimum, dwMaximum, ppPropertyList, pcbPropertyListSize) {
        pdwOutValueMarshal := pdwOutValue is VarRef ? "uint*" : "ptr"
        ppPropertyListMarshal := ppPropertyList is VarRef ? "ptr*" : "ptr"
        pcbPropertyListSizeMarshal := pcbPropertyListSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, pdwOutValueMarshal, pdwOutValue, CLUSPROP_DWORD.Ptr, pValueStruct, UInt32, dwOldValue, UInt32, dwMinimum, UInt32, dwMaximum, ppPropertyListMarshal, ppPropertyList, pcbPropertyListSizeMarshal, pcbPropertyListSize, UInt32)
        return result
    }

    /**
     * A PRESUTIL_GET_DWORD_PROPERTY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_DWORD_PROPERTY {
        /**
         * Creates a PRESUTIL_GET_DWORD_PROPERTY pointer that invokes the given AHK function when called.
         * @param {Func("uint*", CLUSPROP_DWORD, UInt32, UInt32, UInt32, "ptr*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["uint*", CLUSPROP_DWORD.Ptr, UInt32, UInt32, UInt32, "ptr*", "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
