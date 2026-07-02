#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\CLUSPROP_FILETIME.ahk" { CLUSPROP_FILETIME }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_FILETIME_PROPERTY {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_FILETIME_PROPERTY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pftOutValue 
     * @param {Pointer<CLUSPROP_FILETIME>} pValueStruct 
     * @param {FILETIME} ftOldValue 
     * @param {FILETIME} ftMinimum 
     * @param {FILETIME} ftMaximum 
     * @param {Pointer<Pointer<Integer>>} ppPropertyList 
     * @param {Pointer<Integer>} pcbPropertyListSize 
     * @returns {Integer} 
     */
    Call(pftOutValue, pValueStruct, ftOldValue, ftMinimum, ftMaximum, ppPropertyList, pcbPropertyListSize) {
        ppPropertyListMarshal := ppPropertyList is VarRef ? "ptr*" : "ptr"
        pcbPropertyListSizeMarshal := pcbPropertyListSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, FILETIME.Ptr, pftOutValue, CLUSPROP_FILETIME.Ptr, pValueStruct, FILETIME, ftOldValue, FILETIME, ftMinimum, FILETIME, ftMaximum, ppPropertyListMarshal, ppPropertyList, pcbPropertyListSizeMarshal, pcbPropertyListSize, UInt32)
        return result
    }

    /**
     * A PRESUTIL_GET_FILETIME_PROPERTY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_FILETIME_PROPERTY {
        /**
         * Creates a PRESUTIL_GET_FILETIME_PROPERTY pointer that invokes the given AHK function when called.
         * @param {Func(FILETIME, CLUSPROP_FILETIME, FILETIME, FILETIME, FILETIME, "ptr*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FILETIME.Ptr, CLUSPROP_FILETIME.Ptr, FILETIME, FILETIME, FILETIME, "ptr*", "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
