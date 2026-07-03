#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RESUTIL_PROPERTY_ITEM.ahk" { RESUTIL_PROPERTY_ITEM }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_PROPERTY_LIST_FROM_PARAMETER_BLOCK {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_PROPERTY_LIST_FROM_PARAMETER_BLOCK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable 
     * @param {Integer} pOutPropertyList 
     * @param {Pointer<Integer>} pcbOutPropertyListSize 
     * @param {Pointer<Integer>} pInParams 
     * @param {Pointer<Integer>} pcbBytesReturned 
     * @param {Pointer<Integer>} pcbRequired 
     * @returns {Integer} 
     */
    Call(pPropertyTable, pOutPropertyList, pcbOutPropertyListSize, pInParams, pcbBytesReturned, pcbRequired) {
        pcbOutPropertyListSizeMarshal := pcbOutPropertyListSize is VarRef ? "uint*" : "ptr"
        pInParamsMarshal := pInParams is VarRef ? "char*" : "ptr"
        pcbBytesReturnedMarshal := pcbBytesReturned is VarRef ? "uint*" : "ptr"
        pcbRequiredMarshal := pcbRequired is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, RESUTIL_PROPERTY_ITEM.Ptr, pPropertyTable, IntPtr, pOutPropertyList, pcbOutPropertyListSizeMarshal, pcbOutPropertyListSize, pInParamsMarshal, pInParams, pcbBytesReturnedMarshal, pcbBytesReturned, pcbRequiredMarshal, pcbRequired, UInt32)
        return result
    }

    /**
     * A PRESUTIL_PROPERTY_LIST_FROM_PARAMETER_BLOCK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_PROPERTY_LIST_FROM_PARAMETER_BLOCK {
        /**
         * Creates a PRESUTIL_PROPERTY_LIST_FROM_PARAMETER_BLOCK pointer that invokes the given AHK function when called.
         * @param {Func(RESUTIL_PROPERTY_ITEM, IntPtr, "uint*", "char*", "uint*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RESUTIL_PROPERTY_ITEM.Ptr, IntPtr, "uint*", "char*", "uint*", "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
