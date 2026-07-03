#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_BINARY.ahk" { CLUSPROP_BINARY }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_BINARY_PROPERTY {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_BINARY_PROPERTY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppbOutValue 
     * @param {Pointer<Integer>} pcbOutValueSize 
     * @param {Pointer<CLUSPROP_BINARY>} pValueStruct 
     * @param {Integer} pbOldValue 
     * @param {Integer} cbOldValueSize 
     * @param {Integer} ppPropertyList 
     * @param {Pointer<Integer>} pcbPropertyListSize 
     * @returns {Integer} 
     */
    Call(ppbOutValue, pcbOutValueSize, pValueStruct, pbOldValue, cbOldValueSize, ppPropertyList, pcbPropertyListSize) {
        ppbOutValueMarshal := ppbOutValue is VarRef ? "ptr*" : "ptr"
        pcbOutValueSizeMarshal := pcbOutValueSize is VarRef ? "uint*" : "ptr"
        pcbPropertyListSizeMarshal := pcbPropertyListSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, ppbOutValueMarshal, ppbOutValue, pcbOutValueSizeMarshal, pcbOutValueSize, CLUSPROP_BINARY.Ptr, pValueStruct, IntPtr, pbOldValue, UInt32, cbOldValueSize, IntPtr, ppPropertyList, pcbPropertyListSizeMarshal, pcbPropertyListSize, UInt32)
        return result
    }

    /**
     * A PRESUTIL_GET_BINARY_PROPERTY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_BINARY_PROPERTY {
        /**
         * Creates a PRESUTIL_GET_BINARY_PROPERTY pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", "uint*", CLUSPROP_BINARY, IntPtr, UInt32, IntPtr, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", "uint*", CLUSPROP_BINARY.Ptr, IntPtr, UInt32, IntPtr, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
