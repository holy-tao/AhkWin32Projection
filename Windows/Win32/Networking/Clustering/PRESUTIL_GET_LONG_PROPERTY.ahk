#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_LONG.ahk" { CLUSPROP_LONG }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_LONG_PROPERTY {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_LONG_PROPERTY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} plOutValue 
     * @param {Pointer<CLUSPROP_LONG>} pValueStruct 
     * @param {Integer} lOldValue 
     * @param {Integer} lMinimum 
     * @param {Integer} lMaximum 
     * @param {Pointer<Pointer<Integer>>} ppPropertyList 
     * @param {Pointer<Integer>} pcbPropertyListSize 
     * @returns {Integer} 
     */
    Call(plOutValue, pValueStruct, lOldValue, lMinimum, lMaximum, ppPropertyList, pcbPropertyListSize) {
        plOutValueMarshal := plOutValue is VarRef ? "int*" : "ptr"
        ppPropertyListMarshal := ppPropertyList is VarRef ? "ptr*" : "ptr"
        pcbPropertyListSizeMarshal := pcbPropertyListSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, plOutValueMarshal, plOutValue, CLUSPROP_LONG.Ptr, pValueStruct, Int32, lOldValue, Int32, lMinimum, Int32, lMaximum, ppPropertyListMarshal, ppPropertyList, pcbPropertyListSizeMarshal, pcbPropertyListSize, UInt32)
        return result
    }

    /**
     * A PRESUTIL_GET_LONG_PROPERTY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_LONG_PROPERTY {
        /**
         * Creates a PRESUTIL_GET_LONG_PROPERTY pointer that invokes the given AHK function when called.
         * @param {Func("int*", CLUSPROP_LONG, Int32, Int32, Int32, "ptr*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int*", CLUSPROP_LONG.Ptr, Int32, Int32, Int32, "ptr*", "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
